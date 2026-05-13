---
name: orphaned-image-cleaner
description: "Finds and removes orphaned images that are not referenced by any content file. Use when: cleaning up after article deletions, auditing image folders for unused files, reducing repository size, preparing for a release. Scans all images/ folders and cross-references against markdown, HTML, and config files to identify unreferenced images."
---

# Orphaned Image Cleaner

Find unreferenced images in the repository so they can be reviewed and deleted.

**Requires**: Node.js (built-in modules only, no npm install needed).

## Procedure

### Step 1: Run the Scan

```bash
node .github/skills/orphaned-image-cleaner/scripts/find-orphans.js .
```

The script collects all `.png`, `.jpg`, `.jpeg`, `.gif` files (excluding `_`-prefixed directories), scans `.md` and `.html` files plus config files (`docs-builder.yml`, `_config.yml`, `docs-builder-pdf.yml`) for references, resolves each to a full repo-relative path, and prints orphans grouped by directory. The output is deterministic — trust it without manual verification.

For JSON output: add `--json`.

### Step 2: Check for Untracked Images

```bash
git status --short -- '*.png' '*.jpg' '*.jpeg' '*.gif'
```

- **Untracked** (`??` prefix) orphans may be future-use images — flag separately. Removing them requires `rm`, not `git rm`.
- **Tracked** orphans are confirmed unused.

### Step 3: Report Results

Present results to the user, separating untracked from tracked orphans.

### Step 4: Delete (Only When Asked)

1. List files and ask for confirmation.
2. Tracked orphans: `git rm <path>`.
3. Untracked orphans: `rm <path>`.
4. Re-run the scan to verify.

## Limitations

- Does not detect JS/dynamic image references.
- Future-use images (staged for upcoming articles) have no references yet — flag rather than delete.
- `_assetsApi/` is excluded (managed separately).
