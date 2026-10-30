---
published: false
publish: false
---

# Repository Documentation Accessibility Assessment

**Status: Completed.** Assessment date: 2026-10-30. This is a source-only baseline; it does not claim WCAG conformance.

## Average Scores

- Articles scored: **1447**
- Articles excluded: **92**
- Overall documentation accessibility score: **4.5 / 5.0**
- Heading Structure: **4.5 / 5.0**
- Alternative Text: **5.0 / 5.0**
- Link Text Clarity: **4.9 / 5.0**
- Plain Language: **3.1 / 5.0**
- Table Accessibility: **4.1 / 5.0**
- Formatting Independence: **5.0 / 5.0**
- Callout Structure: **5.0 / 5.0**
- Code Block Accessibility: **4.8 / 5.0**

## Scope and Validation

- Markdown candidates discovered recursively: **1539** (`.md` and `.markdown`).
- Eligible articles: **1447**; scored articles: **1447**; scored count equals included count: **yes**.
- The repository Jekyll `_config.yml` `exclude` entries are honored; files with `publish: false` or `published: false` are excluded. API-reference source files marked `published: false` are treated as unpublished/generated content.
- `exclude_navigation` entries are navigation settings, not publication exclusions, and were not used to exclude articles.
- Audit deliverables are treated as output, not as articles. Files in `.git`, `.github`, `node_modules`, `_site`, `bin`, and `obj` are excluded.
- Scoring exceptions: **0**. All eligible files were scored.

### Exclusion Counts

| Exclusion reason | Count |
|---|---:|
| Jekyll _config.yml exclude | 4 |
| audit output | 1 |
| excluded directory | 4 |
| generated API reference (frontmatter published: false) | 65 |
| unpublished article (frontmatter published: false) | 18 |

## Summary

The mean article score is **4.5 / 5.0**. Strongest dimensions: **alternative text** (5.0), **formatting independence** (5.0), **callout structure** (5.0). Weakest dimensions: **plain language** (3.1).
**0** articles contain Critical findings and **699** contain High findings; **15** image cases require human review because Markdown source does not establish purpose.
Recurring Medium and Low patterns (found in at least five articles):
- **Low (89 articles) — code block no introduction:** Code examples lack a preceding explanation.
- **Low (24 articles) — inconsistent link labels:** Links to the same destination use inconsistent labels.
- **Low (11 articles) — vague heading:** Headings do not clearly identify their sections.
- **Low (9 articles) — bold only warning:** Warnings are signaled with bold formatting without a typed callout.
- **Medium (1091 articles) — long sentences:** Prose includes sentences longer than 30 words.
- **Medium (671 articles) — missing h1:** Articles lack an H1 heading in the Markdown source.
- **Medium (86 articles) — untagged code block:** Fenced code blocks lack language identifiers.
- **Medium (73 articles) — empty heading section:** Some headings have no content before the next heading.
- **Medium (60 articles) — repeated link text different targets:** The same link label points to different destinations.
- **Medium (42 articles) — nondescriptive link text:** Some links use labels that do not identify their destinations.
- **Medium (24 articles) — empty table cells:** Tables contain empty cells.
- **Medium (15 articles) — heading level skip:** Heading levels skip one or more levels.

Scores are produced by deterministic source-level checks against the requested dimensions. Plain-language scores use sentence length as a proxy; technical vocabulary, link purpose in context, callout severity, table semantics, and image intent can require human judgment. Markdown source does not reveal rendered behavior, image pixels, interaction, or product functionality. No rendered site, WCAG conformance, code correctness, or UI behavior was assessed.

## Critical and High Issues

### Critical

No Critical findings were detected by the source-level checks.

### High

#### `designing-reports/connecting-to-data/data-source-components/csvdatasource-component/connecting-the-csvdatasource-component-to-a-csv-source.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/csvdatasource-component/connecting-the-csvdatasource-component-to-a-csv-source.md` | 14 | Plain Language | 3 of 3 detected prose sentences exceed 30 words (100%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview.md` | 22 | Plain Language | 5 of 13 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/cubedatasource-component/connecting-the-cubedatasource-component-to-an-olap-database.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/cubedatasource-component/connecting-the-cubedatasource-component-to-an-olap-database.md` | 2 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/entitydatasource-component/connecting-to-an-entity-data-model-with-the-entitydatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/entitydatasource-component/connecting-to-an-entity-data-model-with-the-entitydatasource-component.md` | 14 | Plain Language | 6 of 9 detected prose sentences exceed 30 words (67%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/entitydatasource-component/maintaining-the-lifecycle-of-the-context-with-the-entitydatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/entitydatasource-component/maintaining-the-lifecycle-of-the-context-with-the-entitydatasource-component.md` | 16 | Plain Language | 6 of 9 detected prose sentences exceed 30 words (67%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/entitydatasource-component/using-parameters-with-the-entitydatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/entitydatasource-component/using-parameters-with-the-entitydatasource-component.md` | 16 | Plain Language | 3 of 8 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/connecting-to-a-telerik-data-access-model-with-the-openaccessdatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/connecting-to-a-telerik-data-access-model-with-the-openaccessdatasource-component.md` | 16 | Plain Language | 5 of 9 detected prose sentences exceed 30 words (56%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/maintaining-the-lifecycle-of-the-openaccesscontext-with-the-openaccessdatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/maintaining-the-lifecycle-of-the-openaccesscontext-with-the-openaccessdatasource-component.md` | 16 | Plain Language | 5 of 9 detected prose sentences exceed 30 words (56%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/retrieving-data-from-a-telerik-data-access-model-with-the-openaccessdatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/retrieving-data-from-a-telerik-data-access-model-with-the-openaccessdatasource-component.md` | 14 | Plain Language | 5 of 13 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/using-parameters-with-the-openaccessdatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/openaccessdatasource-component/using-parameters-with-the-openaccessdatasource-component.md` | 16 | Plain Language | 3 of 8 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/openclientdatasource-component/how-to-configure-the-openclientdatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/openclientdatasource-component/how-to-configure-the-openclientdatasource-component.md` | 21 | Plain Language | 3 of 7 detected prose sentences exceed 30 words (43%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/openclientdatasource-component/overview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/openclientdatasource-component/overview.md` | 16 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/sqldatasource-component/selecting-data-with-the-sqldatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/sqldatasource-component/selecting-data-with-the-sqldatasource-component.md` | 18 | Plain Language | 3 of 8 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/using-parameters-with-the-webservicedatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/data-source-components/webservicedatasource-component/using-parameters-with-the-webservicedatasource-component.md` | 16 | Plain Language | 7 of 18 detected prose sentences exceed 30 words (39%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/expressions/expressions-reference/functions/math-functions.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/expressions/expressions-reference/functions/math-functions.md` | 1 | Plain Language | 3 of 5 detected prose sentences exceed 30 words (60%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions.md` | 30 | Plain Language | 4 of 10 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/connecting-to-data/expressions/using-expressions/expressions-as-values-of-item-properties.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/connecting-to-data/expressions/using-expressions/expressions-as-values-of-item-properties.md` | 29 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `designing-reports/connecting-to-data/expressions/using-expressions/expressions-as-values-of-item-properties.md` | 37 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `designing-reports/report-book/overview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/report-book/overview.md` | 14 | Plain Language | 4 of 8 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/report-book/report-book-paging.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/report-book/report-book-paging.md` | 20 | Plain Language | 4 of 9 detected prose sentences exceed 30 words (44%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer.md` | 2 | Plain Language | 6 of 12 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/report-designer-configuration.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/report-designer-configuration.md` | 2 | Plain Language | 3 of 4 detected prose sentences exceed 30 words (75%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/datasource-wizard.md` | 14 | Plain Language | 3 of 3 detected prose sentences exceed 30 words (100%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/report-designer-tools/desktop-designers/tools/edit-action-dialog.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/report-designer-tools/desktop-designers/tools/edit-action-dialog.md` | 14 | Plain Language | 3 of 5 detected prose sentences exceed 30 words (60%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/report-designer-tools/desktop-designers/tools/group-explorer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/report-designer-tools/desktop-designers/tools/group-explorer.md` | 16 | Plain Language | 5 of 11 detected prose sentences exceed 30 words (45%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/report-designer-tools/desktop-designers/tools/load-report-dialog.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/report-designer-tools/desktop-designers/tools/load-report-dialog.md` | 14 | Plain Language | 4 of 10 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `designing-reports/report-designer-tools/report-file-formats.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `designing-reports/report-designer-tools/report-file-formats.md` | 11 | Plain Language | 3 of 4 detected prose sentences exceed 30 words (75%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `doc-output/configure-the-report-engine/fontlibrary-element.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `doc-output/configure-the-report-engine/fontlibrary-element.md` | 50 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `doc-output/configure-the-report-engine/privatefonts-element.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `doc-output/configure-the-report-engine/privatefonts-element.md` | 65 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `embedding-reports/asp-net-core-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/asp-net-core-reporting.md` | 13 | Plain Language | 7 of 19 detected prose sentences exceed 30 words (37%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/asp-net-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/asp-net-reporting.md` | 17 | Plain Language | 6 of 15 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/cache-management/configuring-the-file-cache-provider.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/cache-management/configuring-the-file-cache-provider.md` | 2 | Plain Language | 4 of 9 detected prose sentences exceed 30 words (44%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page.md` | 12 | Plain Language | 4 of 11 detected prose sentences exceed 30 words (36%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/display-reports-in-applications/web-application/blazor-report-viewer/localizarion.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/display-reports-in-applications/web-application/blazor-report-viewer/localizarion.md` | 13 | Plain Language | 1 of 1 detected prose sentences exceed 30 words (100%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/providing-custom-templates.md` | 18 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/display-reports-in-applications/web-application/native-angular-report-viewer/customizing/passing-parameter-values.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/display-reports-in-applications/web-application/native-angular-report-viewer/customizing/passing-parameter-values.md` | 14 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/customizing/how-to-create-custom-parameter-editors.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/customizing/how-to-create-custom-parameter-editors.md` | 14 | Plain Language | 5 of 13 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/display-reports-in-applications/web-application/react-report-viewer/event-binding.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/display-reports-in-applications/web-application/react-report-viewer/event-binding.md` | 2 | Plain Language | 2 of 3 detected prose sentences exceed 30 words (67%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/display-reports-in-applications/windows-forms-application/deploying-windows-forms-applications.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/display-reports-in-applications/windows-forms-application/deploying-windows-forms-applications.md` | 18 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/display-reports-in-applications/wpf-application/customizing/how-to-use-rounded-corners.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/display-reports-in-applications/wpf-application/customizing/how-to-use-rounded-corners.md` | 13 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/host-the-report-engine-remotely/rest-api-reference/clients-api/keep-client-alive.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/host-the-report-engine-remotely/rest-api-reference/clients-api/keep-client-alive.md` | 36 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/host-the-report-engine-remotely/rest-api-reference/clients-api/unregister-client.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/host-the-report-engine-remotely/rest-api-reference/clients-api/unregister-client.md` | 36 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/host-the-report-engine-remotely/rest-api-reference/documents-api/resolve-document.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/host-the-report-engine-remotely/rest-api-reference/documents-api/resolve-document.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/host-the-report-engine-remotely/rest-api-reference/general-api/get-configuration.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/host-the-report-engine-remotely/rest-api-reference/general-api/get-configuration.md` | 1 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/host-the-report-engine-remotely/rest-api-reference/json-entities/bookmarknode.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/host-the-report-engine-remotely/rest-api-reference/json-entities/bookmarknode.md` | 1 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/host-the-report-engine-remotely/rest-api-reference/json-entities/documentinfo.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/host-the-report-engine-remotely/rest-api-reference/json-entities/documentinfo.md` | 1 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/host-the-report-engine-remotely/rest-api-reference/json-entities/formatkey.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/host-the-report-engine-remotely/rest-api-reference/json-entities/formatkey.md` | 39 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/host-the-report-engine-remotely/rest-api-reference/json-entities/searchresultsinfo.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/host-the-report-engine-remotely/rest-api-reference/json-entities/searchresultsinfo.md` | 1 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/host-the-report-engine-remotely/rest-api-reference/report-parameters-api/get-report-parameters.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/host-the-report-engine-remotely/rest-api-reference/report-parameters-api/get-report-parameters.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/program-the-report-definition/create-report-items-programmatically.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/program-the-report-definition/create-report-items-programmatically.md` | 14 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/program-the-report-definition/create-sections-programmatically.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/program-the-report-definition/create-sections-programmatically.md` | 16 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `embedding-reports/program-the-report-definition/report-events/using-report-events.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `embedding-reports/program-the-report-definition/report-events/using-report-events.md` | 14 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `getting-started/installation/cdn-assets.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `getting-started/installation/cdn-assets.md` | 13 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `getting-started/installation/telerik-cli.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `getting-started/installation/telerik-cli.md` | 53 | Heading Structure | Heading level jumps from H2 to H4. | Use the next sequential heading level so the outline reflects the content hierarchy. |
| High | `getting-started/installation/telerik-cli.md` | 93 | Heading Structure | Heading level jumps from H2 to H4. | Use the next sequential heading level so the outline reflects the content hierarchy. |

