---
name: fetch-release-history-page
description: Scrapes the public Telerik Reporting release-history page (e.g. https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q1-(20-0-26-402)) for a given release version and emits the same normalised JSON shape as fetch-release-notes — {version, items[], dependencies[], schemas[], source_url}. Use this skill alongside fetch-release-notes so the auditor can cross-check what shipped publicly against the GitHub Actions artifact.
---

# fetch-release-history-page

## When to use
Optional second source of truth for the docs-release audit. The GitHub
Actions release-notes artifact represents the **build-time** notes; the
public release-history page represents what was **actually published** to
customers. Discrepancies between them are themselves audit findings.

## Inputs
- `release_version` (required, e.g. `20.0.26.402`) — used to construct the
  URL when `release_history_url` is not provided.
- `release_history_url` (optional, full URL). When omitted, build the URL as:
  `https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-{YEAR}-q{Q}-({a}-{b}-{c}-{d})`
  where `{a}.{b}.{c}.{d}` = `release_version`, `{YEAR}` and `{Q}` are
  derived from the matching upgrade-article filename in `reporting-docs`
  (`upgrade/{Year}/{year}-q{Q}-{a-b-c-d}.md`). Note the literal parentheses
  around the dashed version in the URL — do **not** percent-encode them.

## Output (stdout, JSON) — identical schema to `fetch-release-notes`
```json
{
  "version": "20.0.26.402",
  "source_url": "https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q1-(20-0-26-402)",
  "items": [
    { "type": "Feature", "title": "Implement MaxiCode (ISO/IEC 16023) barcode encoding and rendering.", "jira_keys": [], "component": "Barcode" },
    { "type": "Bug",     "title": "PDF Accessibility: Graph alt text is repeated by screen readers for every drawing primitive.", "jira_keys": [], "component": "PDF Rendering" },
    { "type": "Change",  "title": "The HtmlTextBox that spans 2 or more pages may cut the OL-LI elements' content vertically in the middle of the line between the pages.", "jira_keys": [], "component": null }
  ],
  "dependencies": [
    { "name": "Telerik.Licensing", "version": "1.8.2", "scope": null }
  ],
  "schemas": [
    { "name": "TRDX/TRDP/TRBP", "version": "http://schemas.telerik.com/reporting/2026/2.0" }
  ],
  "warnings": []
}
```

## Procedure

1. **Resolve URL** — if `release_history_url` is missing, derive it from
   `release_version` using the docs-repo upgrade article (file pattern
   `upgrade/{Year}/{year}-q{Q}-{a-b-c-d}.md`) to learn `{Year}` and `{Q}`.
   Keep the literal `(` and `)` in the URL.
2. **Fetch the page** with `web_fetch` (preferred) or
   `Invoke-WebRequest -UseBasicParsing -UserAgent "copilot-cli-auditor"`.
   Follow redirects. Treat HTTP 4xx/5xx as a hard failure.
3. **Strip layout** — keep only the main release content. The page typically
   uses headings such as `What's New`, `What's Improved`, `What's Changed`,
   `What's Fixed`, plus per-product subsections (`PDF Rendering`,
   `Designer`, `Viewers`, etc.) and a `Product Dependencies` block.
4. **Classify items** by section title using the same mapping as
   `fetch-release-notes`:
   - `What's New` / `Features` / `Enhancements` → Feature
   - `What's Changed` → Change
   - `What's Fixed` / `Fixed` / per-renderer fix sections → Bug
5. **Extract Jira keys** from each bullet via `\bREP-\d+\b` (the public page
   sometimes embeds them as anchor text).
6. **Extract dependencies** from a `Product Dependencies` / `Dependencies`
   block; same parsing as `fetch-release-notes` (regex on
   `name (version)` / `name X.Y.Z`).
7. **Extract schemas** with `http://schemas\.telerik\.com/reporting/\d+/\d+\.\d+`.
8. **Emit JSON**.

## Reconciliation contract (what the orchestrating agent does with this)

The agent merges `items` from `fetch-release-notes` (artifact) and
`fetch-release-history-page` (public page) into a single canonical list,
de-duplicating by:

1. exact Jira key intersection, OR
2. case-insensitive normalised-title equality, OR
3. ≥ 80 % token-overlap fuzzy match.

Items present in only one source are kept and their `Notes` column flagged:
- `artifact-only` → present in build artifact but not yet published
- `public-only`   → published but no longer in build artifact (suspicious)

Both sets are compared against the upgrade article and Jira separately, but
the final report shows the merged list with provenance in `Notes`.

## Failure modes
- HTTP 404 → return `items: []` and warning
  `release-history page not yet published for <version>`. The agent then
  proceeds with artifact-only data.
- Page format changed (no recognisable section headings) → return
  `items: []` and warning `release-history parser found no sections`.
- Both `release_history_url` and `release_version` missing → exit non-zero.

## Role under audit-preflight (Workstream A)

When `audit-preflight` reports
`selected_sources.release_notes` is `local_tag` (items list empty) or
`web-only` (skipped), this skill becomes the **primary** items source for
the audit. No procedural change is required, but the orchestrator must
prefix every item's `Notes` column with `[public-only]` instead of
`[artifact+public]` in that mode, and surface the degradation in the
report header banner.

When `selected_sources.release_history_page == "skipped"` (public web
unreachable), this skill must not be called; the orchestrator records a
banner warning `release-history page unreachable — items list will be
artifact-only`.
