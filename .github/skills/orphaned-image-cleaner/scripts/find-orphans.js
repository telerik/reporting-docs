#!/usr/bin/env node

/**
 * Orphaned Image Finder for Documentation
 *
 * Scans the repository for image files not referenced by any markdown,
 * HTML, or YAML file. Outputs a report grouped by folder.
 *
 * Usage:
 *   node find-orphans.js [root-dir] [--json]
 *
 * Arguments:
 *   [root-dir]   Repository root (default: current directory)
 *   --json       Output results as JSON instead of a table
 *
 * Exit codes:
 *   0  No orphans found
 *   1  Orphans found (report printed)
 *   2  Error
 */

const fs = require("fs");
const path = require("path");

// --- Configuration ---

const IMAGE_EXTENSIONS = new Set([".png", ".jpg", ".jpeg", ".gif"]);
const SKIP_DIR_PREFIXES = ["_", "node_modules", ".git", ".github"];

// Patterns that extract image references from content files.
// Each captures the path portion (e.g. "images/foo.png" or "resources/bar.jpg").
const REF_PATTERNS = [
	// Markdown: ![alt](path) — captures the path inside parens
	/!\[[^\]]*\]\(([^)]*\.(?:png|jpg|jpeg|gif))\s*\)/gi,
	// HTML: <img ... src="path" ...>
	/<img[^>]+src=["']([^"']*\.(?:png|jpg|jpeg|gif))["'][^>]*>/gi,
	// YAML/plain: bare references like images/foo.png or resources/bar.png
	/(?:images|resources)\/[^\s)"']*\.(?:png|jpg|jpeg|gif)/gi,
];

// Files/dirs whose contents should be scanned for references
const SCAN_GLOBS = {
	extensions: new Set([".md", ".html"]),
	// Always scan these even though they start with _
	includeDirs: new Set(["_includes", "_layouts", "_r_includes"]),
};

// --- Helpers ---

function parseArgs(argv) {
	const args = argv.slice(2);
	let rootDir = ".";
	let jsonOutput = false;

	for (const arg of args) {
		if (arg === "--json") {
			jsonOutput = true;
		} else if (!arg.startsWith("-")) {
			rootDir = arg;
		}
	}

	return { rootDir: path.resolve(rootDir), jsonOutput };
}

function shouldSkipDir(dirName, parentIsRoot) {
	if (dirName === ".git" || dirName === "node_modules") return true;
	// Skip _-prefixed dirs UNLESS they are in the include list
	if (dirName.startsWith("_")) {
		return !SCAN_GLOBS.includeDirs.has(dirName) || !parentIsRoot;
	}
	return false;
}

function shouldSkipDirForImages(dirName) {
	return SKIP_DIR_PREFIXES.some((p) => dirName.startsWith(p));
}

function walkDir(dir, callback, skipFn, isRoot = true) {
	let entries;
	try {
		entries = fs.readdirSync(dir, { withFileTypes: true });
	} catch (err) {
		process.stderr.write(`Warning: Cannot read directory ${dir}: ${err.message}\n`);
		return;
	}
	for (const entry of entries) {
		const fullPath = path.join(dir, entry.name);
		if (entry.isDirectory()) {
			if (!skipFn(entry.name, isRoot)) {
				walkDir(fullPath, callback, skipFn, false);
			}
		} else if (entry.isFile()) {
			callback(fullPath);
		}
	}
}

function formatBytes(bytes) {
	if (bytes < 1024) return `${bytes} B`;
	if (bytes < 1024 * 1024) return `${(bytes / 1024).toFixed(1)} KB`;
	return `${(bytes / (1024 * 1024)).toFixed(2)} MB`;
}

// --- Core Logic ---

/**
 * Step 1: Collect all image files, excluding _-prefixed directories.
 */
function collectImages(rootDir) {
	const images = []; // { fullPath, relativePath, filename, size }
	walkDir(
		rootDir,
		(filePath) => {
			const ext = path.extname(filePath).toLowerCase();
			if (IMAGE_EXTENSIONS.has(ext)) {
				const stat = fs.statSync(filePath);
				const relativePath = path.relative(rootDir, filePath).replace(/\\/g, "/");
				images.push({
					fullPath: filePath,
					relativePath,
					filename: path.basename(filePath),
					size: stat.size,
				});
			}
		},
		shouldSkipDirForImages
	);
	return images;
}

/**
 * Step 2: Collect all image references from content files.
 * Returns a Set of referenced filenames and a Set of resolved absolute
 * repo-relative paths (e.g. "report-items/map/map-types/images/Foo.png").
 */
