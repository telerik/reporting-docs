---
name: docs-build-toolkit
description: "Build and serve the Telerik Reporting documentation site locally. Covers dev builds, production builds, metadata generation, and troubleshooting. Use when: docs build, dev build, production build, serve docs, docfx metadata, API reference, clean cache, docs-builder."
---

# Docs Build Toolkit

Procedures for building and serving the Telerik Reporting documentation site locally using docs-builder.

## Repository Layout

The following repos must be cloned as siblings:

```
<parent>/
├── reporting/          # Product repo (needed for code snippets & API metadata)
├── reporting-docs/     # Documentation content (this repo)
└── docs-builder/       # Gatsby-based build engine
```

Default assumed layout — all repos are siblings in the same parent directory. All paths below are **relative to reporting-docs** (this repo):

- **docs-builder**: `../docs-builder`
- **reporting**: `../reporting`

## Prerequisites

Before any build, verify:

1. **docs-builder** repo is cloned and has node modules installed. If not:
   ```
   cd ../docs-builder
   npm ci
   ```
2. For production builds: **docfx** is installed (`dotnet tool install -g docfx`).
3. For production builds: Reporting assemblies (DLLs) exist in `_assetsApi/Bin/`. See [Downloading Assemblies](#downloading-assemblies-for-metadata).

---

## Dev Build (No Metadata Required)

A dev build starts Gatsby in development mode with hot reload. No API reference metadata is needed.

### Steps

1. Open a terminal in the **reporting-docs** directory.
2. Navigate to the docs-builder directory:
   ```
   cd ../docs-builder
   ```
3. Run the develop command:
   ```
   npm run develop --docsPath=../reporting-docs
   ```
4. The site will be available at **http://localhost:8000**.

### Notes

- Changes to markdown files in reporting-docs are reflected immediately (hot reload).
- The site will NOT have API Reference pages — expect `/api/` link errors in the output. This is normal.
- If content renders correctly in dev mode, it will look the same in production.
- To stop the server, press `Ctrl+C` in the terminal.

---

## Production Build (Requires Metadata)

A production build generates the full site including API Reference. It requires docfx metadata.

> **Metadata reuse:** Before generating metadata, check if `_assetsApi/metadata/` already exists and contains `.yml` files. If it does, **skip metadata generation and reuse it**. Only regenerate when the user explicitly asks to download new assemblies or regenerate metadata.

### Downloading Assemblies for Metadata

Assemblies are downloaded from a GitHub release in the `telerik/reporting` repo using the `gh` CLI.

1. Ensure `gh` is installed and authenticated (`gh auth status`).
2. Download the assets zip from a specific release tag:
   ```
   gh release download <release-tag> --repo telerik/reporting --pattern "Telerik_Reporting_*_Assets.zip" --dir _assetsApi
   ```
   If no tag is specified, use the latest release:
   ```
   gh release download --repo telerik/reporting --pattern "Telerik_Reporting_*_Assets.zip" --dir _assetsApi
   ```
3. Extract the zip and keep only the `Bin` folder:
   ```powershell
   Expand-Archive -Path _assetsApi/Telerik_Reporting_*_Assets.zip -DestinationPath _assetsApi/_temp_extract -Force
   Move-Item _assetsApi/_temp_extract/Bin _assetsApi/Bin -Force
   Remove-Item _assetsApi/_temp_extract -Recurse -Force
   ```
4. Remove `.pdb` files and the downloaded zip:
   ```powershell
   Remove-Item -Force _assetsApi/Bin/*.pdb -ErrorAction SilentlyContinue
   Remove-Item -Force _assetsApi/Telerik_Reporting_*_Assets.zip
   ```

### Step 1 — Generate API Metadata

> Skip this step if `_assetsApi/metadata/` already exists and the user did not ask to regenerate.

1. Ensure Reporting assemblies (DLLs) are in `_assetsApi/Bin/`.
   - If not present, follow [Downloading Assemblies](#downloading-assemblies-for-metadata) above.
2. Navigate to the `_assetsApi` directory:
   ```
   cd _assetsApi
   ```
3. (Optional) To include code snippets, verify `codeSourceBasePath` in `docfx.json` points to the reporting repo. When running from `_assetsApi`, it should be `../../reporting` or an absolute path.
4. Run docfx to generate metadata:
   ```
   docfx metadata
   ```
   This creates a `metadata/` folder with `.yml` files.
5. (Optional) Run the VB snippet fixer:
   ```powershell
   .\fix-vb-snippets.ps1 -MetadataPath ".\metadata" -BinPath ".\Bin" -SnippetBasePath "../../reporting"
   ```

Expected structure after metadata generation:

```
_assetsApi/
├── Bin/           # Reporting DLLs
├── metadata/      # Generated YML files
├── docfx.json
└── filterConfig.yml
```

### Step 2 — Run the Production Build

1. Navigate to docs-builder:
   ```
   cd ../docs-builder
   ```
   (or `cd ../../docs-builder` if you're still in `_assetsApi`)
2. Run the build:
   ```
   npm run build --docsPath=../reporting-docs --docFxFilesPath=../reporting-docs/_assetsApi/metadata
   ```
3. Serve the built site:
   ```
   npm run serve
   ```
4. The site is available at **http://localhost:9000/products/reporting/documentation/introduction**.

Alternative — use `dev-build` which builds AND serves in one step:

```
npm run dev-build --docsPath=../reporting-docs --docFxFilesPath=../reporting-docs/_assetsApi/metadata
```

---

## Clean Cache

If the build behaves unexpectedly or you get stale data:

```
cd ../docs-builder
npx clean
```

Then re-run the desired build command.

---

## Troubleshooting

### Common Build Errors

| Error                           | Cause                                         | Fix                                                                                      |
| ------------------------------- | --------------------------------------------- | ---------------------------------------------------------------------------------------- |
| Incorrect slug errors           | Wrong `slug` or `previous_url` in frontmatter | Fix the referenced markdown file                                                         |
| `/api/` link errors in dev mode | No metadata loaded                            | Expected in dev builds — ignore                                                          |
| `docfx metadata` fails          | Missing DLLs in Bin                           | Download assemblies — see [Downloading Assemblies](#downloading-assemblies-for-metadata) |
| Build hangs or OOM              | Large site, insufficient memory               | docs-builder sets `--max-old-space-size=8192` automatically                              |

### Tips

- Use double curly braces only for Liquid syntax (version variables like `{{ suiteversion }}`).
- Escape literal double curly braces: `\{\{ text \}\}`.
- Use relative paths when referencing images.
- If many slug errors appear, fix and rebuild iteratively — not all errors show in the first build.

---

## CLI Reference

All commands are run from the **docs-builder** directory.

| Command                                                                       | Purpose                                   |
| ----------------------------------------------------------------------------- | ----------------------------------------- |
| `npm run develop --docsPath=../reporting-docs`                                | Dev server with hot reload (port 8000)    |
| `npm run build --docsPath=../reporting-docs --docFxFilesPath=<metadata-path>` | Production static build                   |
| `npm run dev-build --docsPath=../reporting-docs`                              | Build + serve locally (port 9000)         |
| `npm run serve`                                                               | Serve a previously built site (port 9000) |
| `npx clean`                                                                   | Clean Gatsby cache                        |

### CLI Parameters

| Parameter          | Required | Description                                    |
| ------------------ | -------- | ---------------------------------------------- |
| `--docsPath`       | Yes      | Path to the reporting-docs repo                |
| `--docFxFilesPath` | No       | Path to API metadata `.yml` files              |
| `--configFile`     | No       | Config file name (default: `docs-builder.yml`) |
| `--pathPrefix`     | No       | Override URL path prefix                       |
| `--outputPath`     | No       | Change output folder                           |

---

## PDF Generation

Generate a PDF of the entire documentation site. This requires a **production build** first (the PDF is generated from the built static site).

### Overview

The PDF pipeline has three stages:

1. **Build** — production build of the site using the default `docs-builder.yml` config
2. **Export** — Puppeteer converts each page to an individual PDF
3. **Merge** — individual PDFs are combined into a single file with cover page, bookmarks, page numbers, and fixed internal links

### Step 1 — Build the Site for PDF

The PDF is generated from the production build output. Use the default config file (`docs-builder.yml`).

```
cd ../docs-builder
npm run dev-build --docsPath=../reporting-docs --docFxFilesPath=../reporting-docs/_assetsApi/metadata
```

> If metadata does not exist in `_assetsApi/metadata/`, follow the [metadata generation steps](#step-1--generate-api-metadata) first. Alternatively, for a PDF without API reference, omit `--docFxFilesPath`.

Wait for the build to complete. The built site will be in `docs-builder/public/`.

After the build finishes, **stop the server** (Ctrl+C or kill the terminal) — the PDF generation starts its own server.

### Step 2 — Export Pages to Individual PDFs

This uses Puppeteer to render each page and export it as a PDF. The tool starts its own Express server on port 4300.

**Prerequisites:** The PDF tool expects a `main.js` file at the docs-builder root to start its server. If it doesn't exist, create it:

```javascript
// main.js (at docs-builder root)
import { createServer } from "./server/server.js";
createServer({ port: process.env.PORT || 4300, publicFolder: "./public" });
```

On a local machine, run with a single agent:

```
cd ../docs-builder
npx pdf-generate --serverPath=. --agentIndex=0 --maxAgents=1
```

This reads `public/pdf-toc.json` (generated during the build), starts a local server on port 4300, and exports each page to `pdf-out/`.

> This step takes a long time (processes all ~1400+ documentation pages). For faster execution, you can parallelize with multiple terminal sessions using different `agentIndex` values (0 to maxAgents-1).

### Step 3 — Merge PDFs into Final Document

After all pages are exported, merge them into a single PDF:

```
cd ../docs-builder
npx pdf-merge --serverPath=. --pdfsPath=./pdf-out --productName="Telerik Reporting" --productVersion="<version>"
```

Replace `<version>` with the product version string (e.g., `2026 Q1`). If the user doesn't specify a version, read it from the `suiteversion` liquid variable in `docs-builder.yml`.

The final PDF is output to: `docs-builder/pdf-out/Telerik_Reporting_<version>.pdf`

The merge step:

- Adds a cover page using `pdf-cover.png`
- Adds footer images and page numbers
- Generates PDF bookmarks from the TOC
- Fixes internal links to point within the PDF

### PDF CLI Parameters

| Parameter          | Required | Description                                     |
| ------------------ | -------- | ----------------------------------------------- |
| `--serverPath`     | Yes      | Path to the docs-builder root (e.g., `.`)       |
| `--agentIndex`     | No       | Agent index for parallel execution (default: 0) |
| `--maxAgents`      | No       | Total parallel agents (default: 1)              |
| `--pdfsPath`       | Yes\*    | Path to exported PDFs (merge step only)         |
| `--productName`    | Yes\*    | Product name for cover page (merge step only)   |
| `--productVersion` | Yes\*    | Version for cover page (merge step only)        |
| `--maxPages`       | No       | Max pages to include, 0 = all (merge step only) |
