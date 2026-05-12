---
name: fetch-release-notes
description: Resolves a GitHub Actions run/artifact/release URL for a Telerik Reporting release, downloads the release-notes artifact, parses it (HTML/MD/JSON/TXT), and emits a normalised JSON object {version, head_sha, items[], dependencies[], schemas[]}. Use this skill whenever you need to turn a release-notes URL into structured data the rest of the auditor can consume.
---

# fetch-release-notes

## When to use
First step of the docs-release audit. Given any of:

- a GitHub Actions **run URL** (e.g. `.../actions/runs/24400696725`)
- an artifact URL (`.../actions/artifacts/<id>`)
- a release tag URL (`.../releases/tag/<tag>`)

…produce a normalised JSON description of the release.

## Inputs
- `release_notes_url` (required, string)

## Output (stdout, JSON)
```json
{
  "version": "20.0.26.211",
  "head_sha": "0e58fd9f0111917ffcf524eea7fb9268eab03bec",
  "owner": "telerik",
  "repo": "reporting",
  "run_id": 24400696725,
  "items": [
    { "type": "Feature", "title": "...", "jira_keys": ["REP-1234"], "component": "WPF Viewer" },
    { "type": "Bug",     "title": "...", "jira_keys": ["REP-5678"], "component": null }
  ],
  "dependencies": [
    { "name": "Telerik.Licensing", "version": "1.6.40", "scope": null }
  ],
  "schemas": [
    { "name": "TRDX/TRDP/TRBP", "version": "http://schemas.telerik.com/reporting/2026/1.0" }
  ],
  "warnings": []
}
```

## Procedure

1. **Normalise URL** with regex into one of three shapes:
   - run: `^https?://github.com/(?<o>[^/]+)/(?<r>[^/]+)/actions/runs/(?<id>\d+)`
   - artifact: `^https?://github.com/(?<o>[^/]+)/(?<r>[^/]+)/actions/artifacts/(?<id>\d+)`
   - release: `^https?://github.com/(?<o>[^/]+)/(?<r>[^/]+)/releases/tag/(?<tag>.+)`
2. **Resolve run + artifact**:
   - For a run URL, call `github-mcp-server-actions_get` (`get_workflow_run`)
     to get `head_sha`, then `github-mcp-server-actions_list`
     (`list_workflow_run_artifacts`) and pick the artifact whose name
     matches `(?i)release.?notes`. If exactly one artifact exists, use it.
   - For an artifact URL, jump straight to download.
   - For a release URL, fall back to fetching the release body via
     `web_fetch` of the release page; treat the body as the release notes.
3. **Download & unzip** with `powershell`:
   - `Invoke-WebRequest -Uri <archive_download_url> -Headers @{ Authorization = "Bearer $env:GITHUB_TOKEN" } -OutFile $tmpZip`
   - `Expand-Archive -Path $tmpZip -DestinationPath $tmpDir -Force`
4. **Detect format** — inspect file extensions in `$tmpDir`, in priority
   order:
   - `.xml` whose root element is `<releaseNote>` from namespace
     `http://www.telerik.com/importReleaseNotesSchema.xsd` → **preferred
     Telerik schema**. When multiple XML files exist (e.g. one per product),
     prefer the file matching `(?i)reporting` and ignore
     `report_?server_?release_?notes` for a Reporting audit.
   - `.json` → parse directly.
   - `.md` → markdown parse.
   - `.html`/`.htm` → strip tags then markdown parse. Note: a
     `both_products_for_review.html` file is a **review report of items
     missing a milestone**, NOT the release notes — skip it.
   - `.txt` → line parse.