#### `getting-started/video-onboarding.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `getting-started/video-onboarding.md` | 17 | Plain Language | 4 of 11 detected prose sentences exceed 30 words (36%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `interactivity/actions/bookmark-action.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `interactivity/actions/bookmark-action.md` | 19 | Heading Structure | The article contains multiple H1 headings. | Keep one H1 for the article title and use H2/H3 for sections. |

#### `interactivity/actions/custom-action.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `interactivity/actions/custom-action.md` | 24 | Heading Structure | The article contains multiple H1 headings. | Keep one H1 for the article title and use H2/H3 for sections. |

#### `interactivity/actions/drilldown-report-action.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `interactivity/actions/drilldown-report-action.md` | 23 | Heading Structure | The article contains multiple H1 headings. | Keep one H1 for the article title and use H2/H3 for sections. |

#### `interactivity/actions/hyperlink-action.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `interactivity/actions/hyperlink-action.md` | 25 | Heading Structure | The article contains multiple H1 headings. | Keep one H1 for the article title and use H2/H3 for sections. |

#### `knowledge-base/accessing-previous-record-in-detail-section-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/accessing-previous-record-in-detail-section-telerik-reporting.md` | 22 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/accessing-previous-record-in-detail-section-telerik-reporting.md` | 30 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/accessing-values-winforms-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/accessing-values-winforms-report-viewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/accumulate-expression-from-group-total-in-overall-total.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/accumulate-expression-from-group-total-in-overall-total.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/actions-not-working-on-preview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/actions-not-working-on-preview.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/add-authentication-header-webreportdesigner.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/add-authentication-header-webreportdesigner.md` | 20 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/add-custom-headers-to-responses-of-rests-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/add-custom-headers-to-responses-of-rests-service.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/add-gauge-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/add-gauge-report-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/add-header-printable-on-every-page-to-list.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/add-header-printable-on-every-page-to-list.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/add-in-set-null-reference-exception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/add-in-set-null-reference-exception.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/add-narv-using-yarn-package-manager.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/add-narv-using-yarn-package-manager.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/add-pattern-styles-graph-column-stack-bars-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/add-pattern-styles-graph-column-stack-bars-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/add-same-rendering-extension-twice-with-different-configuration.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/add-same-rendering-extension-twice-with-different-configuration.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/add-total-in-graph.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/add-total-in-graph.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/adding-calendar-to-telerik-report.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/adding-calendar-to-telerik-report.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/adding-external-data-provider-to-dotnet-standalone-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/adding-external-data-provider-to-dotnet-standalone-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/adding-reporting-net-core-mvc.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/adding-reporting-net-core-mvc.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/adding-web-report-designer-in-net-core-mvc.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/adding-web-report-designer-in-net-core-mvc.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/adjust-crosstab-to-page-width.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/adjust-crosstab-to-page-width.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/adjust-legend-marker-text.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/adjust-legend-marker-text.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/adjusting-currency-formatting-csv-export-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/adjusting-currency-formatting-csv-export-reporting.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/adjusting-textbox-spacing-layout-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/adjusting-textbox-spacing-layout-telerik-reporting.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/adobe-reader-search-in-pdf-not-working.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/adobe-reader-search-in-pdf-not-working.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/after-installing-telerik-reporting-there-is-no-telerik-menu.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/after-installing-telerik-reporting-there-is-no-telerik-menu.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/after-upgrade-html5-viewer-template-is-broken.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/after-upgrade-html5-viewer-template-is-broken.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/ai-assisted-json-report-editing.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/ai-assisted-json-report-editing.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/align-barseries-datapointlabel-to-graph-right-side.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/align-barseries-datapointlabel-to-graph-right-side.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/aligning-legend-items-vertically-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/aligning-legend-items-vertically-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/alternate-cell-background-color-by-table-group.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/alternate-cell-background-color-by-table-group.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/an-error-has-occurred-while-loading-the-reportdesigners-workbench.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/an-error-has-occurred-while-loading-the-reportdesigners-workbench.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/angular-component-properties-in-viewer-events.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/angular-component-properties-in-viewer-events.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/angular-error-loading-report-viewers-templates.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/angular-error-loading-report-viewers-templates.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/angular-error-loading-report-viewers-templates.md` | 47 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/angular-error-loading-report-viewers-templates.md` | 57 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/angular-report-viewer-and-netcore-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/angular-report-viewer-and-netcore-service.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/angular-report-viewer-in-multiple-tabs.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/angular-report-viewer-in-multiple-tabs.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/angular6-application-with-local-resources.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/angular6-application-with-local-resources.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/anti-forgery-token-issue-in-asp-net-core-application.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/anti-forgery-token-issue-in-asp-net-core-application.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/applying-conditional-formatting-rule-to-expandable-area.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/applying-conditional-formatting-rule-to-expandable-area.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/asp-dot-net-core-error-the-type-initializer-for-telerik-reporting-cache-lock.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/asp-dot-net-core-error-the-type-initializer-for-telerik-reporting-cache-lock.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/aspnet-webforms-website-resolving-invalid-license-watermark.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/aspnet-webforms-website-resolving-invalid-license-watermark.md` | 16 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/async-methods-objectdatasource.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/async-methods-objectdatasource.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/attempting-to-get-range-that-intersects-with-an-already-merged-range.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/attempting-to-get-range-that-intersects-with-an-already-merged-range.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/azure-reporting-problems.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/azure-reporting-problems.md` | 1 | Plain Language | 2 of 2 detected prose sentences exceed 30 words (100%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/azure-reporting-problems.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/binaryformatter-exception-after-upgrade-to-net5.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/binaryformatter-exception-after-upgrade-to-net5.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/blank-icons-in-blazor-native-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/blank-icons-in-blazor-native-report-viewer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/blank-report-in-asp.net-reportviewer-on-ipad-iphone.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/blank-report-in-asp.net-reportviewer-on-ipad-iphone.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/blazor-wasm-system-drawing-common-not-supported.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/blazor-wasm-system-drawing-common-not-supported.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/borders-style-is-not-applied.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/borders-style-is-not-applied.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/can-i-specify-a-default-file-name-when-exporting-from-the-silverlight-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/can-i-specify-a-default-file-name-when-exporting-from-the-silverlight-report-viewer.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-access-the-reporting-rest-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-access-the-reporting-rest-service.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-connect-wpf-report-viewer-to-report-server-or-rest-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-connect-wpf-report-viewer-to-report-server-or-rest-service.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-convert-to-telerik-reportviewer-html5-webforms-reportsource.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-convert-to-telerik-reportviewer-html5-webforms-reportsource.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-create-objects-from-string-representations.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-create-objects-from-string-representations.md` | 1 | Plain Language | 2 of 3 detected prose sentences exceed 30 words (67%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/cannot-create-objects-from-string-representations.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-find-telerik-namespace-build-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-find-telerik-namespace-build-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-implicitly-convert-type-telerik.reporting.xxxreportsource-to-telerik.reportviewer_html5.webforms.reportsource-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-implicitly-convert-type-telerik.reporting.xxxreportsource-to-telerik.reportviewer_html5.webforms.reportsource-error.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-load-file-or-assembly-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-load-file-or-assembly-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-load-html5-viewer-templates-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-load-html5-viewer-templates-error.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-load-telerik-reporting-chart-type.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-load-telerik-reporting-chart-type.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/cannot-load-telerik-reporting-chart-type.md` | 26 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/cannot-load-telerik-reporting-chart-type.md` | 32 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/cannot-refresh-html5-reportviewer-parameters.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-refresh-html5-reportviewer-parameters.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-serialize-sessions-state.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-serialize-sessions-state.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-show-multicolumn-subreports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-show-multicolumn-subreports.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-show-report-reportviewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-show-report-reportviewer.md` | 16 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/cannot-write-datetime-with-kind-unspecified-postgresql.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cannot-write-datetime-with-kind-unspecified-postgresql.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/center-align-legend-text-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/center-align-legend-text-telerik-reporting.md` | 20 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/certificate-chain-was-issued-by-authority-not-trusted.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/certificate-chain-was-issued-by-authority-not-trusted.md` | 1 | Plain Language | 3 of 5 detected prose sentences exceed 30 words (60%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/certificate-chain-was-issued-by-authority-not-trusted.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/change-background-image-through-binding.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/change-background-image-through-binding.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/change-datetime-parameters-format.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/change-datetime-parameters-format.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/change-page-settings-from-the-client-side.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/change-page-settings-from-the-client-side.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/change-preview-button-position.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/change-preview-button-position.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/change-recent-folders-listed-in-the-standalone-report-designer-open-menu.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/change-recent-folders-listed-in-the-standalone-report-designer-open-menu.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/change-row-color-based-on-value.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/change-row-color-based-on-value.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/change-sub-report-based-on-main-report-s-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/change-sub-report-based-on-main-report-s-data.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/changes-on-items-in-report-events-are-not-applied.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/changes-on-items-in-report-events-are-not-applied.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/changing-data-point-label-position-bar-graph.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/changing-data-point-label-position-bar-graph.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/changing-the-connection-string-dynamically-according-to-runtime-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/changing-the-connection-string-dynamically-according-to-runtime-data.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/characters-not-appearing-correctly-in-pdf-files.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/characters-not-appearing-correctly-in-pdf-files.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/check-if-data-field-exists-before-using-it.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/check-if-data-field-exists-before-using-it.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/client-id-not-found-or-expired.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/client-id-not-found-or-expired.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/close-multi-select-parameter-editor-on-each-selection-html5-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/close-multi-select-parameter-editor-on-each-selection-html5-viewer.md` | 1 | Plain Language | 3 of 5 detected prose sentences exceed 30 words (60%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/close-multi-select-parameter-editor-on-each-selection-html5-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/colorpalette-set-with-bindings.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/colorpalette-set-with-bindings.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/combine-chart-and-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/combine-chart-and-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/combine-chart-and-report-viewer.md` | 30 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/combine-chart-and-report-viewer.md` | 39 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/combine-chart-and-report-viewer.md` | 51 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/combine-chart-and-report-viewer.md` | 64 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/combine-data-from-multiple-web-services-in-one-table.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/combine-data-from-multiple-web-services-in-one-table.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/combobox-parameter-editor-virtualization.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/combobox-parameter-editor-virtualization.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/command-injection-cve-2024-7840.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/command-injection-cve-2024-7840.md` | 1 | Plain Language | 4 of 9 detected prose sentences exceed 30 words (44%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/common-report-designers-problems.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/common-report-designers-problems.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/conditional-formatting-not-applied-to-the-entire-row.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/conditional-formatting-not-applied-to-the-entire-row.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/conditional-formatting-not-applied-to-the-entire-row.md` | 29 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/conditional-formatting-not-applied-to-the-entire-row.md` | 45 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/conditional-page-breaks.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/conditional-page-breaks.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/configure-the-stand-alone-report-designer-sqlite-data-provider.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/configure-the-stand-alone-report-designer-sqlite-data-provider.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/configuring-postgres-with-npgsql.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/configuring-postgres-with-npgsql.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/configuring-the-csv-rendering-extension.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/configuring-the-csv-rendering-extension.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/configuring-the-image-rendering-extension-to-generate-tiff-files.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/configuring-the-image-rendering-extension-to-generate-tiff-files.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/conflicting-actions-error-in-swagger-generation-net-core.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/conflicting-actions-error-in-swagger-generation-net-core.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/conflicting-actions-error-in-swagger-generation-net-core.md` | 37 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/conflicting-actions-error-in-swagger-generation-net-core.md` | 45 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/conflicting-actions-error-in-swagger-generation-net-core.md` | 58 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/congiguring-telerik-reporting-to-access-pasoe-authentication-with-oerealm.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/congiguring-telerik-reporting-to-access-pasoe-authentication-with-oerealm.md` | 1 | Plain Language | 1 of 1 detected prose sentences exceed 30 words (100%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/congiguring-telerik-reporting-to-access-pasoe-authentication-with-oerealm.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/connecting-to-microsoft-data-sqlclient-in-web-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/connecting-to-microsoft-data-sqlclient-in-web-report-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/connecting-to-mssql-database-in-net-core-winforms-application.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/connecting-to-mssql-database-in-net-core-winforms-application.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/converting-reports-from-activereports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/converting-reports-from-activereports.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/converting-reports-from-various-versions-of-crystalreports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/converting-reports-from-various-versions-of-crystalreports.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/core-how-to-pass-information-from-httpcontext-to-reporting-engine.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/core-how-to-pass-information-from-httpcontext-to-reporting-engine.md` | 1 | Plain Language | 3 of 7 detected prose sentences exceed 30 words (43%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/core-how-to-pass-information-from-httpcontext-to-reporting-engine.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/corrupted-reports-when-dataset-is-empty.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/corrupted-reports-when-dataset-is-empty.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/could-not-find-telerik-report-viewer-interop.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/could-not-find-telerik-report-viewer-interop.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/could-not-find-telerik-report-viewer-interop.md` | 21 | Plain Language | 2 of 3 detected prose sentences exceed 30 words (67%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/could-not-load-file-assembly-telerik-blazor.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/could-not-load-file-assembly-telerik-blazor.md` | 1 | Plain Language | 2 of 3 detected prose sentences exceed 30 words (67%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/could-not-load-file-assembly-telerik-blazor.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/could-not-retrieve-information-for-folder-web-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/could-not-retrieve-information-for-folder-web-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/count-records-with-specific-column-value.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/count-records-with-specific-column-value.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/create-custom-shaped-marker-for-graph-s-legend-items.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/create-custom-shaped-marker-for-graph-s-legend-items.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/create-feature-report-custom-toc-level.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/create-feature-report-custom-toc-level.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/create-master-detail-report-using-subreport-item.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/create-master-detail-report-using-subreport-item.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/create-master-detail-report-using-table.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/create-master-detail-report-using-table.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/create-merge-cell-dynamic-table-crosstab.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/create-merge-cell-dynamic-table-crosstab.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/create-tables-programmatically.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/create-tables-programmatically.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/create-timeline-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/create-timeline-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/creating-user-functions-in-vs-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/creating-user-functions-in-vs-designer.md` | 26 | Plain Language | 4 of 10 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/cross-site-scripting-(xss)-and-the-legacy-telerik-reporting-asp.net-webforms-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/cross-site-scripting-(xss)-and-the-legacy-telerik-reporting-asp.net-webforms-report-viewer.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/cross-site-scripting-(xss)-and-the-legacy-telerik-reporting-asp.net-webforms-report-viewer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/crystal-reports-convert-programmatically.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/crystal-reports-convert-programmatically.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/culturenotfoundexception-culture-is-not-supported.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/culturenotfoundexception-culture-is-not-supported.md` | 1 | Plain Language | 4 of 5 detected prose sentences exceed 30 words (80%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/culturenotfoundexception-culture-is-not-supported.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/currency-formatted-textbox-does-not-render-correctly-in-certain-environments.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/currency-formatted-textbox-does-not-render-correctly-in-certain-environments.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/custom-definition-storage-does-not-implement-interface-member.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/custom-definition-storage-does-not-implement-interface-member.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/custom-headers-with-reportviewer-rest-api-calls.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/custom-headers-with-reportviewer-rest-api-calls.md` | 1 | Plain Language | 5 of 10 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/custom-headers-with-reportviewer-rest-api-calls.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/custom-parameter-editors-stopped-working-19-1-25-521.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/custom-parameter-editors-stopped-working-19-1-25-521.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/custom-rendering-extension.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/custom-rendering-extension.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/customize-wpf-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/customize-wpf-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/data-binding-problems.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/data-binding-problems.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/data-explorer-does-not-show-all-or-any-data-fields.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/data-explorer-does-not-show-all-or-any-data-fields.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/data-provider-is-missing-in-the-sqldatasource-wizard.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/data-provider-is-missing-in-the-sqldatasource-wizard.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/data-provider-is-missing-in-the-sqldatasource-wizard.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/data-source-components-problems.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/data-source-components-problems.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/denied-access-to-path-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/denied-access-to-path-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/deploy-telerik-reporting-with-newer-openxml-sdk-version.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/deploy-telerik-reporting-with-newer-openxml-sdk-version.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/deploying-trdx-(xml-report-definition)-that-uses-external-assembly.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/deploying-trdx-(xml-report-definition)-that-uses-external-assembly.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/deploying-with-libgdiplus-on-linux-and-macos.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/deploying-with-libgdiplus-on-linux-and-macos.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/disable-build-new-data-connections-wrd.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/disable-build-new-data-connections-wrd.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/disable-logging-tracing-information-from-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/disable-logging-tracing-information-from-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/disable-switching-between-scale-modes-with-double-click.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/disable-switching-between-scale-modes-with-double-click.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/disable-switching-between-scale-modes-with-double-click.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/display-continued-text-repeatable-group-headers.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/display-continued-text-repeatable-group-headers.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/display-custom-error-messages-on-web-based-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/display-custom-error-messages-on-web-based-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/display-fixed-number-of-rows-table.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/display-fixed-number-of-rows-table.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/display-print-dialog-without-displaying-report-on-webpage.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/display-print-dialog-without-displaying-report-on-webpage.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/display-reports-in-maui-blazor-pdf-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/display-reports-in-maui-blazor-pdf-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/display-web-report-designer-in-angular-application.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/display-web-report-designer-in-angular-application.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/displaying-column-totals-formatting-dates-reporting-chart.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/displaying-column-totals-formatting-dates-reporting-chart.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/displaying-reportbooks-and-reports-with-subreports-from-report-server-using-custom-report-source-resolver.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/displaying-reportbooks-and-reports-with-subreports-from-report-server-using-custom-report-source-resolver.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/displaying-reports-from-report-server-through-custom-report-source-resolver.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/displaying-reports-from-report-server-through-custom-report-source-resolver.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/displaying-telerik-report-in-net-maui-and-maui-blazor-applications.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/displaying-telerik-report-in-net-maui-and-maui-blazor-applications.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/dispose-of-the-web-report-designer-resources.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/dispose-of-the-web-report-designer-resources.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/do-i-need-to-use-a-data-source-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/do-i-need-to-use-a-data-source-component.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/docker-container-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/docker-container-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/document-map-missing-icons.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/document-map-missing-icons.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/draw-box-border-around-each-data-field-character.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/draw-box-border-around-each-data-field-character.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/dropdown-filters-in-html5-report-viewers.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/dropdown-filters-in-html5-report-viewers.md` | 1 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/dropdown-filters-in-html5-report-viewers.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/dtd-prohibited-exception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/dtd-prohibited-exception.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/dynamic-page-size-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/dynamic-page-size-telerik-reporting.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/dynamic-reportbook-name-on-export.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/dynamic-reportbook-name-on-export.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/edit-report-datasources-at-runtime.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/edit-report-datasources-at-runtime.md` | 1 | Plain Language | 3 of 5 detected prose sentences exceed 30 words (60%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/edit-report-datasources-at-runtime.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/edit-sqldatasource-wizard-available-connections.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/edit-sqldatasource-wizard-available-connections.md` | 1 | Plain Language | 4 of 7 detected prose sentences exceed 30 words (57%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/edit-sqldatasource-wizard-available-connections.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/enable-per-report-rendering-format-settings.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/enable-per-report-rendering-format-settings.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/enable-text-input-send-email-dialog-react-reportviewer-material-ui-modal.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/enable-text-input-send-email-dialog-react-reportviewer-material-ui-modal.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/enable-text-input-send-email-dialog-react-reportviewer-material-ui-modal.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/encoder-requires-specific-barcode-length.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/encoder-requires-specific-barcode-length.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/ensure-consistent-border-width-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/ensure-consistent-border-width-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-401-failed-to-retrieve-information-from-remote-source-nugettelerikcom-on-restoring-nuget-packages-in-net-core-project.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-401-failed-to-retrieve-information-from-remote-source-nugettelerikcom-on-restoring-nuget-packages-in-net-core-project.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-after-update-to-R2-2018-due-to-old-newtonsoft-json-version.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-after-update-to-R2-2018-due-to-old-newtonsoft-json-version.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-bar-style-graphs-telerik-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-bar-style-graphs-telerik-report-designer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-building-project-after-adding-wpf-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-building-project-after-adding-wpf-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-data-source-name-not-found-when-using-odbc-connection-with-telerik-report-server.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-data-source-name-not-found-when-using-odbc-connection-with-telerik-report-server.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-failed-to-execute-initstorageevent-on-storageevent.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-failed-to-execute-initstorageevent-on-storageevent.md` | 1 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/error-failed-to-execute-initstorageevent-on-storageevent.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-handling-in-reports-and-report-viewers.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-handling-in-reports-and-report-viewers.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-hresult-e-fail-has-been-returned-from-a-call-to-a-com-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-hresult-e-fail-has-been-returned-from-a-call-to-a-com-component.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-in-internet-explorer-only-secure-content-is-displayed.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-in-internet-explorer-only-secure-content-is-displayed.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/error-in-internet-explorer-only-secure-content-is-displayed.md` | 34 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/error-in-internet-explorer-only-secure-content-is-displayed.md` | 46 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/error-in-web-site-project-failed-to-setup-service-system-invalidcastexception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-in-web-site-project-failed-to-setup-service-system-invalidcastexception.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-occurs-when-the-wpf-themes-are-referred-locally.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-occurs-when-the-wpf-themes-are-referred-locally.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-opening-reports-report-server-standalone-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-opening-reports-report-server-standalone-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-promise-is-undefined.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-promise-is-undefined.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-registering-the-viewer-with-the-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-registering-the-viewer-with-the-service.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-resource-not-found-after-finishing-the-item-template-wizard.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-resource-not-found-after-finishing-the-item-template-wizard.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-showtext-true-text-exceeds-barcode-boundaries.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-showtext-true-text-exceeds-barcode-boundaries.md` | 1 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/error-showtext-true-text-exceeds-barcode-boundaries.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-system-argumentexception-a-route-named-x-is-already-in-the-route-collection.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-system-argumentexception-a-route-named-x-is-already-in-the-route-collection.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-table-minimum-size-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-table-minimum-size-designer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-value-cannot-be-null-parameter-name-instance-vs2017-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-value-cannot-be-null-parameter-name-instance-vs2017-report-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/error-when-adding-viewer-to-vs.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/error-when-adding-viewer-to-vs.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/exclude-report-header-csv-export-telerik.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/exclude-report-header-csv-export-telerik.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/expand-or-collapse-entire-drill-down-report-with-a-report-parameter.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/expand-or-collapse-entire-drill-down-report-with-a-report-parameter.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/export-a-report-from-telerik-report-server-via-dot-net-client.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/export-a-report-from-telerik-report-server-via-dot-net-client.md` | 1 | Plain Language | 3 of 7 detected prose sentences exceed 30 words (43%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/export-a-report-from-telerik-report-server-via-dot-net-client.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/export-data-to-multiple-worksheets.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/export-data-to-multiple-worksheets.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/export-of-blazor-native-viewer-in-telerik-window-not-working.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/export-of-blazor-native-viewer-in-telerik-window-not-working.md` | 1 | Plain Language | 3 of 7 detected prose sentences exceed 30 words (43%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/export-of-blazor-native-viewer-in-telerik-window-not-working.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/export-or-print-same-report-on-paper-with-different-properties.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/export-or-print-same-report-on-paper-with-different-properties.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/export-to-pdf-fails-from-asp-dot-net-core-2-2-projects.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/export-to-pdf-fails-from-asp-dot-net-core-2-2-projects.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/exporting-a-report-to-pdf-programmatically.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/exporting-a-report-to-pdf-programmatically.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/exporting-a-report-to-pdf-programmatically.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/exporting-reports-excel-not-working-after-upgrade.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/exporting-reports-excel-not-working-after-upgrade.md` | 1 | Plain Language | 2 of 3 detected prose sentences exceed 30 words (67%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/exporting-reports-powershell.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/exporting-reports-powershell.md` | 19 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/expression-contains-undefined-myuserfunction-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/expression-contains-undefined-myuserfunction-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/extract-inline-images-picturebox-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/extract-inline-images-picturebox-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/failed-to-create-component-reportviewer-after-upgrade.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/failed-to-create-component-reportviewer-after-upgrade.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/failed-to-map-the-path---exception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/failed-to-map-the-path---exception.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/field-not-found-telerik-reporting-processing-useridentity-current-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/field-not-found-telerik-reporting-processing-useridentity-current-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/filter-data-based-on-aggregate-function-through-subreport.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/filter-data-based-on-aggregate-function-through-subreport.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/fixing-cut-off-letters-web-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/fixing-cut-off-letters-web-report-viewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/fixing-font-layout-chart-export-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/fixing-font-layout-chart-export-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/fixing-greyed-out-rest-service-option-blazor-reportviewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/fixing-greyed-out-rest-service-option-blazor-reportviewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/fixing-imvcbuilder-errors-telerik-reporting-rest-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/fixing-imvcbuilder-errors-telerik-reporting-rest-service.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/fixing-licensing-issues-upgrading-telerik-reporting-19-1-25.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/fixing-licensing-issues-upgrading-telerik-reporting-19-1-25.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/fixing-missing-ai-powered-insight-icon-telerik-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/fixing-missing-ai-powered-insight-icon-telerik-report-viewer.md` | 1 | Plain Language | 3 of 7 detected prose sentences exceed 30 words (43%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/fixing-missing-ai-powered-insight-icon-telerik-report-viewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/font-is-incorrect-on-first-render-azure.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/font-is-incorrect-on-first-render-azure.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/font-is-missing-in-report-designers.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/font-is-missing-in-report-designers.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/format-mssql-time-and-dotnet-timespan.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/format-mssql-time-and-dotnet-timespan.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/freeze-column-header-with-action-not-working.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/freeze-column-header-with-action-not-working.md` | 1 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/freeze-column-header-with-action-not-working.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/full-page-rendering-background-image-reports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/full-page-rendering-background-image-reports.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/generated-barcode-size-greater.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/generated-barcode-size-greater.md` | 1 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/generated-barcode-size-greater.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/generic-error-occurred-in-gdiplus-while-using-measurestring.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/generic-error-occurred-in-gdiplus-while-using-measurestring.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/getauthenticationstateasync-was-called-before-setauthenticationstate.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/getauthenticationstateasync-was-called-before-setauthenticationstate.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/getting-telerik-reportViewer-is-not-a-function-console-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/getting-telerik-reportViewer-is-not-a-function-console-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-add-drilldown-action.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-add-drilldown-action.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-add-secondary-axis.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-add-secondary-axis.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-add-series.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-add-series.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-bindings-to-control-coordinate-system-properties.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-bindings-to-control-coordinate-system-properties.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-change-axis-scale.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-change-axis-scale.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-change-chart-type.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-change-chart-type.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-change-gap-between-bars.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-change-gap-between-bars.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-create-programmatically.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-create-programmatically.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-item-with-datetimescale-and-one-category-slot-displays-only-the-first-date-of-the-year.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-item-with-datetimescale-and-one-category-slot-displays-only-the-first-date-of-the-year.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/graph-item-with-datetimescale-and-one-category-slot-displays-only-the-first-date-of-the-year.md` | 27 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/graph-manually-create-chart.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-manually-create-chart.md` | 31 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-pie-chart-no-overlapping-labels.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-pie-chart-no-overlapping-labels.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-swap-axes.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-swap-axes.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-switch-rows-columns.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-switch-rows-columns.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/graph-with-column-line-series.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/graph-with-column-line-series.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/group-data-report-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/group-data-report-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/group-specific-page-numbering-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/group-specific-page-numbering-telerik-reporting.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/handling-errors-occurring-in-a-custom-resolver-used-by-a-reporting-rest-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/handling-errors-occurring-in-a-custom-resolver-used-by-a-reporting-rest-service.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/hide-or-change-html5-report-viewer-toolbar-buttons.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/hide-or-change-html5-report-viewer-toolbar-buttons.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/hide-sub-report-if-there-is-no-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/hide-sub-report-if-there-is-no-data.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/hide-table-borders-extending-to-the-next-page.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/hide-table-borders-extending-to-the-next-page.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/hierarchical-report-from-flat-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/hierarchical-report-from-flat-data.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/hierarchical-report-from-nested-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/hierarchical-report-from-nested-data.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/hierarchical-report-from-nested-data.md` | 59 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/hierarchical-report-from-nested-data.md` | 67 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/hosting-with-medium-trust-request-for-permission-failed.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/hosting-with-medium-trust-request-for-permission-failed.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-do-i-display-pdf-directly-in-the-browser-without-exporting-first.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-do-i-display-pdf-directly-in-the-browser-without-exporting-first.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-add-interactivity-to-a-report-using-action-event-handlers-in-winforms-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-add-interactivity-to-a-report-using-action-event-handlers-in-winforms-report-viewer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-add-interactivity-to-a-report-using-action-event-handlers-in-wpf-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-add-interactivity-to-a-report-using-action-event-handlers-in-wpf-report-viewer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-add-interactivity-to-a-report-using-action-event-handlers-with-html5-based-report-viewers.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-add-interactivity-to-a-report-using-action-event-handlers-with-html5-based-report-viewers.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-add-multiple-tables-dynamically-based-on-data-source.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-add-multiple-tables-dynamically-based-on-data-source.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-bind-sub-report-to-main-report-s-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-bind-sub-report-to-main-report-s-data.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/how-to-bind-sub-report-to-main-report-s-data.md` | 31 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/how-to-bind-sub-report-to-main-report-s-data.md` | 40 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/how-to-build-and-Install-libgdiplus-linux.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-build-and-Install-libgdiplus-linux.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/how-to-build-and-Install-libgdiplus-linux.md` | 44 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/how-to-build-and-Install-libgdiplus-linux.md` | 64 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/how-to-build-and-Install-libgdiplus-linux.md` | 71 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/how-to-build-and-Install-libgdiplus-linux.md` | 94 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/how-to-build-and-Install-libgdiplus-linux.md` | 112 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/how-to-change-report-parameter-date-format-in-html5-mvc-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-change-report-parameter-date-format-in-html5-mvc-report-viewer.md` | 1 | Plain Language | 4 of 8 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-change-report-parameter-date-format-in-html5-mvc-report-viewer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-change-reporting-rest-web-api-routes-registered-by-default.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-change-reporting-rest-web-api-routes-registered-by-default.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-change-the-culture-of-the-datepicker-in-html5-mvc-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-change-the-culture-of-the-datepicker-in-html5-mvc-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-change-the-culture-of-the-datepicker-in-html5-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-change-the-culture-of-the-datepicker-in-html5-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-change-the-space-between-charts-series.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-change-the-space-between-charts-series.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-connect-to-google-books-apis.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-connect-to-google-books-apis.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-connect-to-mysql-database-through-the-sql-datasource-wizard-in-the-web-reportdesginer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-connect-to-mysql-database-through-the-sql-datasource-wizard-in-the-web-reportdesginer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-control-the-drilldown-glyph-icon-alignment-within-the-table-crosstab-cell.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-control-the-drilldown-glyph-icon-alignment-within-the-table-crosstab-cell.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-convert-svg-to-png.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-convert-svg-to-png.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-create-a-dynamic-table-crosstab-list-item.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-create-a-dynamic-table-crosstab-list-item.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-create-custom-shape.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-create-custom-shape.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-create-graph-with-merged-last-column-which-can-expand-and-collapse.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-create-graph-with-merged-last-column-which-can-expand-and-collapse.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-create-html5-mvc-report-viewer-inside-master-page-layout.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-create-html5-mvc-report-viewer-inside-master-page-layout.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-create-multi-column-report---across-the-page-and-then-down.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-create-multi-column-report---across-the-page-and-then-down.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-create-multiselect-checkbox-parameter-editor.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-create-multiselect-checkbox-parameter-editor.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-create-plot-bands-using-the-graph-item.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-create-plot-bands-using-the-graph-item.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-create-waterfall-chart-using-graph.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-create-waterfall-chart-using-graph.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-customize-export-options-of-angular-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-customize-export-options-of-angular-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-customize-export-options-of-html5-viewer-based-on-report.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-customize-export-options-of-html5-viewer-based-on-report.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/how-to-customize-export-options-of-html5-viewer-based-on-report.md` | 26 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/how-to-customize-series-markers.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-customize-series-markers.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-customize-viewer-using-kendo-ui-sass-based-theme.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-customize-viewer-using-kendo-ui-sass-based-theme.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-customize-web-service-data-source-url.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-customize-web-service-data-source-url.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-deal-with-stored-procedure-optional-parameters.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-deal-with-stored-procedure-optional-parameters.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-determine-effective-visibility-of-parameters-area.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-determine-effective-visibility-of-parameters-area.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-display-a-report-via-instancereportsource-in-the-html5-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-display-a-report-via-instancereportsource-in-the-html5-viewer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-display-alternating-style-rows.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-display-alternating-style-rows.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-display-groups-with-different-datasources-and-detail-sections.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-display-groups-with-different-datasources-and-detail-sections.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-display-multiple-ranges-per-series-range-bar-graph.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-display-multiple-ranges-per-series-range-bar-graph.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-display-no-data-message-for-reports-and-subreports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-display-no-data-message-for-reports-and-subreports.md` | 1 | Plain Language | 4 of 10 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-display-no-data-message-for-reports-and-subreports.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-display-page-header-on-first-page-only.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-display-page-header-on-first-page-only.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-display-ratings-stars-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-display-ratings-stars-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-display-reportbook-in-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-display-reportbook-in-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-dynamically-select-and-filter-data-in-blazor.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-dynamically-select-and-filter-data-in-blazor.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-dynamically-style-react-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-dynamically-style-react-report-viewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-edit-connection-strings-saved-by-the-standalone-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-edit-connection-strings-saved-by-the-standalone-report-designer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-expand-document-map-tree-by-default-in-html5-viewers.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-expand-document-map-tree-by-default-in-html5-viewers.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-expand-the-pdf-reader-s-bookmarks-pane-on-opening-a-pdf-file-produced-by-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-expand-the-pdf-reader-s-bookmarks-pane-on-opening-a-pdf-file-produced-by-telerik-reporting.md` | 1 | Plain Language | 3 of 5 detected prose sentences exceed 30 words (60%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-expand-the-pdf-reader-s-bookmarks-pane-on-opening-a-pdf-file-produced-by-telerik-reporting.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-export-report-in-silverlight.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-export-report-in-silverlight.md` | 16 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-fix-axe-errors-for-html5-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-fix-axe-errors-for-html5-viewer.md` | 1 | Plain Language | 9 of 20 detected prose sentences exceed 30 words (45%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-fix-axe-errors-for-html5-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-fix-reportscontrollerbase-is-obsolete.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-fix-reportscontrollerbase-is-obsolete.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-generate-and-display-unsupported-barcode-types.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-generate-and-display-unsupported-barcode-types.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-get-report-definition-of-processing-report.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-get-report-definition-of-processing-report.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-hide-print-dialog.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-hide-print-dialog.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-hide-subreport-with-no-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-hide-subreport-with-no-data.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/how-to-hide-subreport-with-no-data.md` | 44 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/how-to-hide-subreport-with-no-data.md` | 50 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/how-to-hide-subreport-with-no-data.md` | 58 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/how-to-hide-the-option-for-adding-a-new-sql-connection-in-sql-datasource-wizard-in-web-report-desgner.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-hide-the-option-for-adding-a-new-sql-connection-in-sql-datasource-wizard-in-web-report-desgner.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-implement-telerik-reporting-in-asp-net-core-mvc.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-implement-telerik-reporting-in-asp-net-core-mvc.md` | 1 | Plain Language | 5 of 14 detected prose sentences exceed 30 words (36%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-implement-telerik-reporting-in-asp-net-core-mvc.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-inject-custom-dependency-in-reports-controller-of-dot-net-core-application.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-inject-custom-dependency-in-reports-controller-of-dot-net-core-application.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-keep-whitespace-in-htmltextbox.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-keep-whitespace-in-htmltextbox.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-load-dot-net-7-assemblies-in-srd-dot-net.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-load-dot-net-7-assemblies-in-srd-dot-net.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-load-telerik-report-viewer-resources-locally-in-angular-application-and-use-them-to-customize-the-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-load-telerik-report-viewer-resources-locally-in-angular-application-and-use-them-to-customize-the-viewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-migrate-your-project-to-utilize-the-new-reportsource-objects.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-migrate-your-project-to-utilize-the-new-reportsource-objects.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-modify-graph-axis-labels.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-modify-graph-axis-labels.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-modify-table-with-preset-styles-and-width-dynamically.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-modify-table-with-preset-styles-and-width-dynamically.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-move-parameters-area.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-move-parameters-area.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-move-preview-button-at-the-top-of-parameters-area.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-move-preview-button-at-the-top-of-parameters-area.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-pass-connectionstring-to-report-dynamically-through-report-parameter.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-pass-connectionstring-to-report-dynamically-through-report-parameter.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-pass-extra-parameters-from-the-html5reportviewer-to-the-sendmailmessage-method.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-pass-extra-parameters-from-the-html5reportviewer-to-the-sendmailmessage-method.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-pass-extra-parameters-from-the-html5reportviewer-to-the-sendmailmessage-method.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-pass-information-from-httpcontext-to-reporting-engine.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-pass-information-from-httpcontext-to-reporting-engine.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-prevent-error-stack-trace-from-being-sent-with-response.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-prevent-error-stack-trace-from-being-sent-with-response.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-print-report-on-client-machine-without-showing-the-report.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-print-report-on-client-machine-without-showing-the-report.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-produce-pdf-files-fitting-the-physical-page-on-printing.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-produce-pdf-files-fitting-the-physical-page-on-printing.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-programmatically-create-a-master-detail-report-using-subreport-item.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-programmatically-create-a-master-detail-report-using-subreport-item.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-rank-categories-based-on-total-of-another-field-with-custom-aggregate.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-rank-categories-based-on-total-of-another-field-with-custom-aggregate.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-refer-telerik-reporting-assemblies-in-version-control-repository-with-limited-number-of-licenses.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-refer-telerik-reporting-assemblies-in-version-control-repository-with-limited-number-of-licenses.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-register-db-provider-factory-in-net-core-project.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-register-db-provider-factory-in-net-core-project.md` | 1 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-register-db-provider-factory-in-net-core-project.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-register-sqldatasource-data-providers-without-driver-installation.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-register-sqldatasource-data-providers-without-driver-installation.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-remove-trial-message.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-remove-trial-message.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-render-any-html-tags-in-reports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-render-any-html-tags-in-reports.md` | 1 | Plain Language | 5 of 11 detected prose sentences exceed 30 words (45%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-render-any-html-tags-in-reports.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-render-reports-asynchronously-by-using-the-async-and-await-keywords.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-render-reports-asynchronously-by-using-the-async-and-await-keywords.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-render-reports-to-pdf-with-bookmarks-r2-2021.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-render-reports-to-pdf-with-bookmarks-r2-2021.md` | 1 | Plain Language | 2 of 3 detected prose sentences exceed 30 words (67%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-render-reports-to-pdf-with-bookmarks-r2-2021.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-resize-the-report-viewer-to-accommodate-its-content.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-resize-the-report-viewer-to-accommodate-its-content.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-retrieve-the-connection-strings-from-environment-variables.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-retrieve-the-connection-strings-from-environment-variables.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-retrieve-the-connection-strings-from-environment-variables.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-reuse-content-in-different-reports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-reuse-content-in-different-reports.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-send-culture-from-client-to-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-send-culture-from-client-to-service.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-set-100-percent-height-to-the-asp-net-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-set-100-percent-height-to-the-asp-net-report-viewer.md` | 1 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-set-100-percent-height-to-the-asp-net-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-set-report-documentname-as-web-page-document-title.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-set-report-documentname-as-web-page-document-title.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-set-the-default-pdf-view-size-to-100-percentages.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-set-the-default-pdf-view-size-to-100-percentages.md` | 1 | Plain Language | 3 of 8 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-set-the-default-pdf-view-size-to-100-percentages.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-set-the-map-extent-dynamically-when-showing-a-single-data-point.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-set-the-map-extent-dynamically-when-showing-a-single-data-point.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-show-more-or-less-details-in-report-group.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-show-more-or-less-details-in-report-group.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-show-no-data-message-or-hide-an-item-in-case-of-no-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-show-no-data-message-or-hide-an-item-in-case-of-no-data.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-show-the-page-scroll-mode-button.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-show-the-page-scroll-mode-button.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-simulate-ssrs-lookup-in-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-simulate-ssrs-lookup-in-telerik-reporting.md` | 1 | Plain Language | 6 of 15 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/how-to-split-a-nested-tabel-on-two-pages.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-split-a-nested-tabel-on-two-pages.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-split-group-header-cells-in-crosstab.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-split-group-header-cells-in-crosstab.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-switch-reports-in-kendo-mvc-modal-window.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-switch-reports-in-kendo-mvc-modal-window.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-troubleshoot-errors-in-asp-net-core-applications.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-troubleshoot-errors-in-asp-net-core-applications.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-upgrade-an-old-project-to-the-latest-telerik-reporting-version.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-upgrade-an-old-project-to-the-latest-telerik-reporting-version.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-a-guid-as-value-for-report-parameter-or-data-source-parameter.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-a-guid-as-value-for-report-parameter-or-data-source-parameter.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-excel-sheet-for-datasource.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-excel-sheet-for-datasource.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-external-assemblies-with-custom-clr-objects-in-the-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-external-assemblies-with-custom-clr-objects-in-the-report-designer.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-html5-viewer-in-react-js.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-html5-viewer-in-react-js.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-kendodatetimepicker-as-an-editor-in-the-html5-viewer-s-parameters-area.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-kendodatetimepicker-as-an-editor-in-the-html5-viewer-s-parameters-area.md` | 1 | Plain Language | 4 of 7 detected prose sentences exceed 30 words (57%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/how-to-use-kendodatetimepicker-as-an-editor-in-the-html5-viewer-s-parameters-area.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-kendodatetimepicker-for-parameter-editors-in-the-angular-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-kendodatetimepicker-for-parameter-editors-in-the-angular-report-viewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-local-variables-in-a-sql-query-used-by-the-sqldatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-local-variables-in-a-sql-query-used-by-the-sqldatasource-component.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-multivalue-report-parameter-in-a-sql-query.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-multivalue-report-parameter-in-a-sql-query.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-objectdatasource-with-expandoobject.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-objectdatasource-with-expandoobject.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-odbc-connections-in-the-web-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-odbc-connections-in-the-web-report-designer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-query-parameters-native-blazor-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-query-parameters-native-blazor-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-reporting-rest-service-api-with-csharp-client.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-reporting-rest-service-api-with-csharp-client.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-reportsource-objects-with-reportbook.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-reportsource-objects-with-reportbook.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-the-web-designer-in-vue.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-the-web-designer-in-vue.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-viewer-and-designer-in-vue.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-viewer-and-designer-in-vue.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-vs-designer-in-dotnet-core.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-vs-designer-in-dotnet-core.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-use-web-report-designer-in-react-js.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-use-web-report-designer-in-react-js.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/how-to-validate-report-parameters-on-the-client.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/how-to-validate-report-parameters-on-the-client.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-report-viewer-height-issue-on-certain-screen-resolutions.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-report-viewer-height-issue-on-certain-screen-resolutions.md` | 1 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/html5-report-viewer-height-issue-on-certain-screen-resolutions.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-report-viewer-throws-405-method-not-allowed-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-report-viewer-throws-405-method-not-allowed-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-reportviewer-not-displaying-instancereportsource-reports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-reportviewer-not-displaying-instancereportsource-reports.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-reportviewer-styles-messed-up.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-reportviewer-styles-messed-up.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-viewer-does-not-load-with-jquery-slim.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-viewer-does-not-load-with-jquery-slim.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/html5-viewer-does-not-load-with-jquery-slim.md` | 38 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/html5-viewer-does-not-load-with-jquery-slim.md` | 45 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/html5-viewer-export-operations-fail-in-chrome-and-firefox-with-err-connection-reset.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-viewer-export-operations-fail-in-chrome-and-firefox-with-err-connection-reset.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-viewer-export-operations-fail-with-err_connection_reset_error_504.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-viewer-export-operations-fail-with-err_connection_reset_error_504.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-viewer-export-toolbar-button-not-working-in-ie-edge.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-viewer-export-toolbar-button-not-working-in-ie-edge.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-viewer-modify-toolbar.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-viewer-modify-toolbar.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-viewer-print-fails-due-to-pdfa-compliance-level.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-viewer-print-fails-due-to-pdfa-compliance-level.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-viewer-styles-broken-with-kendo-2022-1-119.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-viewer-styles-broken-with-kendo-2022-1-119.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-viewer-toolbar-icons-not-shown-in-ie-browser.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-viewer-toolbar-icons-not-shown-in-ie-browser.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/html5-webforms-viewer-not-working-in-ajaxified-pages.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/html5-webforms-viewer-not-working-in-ajaxified-pages.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/htmltextbox-an-error-occurred-while-parsing-entityname.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/htmltextbox-an-error-occurred-while-parsing-entityname.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/htmltextbox-with-anchor-tag-vs-hyperlink-action.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/htmltextbox-with-anchor-tag-vs-hyperlink-action.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/http-error-net-core.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/http-error-net-core.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/httpcontext.current.user-is-not-available-in-the-data-retrieval-method-executed-by-an-objectdatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/httpcontext.current.user-is-not-available-in-the-data-retrieval-method-executed-by-an-objectdatasource-component.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/images-are-shrunk-in-docx-xlsx-pptx-formats-on-mac-machines.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/images-are-shrunk-in-docx-xlsx-pptx-formats-on-mac-machines.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/images-are-shrunk-when-a-docx-file-is-saved-as-pdf-in-ms-word.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/images-are-shrunk-when-a-docx-file-is-saved-as-pdf-in-ms-word.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/images-charts-barcodes-and-shapes-are-not-being-displayed-in-the-silverlight-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/images-charts-barcodes-and-shapes-are-not-being-displayed-in-the-silverlight-report-viewer.md` | 1 | Plain Language | 4 of 10 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/images-charts-barcodes-and-shapes-are-not-being-displayed-in-the-silverlight-report-viewer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/images-disappear-from-word-report-after-save.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/images-disappear-from-word-report-after-save.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/images-missing-from-docx-in-onedrive.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/images-missing-from-docx-in-onedrive.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/images-missing-from-docx-in-onedrive.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/images-not-displayed-in-dotnet-core-3.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/images-not-displayed-in-dotnet-core-3.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/implement-database-definition-storage-efcore.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/implement-database-definition-storage-efcore.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/inconsistent-font-of-the-first-few-report-items.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/inconsistent-font-of-the-first-few-report-items.md` | 1 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/inconsistent-font-of-the-first-few-report-items.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/inconsistent-formatting-in-dotnet-core-and-dotnet-framework.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/inconsistent-formatting-in-dotnet-core-and-dotnet-framework.md` | 1 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/inconsistent-formatting-in-dotnet-core-and-dotnet-framework.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/insecure-type-resolution-cve-2024-8014.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/insecure-type-resolution-cve-2024-8014.md` | 1 | Plain Language | 4 of 11 detected prose sentences exceed 30 words (36%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/insert-pagebreak-per-n-records.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/insert-pagebreak-per-n-records.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/installer-fails.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/installer-fails.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/instantiation-vulnerability-cve-2024-4202.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/instantiation-vulnerability-cve-2024-4202.md` | 1 | Plain Language | 5 of 13 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/integrate-telerik-reporting-in-uwp-application.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/integrate-telerik-reporting-in-uwp-application.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/invalid-value-of-report-parameter-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/invalid-value-of-report-parameter-error.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/issues-on-connecting-telerik-reporting-standalone-report-designer-to-telerik-report-server.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/issues-on-connecting-telerik-reporting-standalone-report-designer-to-telerik-report-server.md` | 1 | Plain Language | 7 of 13 detected prose sentences exceed 30 words (54%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/issues-on-connecting-telerik-reporting-standalone-report-designer-to-telerik-report-server.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/issues-on-connecting-telerik-reporting-standalone-report-designer-to-telerik-report-server.md` | 32 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/issues-on-connecting-telerik-reporting-standalone-report-designer-to-telerik-report-server.md` | 39 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/item-template-failed-to-add-nuget-packages.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/item-template-failed-to-add-nuget-packages.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/javascript-runtime-error-object-doesnt-support-property-or-method-telerik-reportviewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/javascript-runtime-error-object-doesnt-support-property-or-method-telerik-reportviewer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/javascript-runtime-error-sys.webforms-pagerequestmanagerservererrorexception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/javascript-runtime-error-sys.webforms-pagerequestmanagerservererrorexception.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/json-length-is-too-large-net-core.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/json-length-is-too-large-net-core.md` | 1 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/json-length-is-too-large-net-core.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/jsonresult-serializersettings-must-be-an-instance-of-type-newtonsoftjson-jsonserializersettings.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/jsonresult-serializersettings-must-be-an-instance-of-type-newtonsoftjson-jsonserializersettings.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/jsonresult-serializersettings-must-be-an-instance-of-type-systemtextjson-jsonserializeroptions.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/jsonresult-serializersettings-must-be-an-instance-of-type-systemtextjson-jsonserializeroptions.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/kendo-jquery-license-warning-aspnetcore-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/kendo-jquery-license-warning-aspnetcore-reporting.md` | 1 | Plain Language | 6 of 15 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/kendo-jquery-license-warning-aspnetcore-reporting.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/key-events-not-raised-when-winforms-viewer-is-added-to-form.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/key-events-not-raised-when-winforms-viewer-is-added-to-form.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/keyword-not-supported-column-encryption-setting-error-is-thrown-in-web-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/keyword-not-supported-column-encryption-setting-error-is-thrown-in-web-report-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/latest-internal-builds.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/latest-internal-builds.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/license-key-managed-cpp-project.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/license-key-managed-cpp-project.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/limit-export-options-in-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/limit-export-options-in-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/localization-of-reports-based-on-report-parameter-and-resx-files.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/localization-of-reports-based-on-report-parameter-and-resx-files.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/localize-html5-viewer-mail-message-editor-toolbar.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/localize-html5-viewer-mail-message-editor-toolbar.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/localize-report-serverside-based-on-parameter.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/localize-report-serverside-based-on-parameter.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/mac-linux-warning-about-paper-kind.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/mac-linux-warning-about-paper-kind.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/managing-cache-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/managing-cache-telerik-reporting.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/manipulate-table-rows-based-on-their-position-in-the-physical-page.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/manipulate-table-rows-based-on-their-position-in-the-physical-page.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/map-add-choropleth-with-choropleth-wizard-to-reports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/map-add-choropleth-with-choropleth-wizard-to-reports.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/map-create-with-custom-polygons.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/map-create-with-custom-polygons.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/map-set-up-manually.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/map-set-up-manually.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/method-climessage-not-implemented-typeloadexception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/method-climessage-not-implemented-typeloadexception.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/microsoft-data-sqlite-datasource-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/microsoft-data-sqlite-datasource-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/migrate-an-existing-asp-net-core-project-from-full-dotnet-framework-4-6-to-dotnet-core-2-2.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/migrate-an-existing-asp-net-core-project-from-full-dotnet-framework-4-6-to-dotnet-core-2-2.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/migrate-kendo-less-to-sass-themes-html5-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/migrate-kendo-less-to-sass-themes-html5-viewer.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/migrate-to-the-html5-viewer-from-the-old-asp.net-webforms-reportviewer-control.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/migrate-to-the-html5-viewer-from-the-old-asp.net-webforms-reportviewer-control.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/missing-assembly-reference-when-using-jsondatasource.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/missing-assembly-reference-when-using-jsondatasource.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/missing-docx-xlsx-pptx-xps-export-options.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/missing-docx-xlsx-pptx-xps-export-options.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/missing-icon-of-the-datetime-parameter-editor-in-the-html5--webforms-reportviewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/missing-icon-of-the-datetime-parameter-editor-in-the-html5--webforms-reportviewer.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/missing-telerik-menu-in-visual-studio.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/missing-telerik-menu-in-visual-studio.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/missing-telerik-reporting-toolbox-wizards-in-visual-studio-2017.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/missing-telerik-reporting-toolbox-wizards-in-visual-studio-2017.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/modify-exported-report-document-before-serving-it-to-the-viewer-client.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/modify-exported-report-document-before-serving-it-to-the-viewer-client.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/modify-html5-viewer-area-width-through-kendo-splitter.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/modify-html5-viewer-area-width-through-kendo-splitter.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/modify-parameter-area-html5-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/modify-parameter-area-html5-viewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/modifying-or-creating-a-report-at-run-time.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/modifying-or-creating-a-report-at-run-time.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/move-hidden-designer-windows.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/move-hidden-designer-windows.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/move-to-next-page-with-scroll-in-html5-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/move-to-next-page-with-scroll-in-html5-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/mysql-connector-6-10-4-throws-nullreferenceexception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/mysql-connector-6-10-4-throws-nullreferenceexception.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/native-blazor-report-viewer-missing-css-source-map.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/native-blazor-report-viewer-missing-css-source-map.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/navigate-to-report-not-working-when-custom-report-resolver-changes-connectionstring-dynamically.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/navigate-to-report-not-working-when-custom-report-resolver-changes-connectionstring-dynamically.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/navigating-reports-custom-resolver.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/navigating-reports-custom-resolver.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/notimplementedexception-no-runtime-item-is-defined-for-report-item.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/notimplementedexception-no-runtime-item-is-defined-for-report-item.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/nuget-feed-error-returned-unexpected-401-status-code.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/nuget-feed-error-returned-unexpected-401-status-code.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/nullreferenceexception-licensing-watermark-winforms-reportviewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/nullreferenceexception-licensing-watermark-winforms-reportviewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/nullreferenceexception-object-reference-not-set-to-an-instance-of-an-object.-when-you-load-and-unload-the-wpf-reportviewer-control-from-visual-tree.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/nullreferenceexception-object-reference-not-set-to-an-instance-of-an-object.-when-you-load-and-unload-the-wpf-reportviewer-control-from-visual-tree.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/nullreferenceexception-wpf-viewer-search.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/nullreferenceexception-wpf-viewer-search.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/number-in-the-cell-is-formatted-as-text-or-preceded-by-an-apostrophe.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/number-in-the-cell-is-formatted-as-text-or-preceded-by-an-apostrophe.md` | 1 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/number-in-the-cell-is-formatted-as-text-or-preceded-by-an-apostrophe.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/object-must-implement-iconvertible.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/object-must-implement-iconvertible.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/object-type-conversion-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/object-type-conversion-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/objectdatasource-assembly-not-loaded-by-standalone-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/objectdatasource-assembly-not-loaded-by-standalone-report-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/obsolete-report-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/obsolete-report-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/old-webforms-viewer-cannot-display-list-items.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/old-webforms-viewer-cannot-display-list-items.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/old-webforms-viewer-does-not-display-reports-after-refresh.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/old-webforms-viewer-does-not-display-reports-after-refresh.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/old-webforms-viewer-malfunctins-clientidmode-static.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/old-webforms-viewer-malfunctins-clientidmode-static.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/old-webforms-viewer-messes-rendering-on-mobile.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/old-webforms-viewer-messes-rendering-on-mobile.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/old-webforms-viewer-messes-toolbar-content-area-styles.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/old-webforms-viewer-messes-toolbar-content-area-styles.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/only-invariant-culture-is-supported-in-globalization-invariant-mode-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/only-invariant-culture-is-supported-in-globalization-invariant-mode-error.md` | 1 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/only-invariant-culture-is-supported-in-globalization-invariant-mode-error.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/open-reports-that-use-newer-xml-schema.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/open-reports-that-use-newer-xml-schema.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/operation-could-destabilize-the-runtime-exception-occurs-when-running-on-windows-azure.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/operation-could-destabilize-the-runtime-exception-occurs-when-running-on-windows-azure.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/outofmemoryexception-on-exporting-or-printing-telerik-report-from-azure-webapps.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/outofmemoryexception-on-exporting-or-printing-telerik-report-from-azure-webapps.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/page-borders-not-displayed-in-continuous-scroll-in-native-blazor-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/page-borders-not-displayed-in-continuous-scroll-in-native-blazor-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/page-level-summary-for-table-groups.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/page-level-summary-for-table-groups.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/pagenumber-input-is-cutoff-html5.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/pagenumber-input-is-cutoff-html5.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/parameters-passed-incorrectly-in-webservicedatasource.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/parameters-passed-incorrectly-in-webservicedatasource.md` | 1 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/parameters-passed-incorrectly-in-webservicedatasource.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/pass-configuration-to-report-processor-in-asp-dot-net-core-without-rest-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/pass-configuration-to-report-processor-in-asp-dot-net-core-without-rest-service.md` | 1 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/pass-configuration-to-report-processor-in-asp-dot-net-core-without-rest-service.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/pass-culture-from-report-viewer-to-rest-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/pass-culture-from-report-viewer-to-rest-service.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/pass-parameters-to-html5-report-viewer-from-a-views-model.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/pass-parameters-to-html5-report-viewer-from-a-views-model.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/pass-sqldatasource-columns-as-datasource-for-nested-data-items.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/pass-sqldatasource-columns-as-datasource-for-nested-data-items.md` | 1 | Plain Language | 5 of 13 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/pass-sqldatasource-columns-as-datasource-for-nested-data-items.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/passing-multivalue-parameters-from-url-query-string-with-web-service-data-source.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/passing-multivalue-parameters-from-url-query-string-with-web-service-data-source.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/pdf-rendering-not-available-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/pdf-rendering-not-available-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/picturebox-encoded-url-bad-request-not-found.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/picturebox-encoded-url-bad-request-not-found.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/picturebox-parameter-is-not-valid-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/picturebox-parameter-is-not-valid-error.md` | 1 | Plain Language | 3 of 5 detected prose sentences exceed 30 words (60%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/picturebox-parameter-is-not-valid-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/post-method-to-pass-parameter-in-webservicedatasource.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/post-method-to-pass-parameter-in-webservicedatasource.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/postgres-stored-functions-in-sqldatasource-wizard.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/postgres-stored-functions-in-sqldatasource-wizard.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/preview-reports-using-rest-service-deployed-in-azure.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/preview-reports-using-rest-service-deployed-in-azure.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/print-a-report-directly-at-client-side-without-displaying-it-in-a-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/print-a-report-directly-at-client-side-without-displaying-it-in-a-viewer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/print-a-report-programmatically.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/print-a-report-programmatically.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/print-error-chrome.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/print-error-chrome.md` | 1 | Plain Language | 6 of 17 detected prose sentences exceed 30 words (35%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/print-error-chrome.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/print-issues-after-windows-update.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/print-issues-after-windows-update.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/print-labels.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/print-labels.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/print-report-correctly-from-winforms-viewer-without-declaring-entire-application-as-dpi-aware.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/print-report-correctly-from-winforms-viewer-without-declaring-entire-application-as-dpi-aware.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/problem-telerik-reporting-renders-blank-pages.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/problem-telerik-reporting-renders-blank-pages.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/problems-configuring-standalone-report-designer-to-use-sqlite.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/problems-configuring-standalone-report-designer-to-use-sqlite.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/programmatic-initialization-of-report-parameter-values-in-telerik-reporting-silverlight-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/programmatic-initialization-of-report-parameter-values-in-telerik-reporting-silverlight-viewer.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/programmatically-modify-report-physical-width-proportionally.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/programmatically-modify-report-physical-width-proportionally.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/providers-from-browsermodule-already-loaded-narv.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/providers-from-browsermodule-already-loaded-narv.md` | 1 | Plain Language | 3 of 3 detected prose sentences exceed 30 words (100%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/providers-from-browsermodule-already-loaded-narv.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/r1-2019-fails-to-load-assembly-documentformat-openxml-272.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/r1-2019-fails-to-load-assembly-documentformat-openxml-272.md` | 1 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/r1-2019-fails-to-load-assembly-documentformat-openxml-272.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/r3-2023-could-not-load-system-resources-netstandard.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/r3-2023-could-not-load-system-resources-netstandard.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/react-viewer-does-not-load-dispose-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/react-viewer-does-not-load-dispose-error.md` | 1 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/react-viewer-does-not-load-dispose-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/refresh-telerik-native-blazor-report-viewer-new-parameters.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/refresh-telerik-native-blazor-report-viewer-new-parameters.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/refused-to-display-url-in-a-frame-because-it-set-x-frame-options-to-sameorigin.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/refused-to-display-url-in-a-frame-because-it-set-x-frame-options-to-sameorigin.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/remove-last-pagebreak-for-report-group.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/remove-last-pagebreak-for-report-group.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/remove-opened-reports-web-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/remove-opened-reports-web-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/remove-unsupported-tags-from-htmltextbox.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/remove-unsupported-tags-from-htmltextbox.md` | 1 | Plain Language | 5 of 12 detected prose sentences exceed 30 words (42%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/remove-unsupported-tags-from-htmltextbox.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/removing-bar-border-in-graph.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/removing-bar-border-in-graph.md` | 17 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/removing-save-as-option-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/removing-save-as-option-report-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/rename-move-preview-button-html5-asp-net-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/rename-move-preview-button-html5-asp-net-report-viewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/rendering-large-reports-telerik-reporting-docker-pods.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/rendering-large-reports-telerik-reporting-docker-pods.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/rendering-layered-date-range-backgrounds-telerik-reporting-table-cells.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/rendering-layered-date-range-backgrounds-telerik-reporting-table-cells.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/rendering-markdown-in-telerik-reporting-templates.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/rendering-markdown-in-telerik-reporting-templates.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/repeat-report-group-names-on-each-page.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/repeat-report-group-names-on-each-page.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/repeat-report-group-names-on-each-page.md` | 37 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/repeat-report-group-names-on-each-page.md` | 53 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/replace-report-on-export-in-html5-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/replace-report-on-export-in-html5-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/report-blank-pages-word-docx.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/report-blank-pages-word-docx.md` | 1 | Plain Language | 3 of 7 detected prose sentences exceed 30 words (43%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/report-blank-pages-word-docx.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/report-blank-pages-word-docx.md` | 36 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/report-cannot-be-built-and-opened-in-vs-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/report-cannot-be-built-and-opened-in-vs-report-designer.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/report-cannot-be-opened-in-standalone-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/report-cannot-be-opened-in-standalone-report-designer.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/report-designer-is-not-available-after-upgrading-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/report-designer-is-not-available-after-upgrading-telerik-reporting.md` | 1 | Plain Language | 4 of 5 detected prose sentences exceed 30 words (80%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/report-designer-is-not-available-after-upgrading-telerik-reporting.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/report-is-unavailable-or-session-has-expired-error-message.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/report-is-unavailable-or-session-has-expired-error-message.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/report-page-header-appear-before-the-report-header.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/report-page-header-appear-before-the-report-header.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/report-server-credentials-provided-to-report-viewer-are-displayed-as-plain-text.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/report-server-credentials-provided-to-report-viewer-are-displayed-as-plain-text.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/report-viewer-blank-screen-version-19-1-25-521.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/report-viewer-blank-screen-version-19-1-25-521.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/reporting-and-telerik-ui-for-asp-net-core.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/reporting-and-telerik-ui-for-asp-net-core.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/reporting-rest-api-hosted-aspnetzero-projects-returns-incorrect-version-response.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/reporting-rest-api-hosted-aspnetzero-projects-returns-incorrect-version-response.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/reporting-rest-service-authorization.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/reporting-rest-service-authorization.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/reporting-rest-service-throws-unable-to-get-parameters-missing-report-name-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/reporting-rest-service-throws-unable-to-get-parameters-missing-report-name-error.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/reporting-rest-service-with-redisstorage-returns-error-500-to-requests.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/reporting-rest-service-with-redisstorage-returns-error-500-to-requests.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/reports-with-continuouspaper-or-custom-paperkind-cut-on-some-printers.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/reports-with-continuouspaper-or-custom-paperkind-cut-on-some-printers.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/reportviewer-is-undefined-javascript-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/reportviewer-is-undefined-javascript-error.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/reportviewer-styles-and-images-messed-up.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/reportviewer-styles-and-images-messed-up.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/resize-the-html5-report-viewer-to-accommodate-its-content.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resize-the-html5-report-viewer-to-accommodate-its-content.md` | 1 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/resize-the-html5-report-viewer-to-accommodate-its-content.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/resolve-license-warnings-vs-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resolve-license-warnings-vs-designer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/resolve-no-report-instance-error-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resolve-no-report-instance-error-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/resolve-no-report-instance-error-telerik-reporting.md` | 31 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/resolve-object-reference-error-telerik-reporting-fontextensions.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resolve-object-reference-error-telerik-reporting-fontextensions.md` | 16 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/resolve-system-windows-forms-assembly-error-telerik-reportviewer-wpf-net9.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resolve-system-windows-forms-assembly-error-telerik-reportviewer-wpf-net9.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/resolve-userreportbook-loading-exception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resolve-userreportbook-loading-exception.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/resolving-cannot-redefine-property-error-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resolving-cannot-redefine-property-error-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/resolving-fips-error-exporting-excel-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resolving-fips-error-exporting-excel-telerik-reporting.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/resolving-invalid-license-runtime-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resolving-invalid-license-runtime-telerik-reporting.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/resolving-microsoft-mshtml-assembly-error-telerik-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resolving-microsoft-mshtml-assembly-error-telerik-report-designer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/resolving-svg-rendering-issues-telerik-licensing-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/resolving-svg-rendering-issues-telerik-licensing-telerik-reporting.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/retrieve-last-day-of-month-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/retrieve-last-day-of-month-telerik-reporting.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/right-to-left-in-table.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/right-to-left-in-table.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/rotate-images-picturebox-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/rotate-images-picturebox-telerik-reporting.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/search-dialog-doesnt-appear-in-angular-report-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/search-dialog-doesnt-appear-in-angular-report-viewer.md` | 1 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/search-dialog-doesnt-appear-in-angular-report-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/search-dialog-doesnt-appear-in-angular-report-viewer.md` | 35 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/search-dialog-doesnt-appear-in-angular-report-viewer.md` | 58 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/section-with-height-property-set-to-zero-units-does-not-display-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/section-with-height-property-set-to-zero-units-does-not-display-data.md` | 1 | Plain Language | 3 of 5 detected prose sentences exceed 30 words (60%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/section-with-height-property-set-to-zero-units-does-not-display-data.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/security-vulnerability-wrd-r3-2020.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/security-vulnerability-wrd-r3-2020.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/seeking-is-not-supported-in-a-zipwrappingstream.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/seeking-is-not-supported-in-a-zipwrappingstream.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/select-page-of-tiff-image.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/select-page-of-tiff-image.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/send-email-inputs-validation-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/send-email-inputs-validation-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/send-telerik-report-embedded-email-body.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/send-telerik-report-embedded-email-body.md` | 1 | Plain Language | 4 of 8 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/send-telerik-report-in-an-e-mail.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/send-telerik-report-in-an-e-mail.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/service-worker-intercepts-report-viewer-requests.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/service-worker-intercepts-report-viewer-requests.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/set-culture-of-date-picker-in-angular-viewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/set-culture-of-date-picker-in-angular-viewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/set-culture-of-date-picker-in-angular-viewer.md` | 31 | Plain Language | 2 of 5 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/set-height-width-blazor-reportviewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/set-height-width-blazor-reportviewer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/set-height-width-blazor-reportviewer.md` | 35 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/set-height-width-blazor-reportviewer.md` | 47 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/set-report-parameter-date-range.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/set-report-parameter-date-range.md` | 1 | Plain Language | 6 of 12 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/set-report-parameter-date-range.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/set-report-source-and-parameters-through-model.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/set-report-source-and-parameters-through-model.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/set-the-file-path-of-json-or-csv-datasource-through-report-parameter.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/set-the-file-path-of-json-or-csv-datasource-through-report-parameter.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/setting-the-content-of-jsondatasource-through-report-parameter.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/setting-the-content-of-jsondatasource-through-report-parameter.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/setting-the-viewmode-of-the-web-report-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/setting-the-viewmode-of-the-web-report-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/should-i-use-system-data-oracleclient-net-data-provider.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/should-i-use-system-data-oracleclient-net-data-provider.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/shrink-textboxes-with-no-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/shrink-textboxes-with-no-data.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/shrink-textboxes-with-no-data.md` | 22 | Plain Language | 5 of 13 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/silverlight-viewer-not-visible-on-running-app.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/silverlight-viewer-not-visible-on-running-app.md` | 16 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/silverlight-viewer-report-messed-different-from-designtime-preview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/silverlight-viewer-report-messed-different-from-designtime-preview.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/silverlight-viewer-xaml-resources-error-after-upgrade.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/silverlight-viewer-xaml-resources-error-after-upgrade.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/silverlight-viewer-xaml-resources-error-on-building.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/silverlight-viewer-xaml-resources-error-on-building.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/skia-v4-conflict-solution-2026-q3.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/skia-v4-conflict-solution-2026-q3.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/sql-data-source-cannot-connect-on-azure.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/sql-data-source-cannot-connect-on-azure.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/sql-data-source-cannot-connect-on-azure.md` | 29 | Plain Language | 6 of 15 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/sql-data-source-with-schema-per-tenant-design.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/sql-data-source-with-schema-per-tenant-design.md` | 23 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/sqlite-net-throws-method-not-found-exception-in-net-core-apps.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/sqlite-net-throws-method-not-found-exception-in-net-core-apps.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/sqlitepclraw-vulnerable-dependency-sqlite-cve-2025-6965.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/sqlitepclraw-vulnerable-dependency-sqlite-cve-2025-6965.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/steps-on-how-to-add-objectdatadource-in-a-report-designed-in-the-standalone-designer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/steps-on-how-to-add-objectdatadource-in-a-report-designed-in-the-standalone-designer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/styling-tooltips-in-html5-based-report-viewers.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/styling-tooltips-in-html5-based-report-viewers.md` | 1 | Plain Language | 7 of 19 detected prose sentences exceed 30 words (37%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/styling-tooltips-in-html5-based-report-viewers.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/sum-disctinct-group-values.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/sum-disctinct-group-values.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/summary-per-page-when-group-is-on-multiple-pages.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/summary-per-page-when-group-is-on-multiple-pages.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/switch-hide-show-table-columns.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/switch-hide-show-table-columns.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/symbologies-restrict-chars-for-encoded-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/symbologies-restrict-chars-for-encoded-data.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/system-drawing-common-is-not-supported-on-non-windows-platforms.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/system-drawing-common-is-not-supported-on-non-windows-platforms.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/system-methodaccessexception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/system-methodaccessexception.md` | 1 | Plain Language | 3 of 6 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/system-methodaccessexception.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/system-null-reference-exception-docker.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/system-null-reference-exception-docker.md` | 1 | Plain Language | 3 of 5 detected prose sentences exceed 30 words (60%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/system-null-reference-exception-docker.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/systemcolors-are-not-valid-in-dot-net-core.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/systemcolors-are-not-valid-in-dot-net-core.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/table-detail-rows-with-same-height.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/table-detail-rows-with-same-height.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/table-list-crosstab-reports-not-displayed-ie.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/table-list-crosstab-reports-not-displayed-ie.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/telerik-report-server-font-face-usage.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/telerik-report-server-font-face-usage.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/telerik-reporting-deployment-cannot-load-telerik-data-access.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/telerik-reporting-deployment-cannot-load-telerik-data-access.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/telerik-reporting-missing-in-visual-studio.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/telerik-reporting-missing-in-visual-studio.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/telerik-reporting-r3-2016---upgrade-issues-with-objectdatasource-component.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/telerik-reporting-r3-2016---upgrade-issues-with-objectdatasource-component.md` | 1 | Plain Language | 4 of 9 detected prose sentences exceed 30 words (44%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/telerik-reporting-r3-2016---upgrade-issues-with-objectdatasource-component.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/telerik-reporting-toolbox-items-are-missing.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/telerik-reporting-toolbox-items-are-missing.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/telerik-reportviewer-typeerror-undefined-is-not-iterable.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/telerik-reportviewer-typeerror-undefined-is-not-iterable.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/telerikwindow-does-not-have-property-matching-name-centered.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/telerikwindow-does-not-have-property-matching-name-centered.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/test-web-report-designer-service.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/test-web-report-designer-service.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/test-web-report-designer-service.md` | 32 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/test-web-report-designer-service.md` | 37 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/text-cut-or-hidden-in-page-header.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/text-cut-or-hidden-in-page-header.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/text-truncation-spire-office-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/text-truncation-spire-office-reporting.md` | 1 | Plain Language | 3 of 7 detected prose sentences exceed 30 words (43%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/text-truncation-spire-office-reporting.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/textbox-diappers-when-it-is-in-the-page-header-or-page-footer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/textbox-diappers-when-it-is-in-the-page-header-or-page-footer.md` | 1 | Plain Language | 1 of 2 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/textbox-diappers-when-it-is-in-the-page-header-or-page-footer.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/the-content-of-the-html5-webforms-report-viewer-is-not-updated-on-page-reload.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/the-content-of-the-html5-webforms-report-viewer-is-not-updated-on-page-reload.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/the-path-is-not-of-a-legal-form-error-message-on-processing-a-telerik-report-net462-framework.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/the-path-is-not-of-a-legal-form-error-message-on-processing-a-telerik-report-net462-framework.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/the-remote-server-returned-an-error-401-unauthorized-when-using-a-pictureBox-from-url.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/the-remote-server-returned-an-error-401-unauthorized-when-using-a-pictureBox-from-url.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/the-styles-of-the-web-report-viewer-s-toolbar-are-messed-up.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/the-styles-of-the-web-report-viewer-s-toolbar-are-messed-up.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/the-type-initializer-for-lock-threw-an-exception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/the-type-initializer-for-lock-threw-an-exception.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/the-type-initializer-npgsql-globaltypemapper-threw-exception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/the-type-initializer-npgsql-globaltypemapper-threw-exception.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/the-wpf-silverlight-report-viewer-is-blank-after-upgrading-from-version-prior-to-q1-2014-to-q1-2014-or-later.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/the-wpf-silverlight-report-viewer-is-blank-after-upgrading-from-version-prior-to-q1-2014-to-q1-2014-or-later.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/this-document-already-has-a-documentelement-node-exception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/this-document-already-has-a-documentelement-node-exception.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/timeout-expired-the-timeout-period-elapsed-prior-to-completion-of-the-operation-or-the-server-is-not-responding.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/timeout-expired-the-timeout-period-elapsed-prior-to-completion-of-the-operation-or-the-server-is-not-responding.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshoot-ai-client-integration-net-framework.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshoot-ai-client-integration-net-framework.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshoot-telerik-reporting-installation-problems.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshoot-telerik-reporting-installation-problems.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshooting-design-time-multi-column-report-shows-as-one-column-report-when-used-as-subreport.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-design-time-multi-column-report-shows-as-one-column-report-when-used-as-subreport.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshooting-design-time-reportviewer-control-reportsource-property-from-the-property-grid-does-not-show-available-reports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-design-time-reportviewer-control-reportsource-property-from-the-property-grid-does-not-show-available-reports.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshooting-design-time-the-type-or-namespace-name-telerik-could-not-be-found-are-you-missing-a-using-directive-or-an-assembly-reference.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-design-time-the-type-or-namespace-name-telerik-could-not-be-found-are-you-missing-a-using-directive-or-an-assembly-reference.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshooting-mysqlcommand--to-sqlcommand-conversion-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-mysqlcommand--to-sqlcommand-conversion-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshooting-runtime-cannot-create-an-object-of-type-telerik-reporting-report-from-its-string-representation.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-runtime-cannot-create-an-object-of-type-telerik-reporting-report-from-its-string-representation.md` | 1 | Plain Language | 3 of 4 detected prose sentences exceed 30 words (75%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/troubleshooting-runtime-cannot-create-an-object-of-type-telerik-reporting-report-from-its-string-representation.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshooting-runtime-expression-contains-undefined-function-call-myuserfunction.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-runtime-expression-contains-undefined-function-call-myuserfunction.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshooting-runtime-my-asp-net-web-forms-reportviewer-looks-messed-up-its-styles-and-images-are-missing.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-runtime-my-asp-net-web-forms-reportviewer-looks-messed-up-its-styles-and-images-are-missing.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshooting-runtime-unable-to-serialize-the-session-state-in-stateserver-sqlserver-and-custom-mode.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-runtime-unable-to-serialize-the-session-state-in-stateserver-sqlserver-and-custom-mode.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshooting-runtime-when-deploying-a-project-with-telerik-reporting-on-a-server-you-get-error-could-not-load-file-or-assembly-telerik-reportviewer-webforms.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-runtime-when-deploying-a-project-with-telerik-reporting-on-a-server-you-get-error-could-not-load-file-or-assembly-telerik-reportviewer-webforms.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/troubleshooting-telerikreportviewer-execcommand-javascript-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/troubleshooting-telerikreportviewer-execcommand-javascript-error.md` | 1 | Plain Language | 5 of 14 detected prose sentences exceed 30 words (36%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/two-lists-show-details-in-parallel.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/two-lists-show-details-in-parallel.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/type-or-namespace-newtonsoftjsonoutputformatter-could-not-be-found.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/type-or-namespace-newtonsoftjsonoutputformatter-could-not-be-found.md` | 1 | Plain Language | 7 of 17 detected prose sentences exceed 30 words (41%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/type-or-namespace-newtonsoftjsonoutputformatter-could-not-be-found.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/typeerror-cannot-read-properties-undefined-reading-wrapper.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/typeerror-cannot-read-properties-undefined-reading-wrapper.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/typeerror-cannot-read-properties-underfined-reading-options.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/typeerror-cannot-read-properties-underfined-reading-options.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/typeloadexception-error-telerik-reporting-productclaims.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/typeloadexception-error-telerik-reporting-productclaims.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/unable-to-establish-a-connection-to-the-database-when-the-application-is-deployed.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/unable-to-establish-a-connection-to-the-database-when-the-application-is-deployed.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/unable-to-get-report-parameters-report-cannot-be-resolved.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/unable-to-get-report-parameters-report-cannot-be-resolved.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/unable-to-print-reports-from-azure-environment.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/unable-to-print-reports-from-azure-environment.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/unbale-to-upgrade-after-wizard.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/unbale-to-upgrade-after-wizard.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/uncaught-typeerror-getClientRects-is-not-a-function.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/uncaught-typeerror-getClientRects-is-not-a-function.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/unicode-characters-are-not-rendered-in-wpf.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/unicode-characters-are-not-rendered-in-wpf.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/unicode-characters-are-not-rendered-in-wpf.md` | 35 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |
| High | `knowledge-base/unicode-characters-are-not-rendered-in-wpf.md` | 41 | Code Block Accessibility | The fenced code block has no language identifier. | Add the appropriate language identifier after the opening fence, such as `csharp`, `json`, or `bash`. |

