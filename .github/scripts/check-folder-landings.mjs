#!/usr/bin/env node
// Checks that every documentation folder with visible articles has a landing, so that its folder URL
// does not return 404. A folder passes when one of the following applies:
//   - it contains an index.md page;
//   - a redirect in docs-builder.yml matches the folder URL and targets the first visible article of the folder;
//   - the first visible article of the folder lists the folder URL in its previous_url;
//   - it is listed in .github/folder-landings-allowlist.txt.
// The first visible article follows the docs-builder navigation order: position, then lowercased title.
// Hidden folders, folders without visible articles, and the Knowledge Base are skipped.
// Uses only Node.js built-in modules. Usage: node .github/scripts/check-folder-landings.mjs [docsRoot]

import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve(process.argv[2] || '.');
const CONFIG_FILE = 'docs-builder.yml';
const ALLOWLIST_FILE = '.github/folder-landings-allowlist.txt';
// The Knowledge Base has its own listing page configured in docs-builder.yml.
const EXCLUDED_TOP_FOLDERS = new Set(['knowledge-base']);

const errors = [];
const report = (file, message) => errors.push({ file, message });

const read = (relativePath) => fs.readFileSync(path.join(root, relativePath), 'utf8');
const isIgnoredName = (name) => name.startsWith('.') || name.startsWith('_');
const isArticleFile = (name) => /\.mdx?$/i.test(name);
const regexEscape = (text) => text.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');

// Mirrors how docs-builder derives a page URL from the relative path of a Markdown file.
const pageUrl = (relativePath) => '/' + relativePath
  .replace(/((\/|^)index)?\.mdx?$/i, '')
  .replace(/[^-a-z0-9_/.]+/gi, '-')
  .toLowerCase();
const folderUrl = (relativeDir) => pageUrl(`${relativeDir}/index.md`);