function collectReferences(rootDir) {
	const referencedFilenames = new Set();
	const referencedPaths = new Set();

	walkDir(
		rootDir,
		(filePath) => {
			const ext = path.extname(filePath).toLowerCase();
			if (!SCAN_GLOBS.extensions.has(ext)) return;

			let content;
			try {
				content = fs.readFileSync(filePath, "utf-8");
			} catch (err) {
				process.stderr.write(`Warning: Cannot read file ${filePath}: ${err.message}\n`);
				return;
			}

			const fileDir = path.dirname(filePath);

			for (const pattern of REF_PATTERNS) {
				// Reset lastIndex for global patterns
				pattern.lastIndex = 0;
				let match;
				while ((match = pattern.exec(content)) !== null) {
					// For the YAML/plain pattern (index 2), match[0] is the full match
					// For the others, match[1] is the captured path
					const refPath = match[1] || match[0];

					const filename = path.basename(refPath);
					referencedFilenames.add(filename.toLowerCase());

					// Resolve relative to the file that contains the reference,
					// then make it relative to the repo root. This gives us an
					// exact repo-relative path we can match against image paths.
					const resolved = path.resolve(fileDir, refPath);
					const repoRelative = path.relative(rootDir, resolved).replace(/\\/g, "/");
					referencedPaths.add(repoRelative.toLowerCase());
				}
			}
		},
		shouldSkipDir
	);

	// Also scan docs-builder.yml and _config.yml at root
	for (const configFile of ["docs-builder.yml", "_config.yml", "docs-builder-pdf.yml"]) {
		const configPath = path.join(rootDir, configFile);
		if (fs.existsSync(configPath)) {
			try {
				const content = fs.readFileSync(configPath, "utf-8");
				for (const pattern of REF_PATTERNS) {
					pattern.lastIndex = 0;
					let match;
					while ((match = pattern.exec(content)) !== null) {
						const refPath = match[1] || match[0];
						referencedFilenames.add(path.basename(refPath).toLowerCase());
						const resolved = path.resolve(rootDir, refPath);
						const repoRelative = path.relative(rootDir, resolved).replace(/\\/g, "/");
						referencedPaths.add(repoRelative.toLowerCase());
					}
				}
			} catch (err) {
				process.stderr.write(`Warning: Cannot read config ${configFile}: ${err.message}\n`);
			}
		}
	}

	return { referencedFilenames, referencedPaths };
}

/**
 * Step 3: Cross-reference images against references.
 *
 * Strategy: first check if the image's exact repo-relative path appears in
 * the resolved reference paths. If yes, it's definitively referenced.
 * If no exact path match, fall back to filename match — but only if the
 * filename is unique across the repo. If the filename is shared by multiple
 * images and none matches by path, the image is orphaned.
 */
function findOrphans(images, references) {
	const { referencedFilenames, referencedPaths } = references;

	const orphans = [];
	const referenced = [];

	for (const img of images) {
		const relLower = img.relativePath.toLowerCase();
		const fnLower = img.filename.toLowerCase();

		// Exact path match — the reference was resolved to this specific file
		if (referencedPaths.has(relLower)) {
			referenced.push(img);
			continue;
		}

		// No exact path match. Check if filename is referenced at all.
		if (referencedFilenames.has(fnLower)) {
			// Filename matches but path doesn't. This means a different copy
			// of the same filename is the one actually referenced.
			orphans.push(img);
			continue;
		}

		// Filename not referenced anywhere — definitely orphaned
		orphans.push(img);
	}

	return { orphans, referenced };
}

// --- Output ---

function printTable(orphans, images, rootDir) {
	// Group by directory
	const byDir = new Map();
	for (const img of orphans) {
		const dir = path.dirname(img.relativePath);
		if (!byDir.has(dir)) byDir.set(dir, []);
		byDir.get(dir).push(img);
	}

	// Sort groups by total size (largest first)
	const sortedDirs = [...byDir.entries()].sort((a, b) => {
		const sizeA = a[1].reduce((s, i) => s + i.size, 0);
		const sizeB = b[1].reduce((s, i) => s + i.size, 0);
		return sizeB - sizeA;
	});

	const totalSize = orphans.reduce((s, i) => s + i.size, 0);
	const referencedCount = images.length - orphans.length;

	console.log("Orphaned Image Report");
	console.log("=".repeat(80));
	console.log(`Repository: ${rootDir}`);
	console.log(`Total images scanned: ${images.length}`);
	console.log(`Referenced images: ${referencedCount}`);
	console.log(`Orphaned images: ${orphans.length}`);
	console.log(`Potential space savings: ${formatBytes(totalSize)}`);
	console.log("=".repeat(80));
	console.log();

	if (orphans.length === 0) {
		console.log("No orphaned images found.");
		return;
	}

	for (const [dir, dirOrphans] of sortedDirs) {
		// Sort by size within directory
		dirOrphans.sort((a, b) => b.size - a.size);
		const dirTotal = dirOrphans.reduce((s, i) => s + i.size, 0);

		console.log(`## ${dir}/ (${dirOrphans.length} orphans, ${formatBytes(dirTotal)})`);
		console.log("-".repeat(80));
		console.log(
			"File".padEnd(50) +
			"Size"
		);
		console.log("-".repeat(80));

		for (const img of dirOrphans) {
			const name = img.filename.length > 48
				? "..." + img.filename.slice(-45)
				: img.filename;
			console.log(
				`${name.padEnd(50)}${formatBytes(img.size).padEnd(12)}`
			);
		}
		console.log();
	}
}

function printJson(orphans, images) {
	const result = {
		summary: {
			totalImages: images.length,
			referencedImages: images.length - orphans.length,
			orphanedImages: orphans.length,
			potentialSavingsBytes: orphans.reduce((s, i) => s + i.size, 0),
		},
		orphans: orphans.map((img) => ({
			path: img.relativePath,
			filename: img.filename,
			sizeBytes: img.size,
		})),
	};
	console.log(JSON.stringify(result, null, 2));
}

// --- Main ---

function main() {
	const { rootDir, jsonOutput } = parseArgs(process.argv);

	if (!fs.existsSync(rootDir)) {
		console.error(`Error: Directory not found: ${rootDir}`);
		process.exit(2);
	}

	process.stderr.write("Collecting images...\n");
	const images = collectImages(rootDir);
	process.stderr.write(`Found ${images.length} images.\n`);

	process.stderr.write("Scanning references in content files...\n");
	const references = collectReferences(rootDir);
	process.stderr.write(
		`Found ${references.referencedFilenames.size} unique referenced filenames.\n`
	);

	process.stderr.write("Cross-referencing...\n");
	const { orphans } = findOrphans(images, references);

	if (jsonOutput) {
		printJson(orphans, images);
	} else {
		printTable(orphans, images, rootDir);
	}

	process.exit(orphans.length > 0 ? 1 : 0);
}

main();