#### `knowledge-base/use-async-method-in-report-event-handler.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/use-async-method-in-report-event-handler.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/use-datetimepicker-native-blazor-reportviewer.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/use-datetimepicker-native-blazor-reportviewer.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/use-encrypted-connection-strings-telerik-reporting.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/use-encrypted-connection-strings-telerik-reporting.md` | 1 | Plain Language | 6 of 16 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/use-existing-report-library-in-net-core-app.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/use-existing-report-library-in-net-core-app.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/use-kendonumerictextbox-widget-to-create-custom-parameter-editor.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/use-kendonumerictextbox-widget-to-create-custom-parameter-editor.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/use-reporting-in-dotnetcore-with-entity-framework-core.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/use-reporting-in-dotnetcore-with-entity-framework-core.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |
| High | `knowledge-base/use-reporting-in-dotnetcore-with-entity-framework-core.md` | 38 | Plain Language | 6 of 15 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `knowledge-base/use-temporary-tables-in-stored-procedure.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/use-temporary-tables-in-stored-procedure.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/use-two-json-serializers-in-same-asp-net-core-project.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/use-two-json-serializers-in-same-asp-net-core-project.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/use-useridentity-context-to-pass-custom-objects-to-report.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/use-useridentity-context-to-pass-custom-objects-to-report.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/using-ms-access-database-in-the-report.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/using-ms-access-database-in-the-report.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/using-the-html5--viewer-in-mvc-applications-and-binding-data.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/using-the-html5--viewer-in-mvc-applications-and-binding-data.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/using-the-wpf-report-viewer-in-an-mvvm-scenario.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/using-the-wpf-report-viewer-in-an-mvvm-scenario.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/vb-projects-cannot-be-built-due-to-the-usage-of-the-global-namespace.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/vb-projects-cannot-be-built-due-to-the-usage-of-the-global-namespace.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/visual-studio-preview-is-not-working-when-using-objectdatasource.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/visual-studio-preview-is-not-working-when-using-objectdatasource.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/visual-studio-report-designer-is-blank.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/visual-studio-report-designer-is-blank.md` | 11 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/vs-report-designer-is-blank.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/vs-report-designer-is-blank.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/web-designer-in-webforms-page.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/web-designer-in-webforms-page.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/web-report-designer-cannot-preview-reports.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/web-report-designer-cannot-preview-reports.md` | 1 | Plain Language | 2 of 4 detected prose sentences exceed 30 words (50%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/web-report-designer-cannot-preview-reports.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/web-report-designer-menu-display-issue.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/web-report-designer-menu-display-issue.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/web-report-designer-shows-undefinedundefined-when-openning-report.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/web-report-designer-shows-undefinedundefined-when-openning-report.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/web-service-data-source-failing-to-connect-with-tls1.2.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/web-service-data-source-failing-to-connect-with-tls1.2.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/webforms-reports-do-not-display-changes-in-events.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/webforms-reports-do-not-display-changes-in-events.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/webforms-viewer-report-unavailable-session-expired.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/webforms-viewer-report-unavailable-session-expired.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/webrole-starts-cycling-after-deploying-to-windows-azure.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/webrole-starts-cycling-after-deploying-to-windows-azure.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/webservicedatasource-preview-displays-object-object-in-net-framework.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/webservicedatasource-preview-displays-object-object-in-net-framework.md` | 1 | Plain Language | 3 of 3 detected prose sentences exceed 30 words (100%). | Split long sentences into shorter statements and define specialized terms on first use. |
| High | `knowledge-base/webservicedatasource-preview-displays-object-object-in-net-framework.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/why-get-document-request-is-unauthorized.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/why-get-document-request-is-unauthorized.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/window-is-not-defined-nextjs.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/window-is-not-defined-nextjs.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/windows-forms-report-viewer-scaling-issues-on-higher-dpi.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/windows-forms-report-viewer-scaling-issues-on-higher-dpi.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/winforms-reportviewer-failed-attempt-error-connecting-server-reporting-rest.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/winforms-reportviewer-failed-attempt-error-connecting-server-reporting-rest.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/winforms-system-runtime-exception-outofmemory-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/winforms-system-runtime-exception-outofmemory-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/winforms-viewer-does-not-display-report.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/winforms-viewer-does-not-display-report.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/wpf-and-silverlight-reportviewer-controls-reload-their-content.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/wpf-and-silverlight-reportviewer-controls-reload-their-content.md` | 12 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/wpf-app-cannot-be-built.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/wpf-app-cannot-be-built.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/wpf-report-messed-different-from-preview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/wpf-report-messed-different-from-preview.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/wpf-report-viewer-cannot-add-via-item-template-2026-q2.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/wpf-report-viewer-cannot-add-via-item-template-2026-q2.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/wpf-report-viewer-exception-cannot-load-assembly-45.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/wpf-report-viewer-exception-cannot-load-assembly-45.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/wpf-viewer-cannot-resolve-dependency-to-assembly-error.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/wpf-viewer-cannot-resolve-dependency-to-assembly-error.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/wpf-viewer-method-access-exception.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/wpf-viewer-method-access-exception.md` | 15 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/wpf-viewer-not-visible-on-running-app.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/wpf-viewer-not-visible-on-running-app.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/wpf-viewer-themes-from-xaml.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/wpf-viewer-themes-from-xaml.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/xml-support.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/xml-support.md` | 13 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `knowledge-base/xmlserializer-cannot-resolve-type-with-empty-name.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `knowledge-base/xmlserializer-cannot-resolve-type-with-empty-name.md` | 14 | Table Accessibility | The data table has no identifiable header row or header cells. | Mark column labels as the header row in Markdown or use <th> cells in an HTML table. |

#### `report-items/barcode/1d-barcodes/1d-specifications.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `report-items/barcode/1d-barcodes/1d-specifications.md` | 32 | Plain Language | 10 of 26 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `report-items/barcode/2d-barcodes/pdf417.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `report-items/barcode/2d-barcodes/pdf417.md` | 40 | Heading Structure | The article contains multiple H1 headings. | Keep one H1 for the article title and use H2/H3 for sections. |

#### `report-items/gauge/overview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `report-items/gauge/overview.md` | 14 | Plain Language | 3 of 8 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `report-items/graph/overview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `report-items/graph/overview.md` | 14 | Plain Language | 4 of 10 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `report-items/htmltextbox/overview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `report-items/htmltextbox/overview.md` | 24 | Plain Language | 4 of 10 detected prose sentences exceed 30 words (40%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `report-items/map/overview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `report-items/map/overview.md` | 20 | Plain Language | 3 of 8 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `styling/rendering-and-paging/design-considerations-for-report-rendering/overview.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `styling/rendering-and-paging/design-considerations-for-report-rendering/overview.md` | 14 | Plain Language | 3 of 3 detected prose sentences exceed 30 words (100%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `upgrade/2024/2024-q1-18-0-24-305.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `upgrade/2024/2024-q1-18-0-24-305.md` | 38 | Plain Language | 8 of 22 detected prose sentences exceed 30 words (36%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `upgrade/2024/2024-q1.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `upgrade/2024/2024-q1.md` | 35 | Plain Language | 8 of 21 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `upgrade/2024/2024-q2-18-1-24-709.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `upgrade/2024/2024-q2-18-1-24-709.md` | 39 | Plain Language | 8 of 21 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `upgrade/2024/2024-q3.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `upgrade/2024/2024-q3.md` | 1 | Plain Language | 9 of 23 detected prose sentences exceed 30 words (39%). | Split long sentences into shorter statements and define specialized terms on first use. |

#### `wrd-user-guide/components/shared-data-source.md`

| Severity | Article | Line | Dimension | Issue | Recommended Fix |
|---|---|---:|---|---|---|
| High | `wrd-user-guide/components/shared-data-source.md` | 19 | Plain Language | 6 of 16 detected prose sentences exceed 30 words (38%). | Split long sentences into shorter statements and define specialized terms on first use. |