// Returns the value of a single-line YAML scalar without quotes and trailing comments.
const unquote = (value) => {
  const v = value.trim();
  const quoted = v.match(/^("(?:[^"\\]|\\.)*"|'(?:[^']|'')*')(?:\s+#.*)?$/);
  if (quoted && quoted[1].startsWith('"')) {
    return quoted[1].slice(1, -1).replace(/\\(["\\/])/g, '$1');
  }
  if (quoted) {
    return quoted[1].slice(1, -1).replace(/''/g, `'`);
  }
  return v.replace(/\s+#.*$/, '');
};

// Supports '*' (one path segment) and a trailing '/**' (the folder and all its subfolders).
const globToRegExp = (pattern) => {
  const recursive = pattern.endsWith('/**');
  const base = (recursive ? pattern.slice(0, -3) : pattern)
    .split('/')
    .map(segment => regexEscape(segment).replace(/\\\*/g, '[^/]*'))
    .join('/');
  return new RegExp(`^${base}${recursive ? '(/.*)?' : ''}$`, 'i');
};

// Mirrors the docs-builder frontmatter defaults:
// - A non-empty frontmatter block defaults to `published: true`. Files without one are not published.
// - previous_url redirects are registered unless `published: false`.
// - The navigation title defaults to the file name, and the position defaults to 9999.
const DEFAULT_POSITION = 9999;
const parseFrontmatter = (text, fileName) => {
  const result = {
    published: false,
    redirectsActive: true,
    hidden: false,
    previousUrls: [],
    title: '',
    position: DEFAULT_POSITION
  };
  const match = text.match(/^\uFEFF?---\r?\n([\s\S]*?)\r?\n---/);
  const lines = match ? match[1].split(/\r?\n/) : [];
  result.published = lines.some(line => line.trim() && !/^\s*#/.test(line));

  for (let i = 0; i < lines.length; i++) {
    const field = lines[i].match(/^([A-Za-z_]+):\s*(.*)$/);
    if (!field) {
      continue;
    }

    const [, key, rawValue] = field;
    const value = unquote(rawValue).toLowerCase();

    if (key === 'published') {
      result.published = value === 'true';
      result.redirectsActive = value !== 'false';
    } else if (key === 'hidden') {
      result.hidden = value === 'true';
    } else if (key === 'title') {
      result.title = unquote(rawValue).replaceAll('&lt;', '<').replaceAll('&gt;', '>');
    } else if (key === 'position' && /^-?\d+$/.test(value)) {
      result.position = Number(value);
    } else if (key === 'previous_url') {
      const values = [];
      if (value) {
        values.push(...value.replace(/^\[|\]$/g, '').split(','));
      } else {
        while (i + 1 < lines.length && /^\s*-\s+/.test(lines[i + 1])) {
          values.push(lines[++i].replace(/^\s*-\s+/, ''));
        }
      }
      result.previousUrls = values
        .map(u => unquote(u).toLowerCase())
        .filter(Boolean)
        .map(u => u.startsWith('/') ? u : '/' + u);
    }
  }

  return {
    ...result,
    title: result.title || fileName
  };
};

// Reads the hidden folders from the meta section and the rules from the redirects section of docs-builder.yml.
const parseConfig = (text) => {
  const hiddenFolderPatterns = [];
  const redirects = [];
  let section = null;
  let metaKey = null;

  text.split(/\r?\n/).forEach((line, index) => {
    const topLevel = line.match(/^([A-Za-z][\w-]*):/);
    if (topLevel) {
      section = topLevel[1];
      return;
    }

    if (section === 'meta') {
      const key = line.match(/^ {2}([^\s#][^#]*?):\s*$/);
      if (key) {
        metaKey = unquote(key[1]);
      } else if (metaKey && /^ {4}hidden:\s*true\s*$/i.test(line)) {
        hiddenFolderPatterns.push(globToRegExp(metaKey));
      }
    } else if (section === 'redirects') {
      const from = line.match(/^ {2}- from:\s*(.+)$/);
      const to = line.match(/^ {4}to:\s*(.+)$/);
      if (from) {
        redirects.push({ from: unquote(from[1]), line: index + 1 });
      } else if (to && redirects.length) {
        redirects[redirects.length - 1].to = unquote(to[1]);
      }
    }
  });

  return { hiddenFolderPatterns, redirects };
};

const readAllowlist = () => {
  const file = path.join(root, ALLOWLIST_FILE);
  if (!fs.existsSync(file)) {
    return [];
  }

  return fs.readFileSync(file, 'utf8')
    .split(/\r?\n/)
    .map((line, index) => ({ pattern: line.replace(/#.*$/, '').trim().replace(/^\/+|\/+$/g, ''), line: index + 1 }))
    .filter(entry => entry.pattern)
    .map(entry => ({ ...entry, regex: globToRegExp(entry.pattern) }));
};

const collectFolders = () => {
  const folders = [];
  const walk = (relativeDir) => {
    const entries = fs.readdirSync(path.join(root, relativeDir), { withFileTypes: true });
    const articles = entries
      .filter(e => e.isFile() && isArticleFile(e.name))
      .map(e => {
        const relativePath = `${relativeDir}/${e.name}`;
        return {
          relativePath,
          url: pageUrl(relativePath),
          isIndex: /^index\.mdx?$/i.test(e.name),
          ...parseFrontmatter(read(relativePath), e.name.replace(/\.mdx?$/i, ''))
        };
      });
    const folderMetaFile = path.join(root, relativeDir, '_meta.yml');
    const metaHidden = fs.existsSync(folderMetaFile) && /^hidden:\s*true\s*$/im.test(fs.readFileSync(folderMetaFile, 'utf8'));

    folders.push({ path: relativeDir, url: folderUrl(relativeDir), articles, metaHidden });

    entries
      .filter(e => e.isDirectory() && !isIgnoredName(e.name))
      .forEach(e => walk(`${relativeDir}/${e.name}`));
  };

  fs.readdirSync(root, { withFileTypes: true })
    .filter(e => e.isDirectory() && !isIgnoredName(e.name) && !EXCLUDED_TOP_FOLDERS.has(e.name.toLowerCase()))
    .forEach(e => walk(e.name));

  return folders;
};

// Returns the lowercased target of the redirect for the URL, or null if the redirect does not match.
const resolveRedirect = (redirect, url) => {
  if (!redirect.to) {
    return null;
  }

  let match;
  try {
    match = url.match(new RegExp(redirect.from, 'si'));
  } catch {
    return null;
  }

  return match
    ? redirect.to.replace(/\$(\d+)/g, (m, group) => match[group] || '').toLowerCase().replace(/(.)\/+$/, '$1')
    : null;
};

const { hiddenFolderPatterns, redirects } = parseConfig(read(CONFIG_FILE));
const allowlist = readAllowlist();
const folders = collectFolders();
const folderByPath = new Map(folders.map(f => [f.path, f]));
const folderUrls = new Set(folders.map(f => f.url));
const articles = folders.flatMap(f => f.articles);

const isHiddenFolder = (folder) => {
  const segments = folder.path.split('/');
  return segments.some((_, i) => {
    const ancestor = segments.slice(0, i + 1).join('/');
    return folderByPath.get(ancestor)?.metaHidden || hiddenFolderPatterns.some(rx => rx.test(ancestor));
  });
};

let checked = 0;

for (const folder of folders) {
  const matchingRedirect = redirects
    .map(redirect => ({ redirect, target: resolveRedirect(redirect, folder.url) }))
    .find(r => r.target);

  if (folder.articles.some(a => a.isIndex && a.published)) {
    if (matchingRedirect) {
      report(CONFIG_FILE, `The redirect on line ${matchingRedirect.redirect.line} hides the index page of '${folder.path}'. Remove the redirect or the index page.`);
    }
    continue;
  }

  const visibleArticles = folder.articles.filter(a => a.published && !a.hidden && !a.isIndex);
  if (isHiddenFolder(folder) || visibleArticles.length === 0) {
    continue;
  }

  checked++;
  // Mirrors the docs-builder navigation order: position, then lowercased title.
  const compareNavOrder = (a, b) => a.position - b.position
    || (a.title.toLowerCase() > b.title.toLowerCase() ? 1 : a.title.toLowerCase() < b.title.toLowerCase() ? -1 : 0);
  const sortedArticles = [...visibleArticles].sort(compareNavOrder);
  // Articles with the same position and title have no defined order, so any of them can be first.
  const firstArticles = sortedArticles.filter(a => compareNavOrder(a, sortedArticles[0]) === 0);
  const expectedTarget = firstArticles.map(a => `'${a.url}'`).join(' or ');
  const isFirstArticle = (url) => firstArticles.some(a => a.url === url);

  if (matchingRedirect) {
    if (!isFirstArticle(matchingRedirect.target)) {
      report(CONFIG_FILE, `The redirect on line ${matchingRedirect.redirect.line} sends '${folder.url}' to '${matchingRedirect.target}', but the first visible article of '${folder.path}' in navigation order is ${expectedTarget}. Update the redirect target.`);
    }
    continue;
  }

  const claimingArticle = articles.find(a => a.redirectsActive && a.previousUrls.includes(folder.url));
  if (claimingArticle) {
    if (!isFirstArticle(claimingArticle.url)) {
      report(claimingArticle.relativePath, `The previous_url '${folder.url}' sends the folder '${folder.path}' to '${claimingArticle.url}', but the first visible article of the folder in navigation order is ${expectedTarget}. Move the previous_url to that article or add a redirect.`);
    }
    continue;
  }

  if (allowlist.some(entry => entry.regex.test(folder.path))) {
    continue;
  }

  const suggestedFrom = `^${regexEscape(folder.url)}$`.replace(/\\/g, '\\\\');
  report(sortedArticles[0].relativePath, `The folder '${folder.path}' has no landing, so '${folder.url}' returns 404. Add an index.md, or add a redirect from "${suggestedFrom}" to "${sortedArticles[0].url}" (the first visible article of the folder) at the end of the redirects list in ${CONFIG_FILE}, or list the folder in ${ALLOWLIST_FILE}.`);
}

// A folder redirect whose folder no longer exists sends readers to removed articles.
for (const redirect of redirects) {
  const literal = redirect.from.match(/^\^(\/(?:[^\\$*+?()[\]{}|^]|\\\.)*)\$$/);
  if (!literal || !redirect.to) {
    continue;
  }

  const fromUrl = literal[1].replace(/\\\./g, '.').toLowerCase();
  if (redirect.to.toLowerCase().startsWith(`${fromUrl}/`) && !folderUrls.has(fromUrl)) {
    report(CONFIG_FILE, `The redirect on line ${redirect.line} is for the folder '${fromUrl}', which no longer exists. Remove or update the redirect.`);
  }
}

for (const entry of allowlist) {
  if (!folders.some(f => entry.regex.test(f.path))) {
    report(ALLOWLIST_FILE, `The allowlist entry '${entry.pattern}' on line ${entry.line} does not match any folder. Remove the entry.`);
  }
}

for (const { file, message } of errors) {
  console.log(process.env.GITHUB_ACTIONS ? `::error file=${file}::${message}` : `ERROR ${file}: ${message}`);
}

console.log(`Checked ${checked} folders with visible articles and found ${errors.length} problem(s).`);
process.exitCode = errors.length > 0 ? 1 : 0;