5. **Extract**:
   - **Version** — search every artifact file for
     `\b\d+\.\d+\.\d+\.\d+\b`. If none found, fall back to (a) the
     `display_title` / `name` of the workflow run, (b) the head commit
     message, (c) the user-supplied `release_version` input. If still
     absent, exit non-zero with `cannot determine release version; pass
     release_version explicitly`.
   - **Items** — for the Telerik XML schema, iterate
     `releaseNote/items/releaseNoteItem`; classify by `Title` attribute:
     `What's Improved` / `New` / `Feature` / `Enhancement` → Feature;
     anything containing `Fix`, plus the section's `<fixedItems>` children,
     and the standalone-section titles `PDF Rendering`, `XPS Rendering`,
     `Excel Rendering`, `Word Rendering`, `CSV Rendering`, `Image
     Rendering`, `Designer`, `Viewer`, etc. → Bug; `What's Changed` /
     `<changedItems>` → Change. Each `<add>` becomes one item; capture
     Jira keys via `\bREP-\d+\b` from the CDATA.
   - **Dependencies** — for the Telerik XML schema, find any
     `releaseNoteItem` whose `Title` matches `(?i)dependenc`; HTML-decode
     its `<content>` body and parse each `<p><strong>NAME</strong> ...
     - DEP (X.Y.Z or later)</p>` block. Otherwise (markdown/json/text),
     bullets/tables under a `Dependencies?` heading; parse `name (version)`
     or `name version X.Y.Z`.
   - **Schemas** — match `http://schemas\.telerik\.com/reporting/\d+/\d+\.\d+`
     in any text content.
6. **Emit JSON** to stdout. Add any parsing fallbacks to `warnings[]`.
7. **Cleanup** — remove `$tmpZip` and `$tmpDir`.

## Failure modes
- Multiple candidate artifacts → list them in `warnings` and pick the
  alphabetically first match for `(?i)release.?notes`.
- No artifact and no release body → exit non-zero with message
  `no release notes content found`.
- Empty `items` after parse → exit non-zero with message
  `release-notes parser produced no items`.

## Local-tag fallback (Workstream A)

When `audit-preflight` reports `selected_sources.release_notes ==
"local_tag"` (i.e. no `release_notes_url` and no GitHub MCP, but
`local_repo` and `release_version` are available), the skill runs a
**reduced** procedure that still produces a usable JSON for the
orchestrator.

Additional inputs accepted in this variant:

- `local_repo` — filesystem path **or** `path@ref`.
- `release_version` — required, used to derive the tag name.

Procedure (local-tag variant):

1. Resolve `head_sha` via
   `git -C <local_repo> rev-list -n 1 v<release_version>`.
   If the tag does not exist, emit warning
   `tag v<release_version> not found locally; run 'git -C <path> fetch --tags' first`
   and exit non-zero.
2. **Try the GitHub Release attachment via plain web_fetch** (no MCP
   required) **if and only if** `audit-preflight.capabilities.github_token_env.available == true`:
   - GET `https://api.github.com/repos/<owner>/<repo>/releases/tags/v<release_version>`
     with header `Authorization: Bearer $env:GITHUB_TOKEN`.
   - If the release exists and has an asset matching `(?i)release.?notes`,
     download it via `Invoke-WebRequest -Headers @{Authorization='Bearer '+$env:GITHUB_TOKEN}`
     to a temp file and parse with the existing **Detect format** /
     **Extract** steps (4-7) of the main Procedure.
   - On any error (404, asset missing, network), fall through to step 3
     and add a warning explaining the fallback.
3. If the GitHub Release path did not yield items, emit:
   ```json
   {
     "version": "<release_version>",
     "head_sha": "<resolved_sha>",
     "owner": null,
     "repo":  null,
     "run_id": null,
     "items": [],
     "dependencies": [],
     "schemas": [],
     "warnings": [
       "release-notes artifact not available locally and no GitHub Release asset reachable via GITHUB_TOKEN; items list will come from the public release-history page only"
     ],
     "source_provider": "local_tag"
   }
   ```
   The orchestrator continues; downstream feature-finder runs against the
   public-page item list (provenance `[public-only]`).

The main MCP-based procedure remains the **preferred** path whenever
`release_notes_url` and GitHub MCP are both available; the local-tag
fallback is invoked only when both are unavailable.
