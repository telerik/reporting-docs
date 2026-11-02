---
name: style-brand-terms
description: "Use this skill to write or review Telerik Reporting brand names, trademarks, interaction verbs (click/tap/select/press), and technical vocabulary. Covers report definitions, report sources, report parameters, data sources, designers, viewers, REST services, processing, rendering, export, printing, deployment, caching, security, and licensing terminology. Distinguishes embedded Telerik Reporting from Telerik Report Server scheduling and management. Use when asked to 'fix brand names', 'check product references', 'review interaction verbs', or 'correct terminology' in Reporting documentation."
---

# Telerik Reporting Brand Names, Interaction Verbs, and Vocabulary

This skill defines how to write brand names, describe user interactions, and use standard vocabulary in Telerik Reporting documentation. Preserve the article's task and technical behavior while correcting terminology.

Use this skill for customer documentation and support-engineer guidance about report design, embedded reports, and report delivery. Include Telerik Report Server only when the scenario uses that separate product. This is a terminology review, not a substitute for API validation, deployment testing, or a security assessment.

## Brand Names and Trademarks

Apply these rules to prose examples and customer-facing instructions. Preserve exact API identifiers, package names, configuration keys, error messages, and UI labels.

### First Use in an Article

On the **first mention** in an article, use the full brand name with the trademark symbol:

```markdown
Progress® Telerik® Reporting lets you create, view, export, and print reports in applications.
```

### Subsequent Uses

After the first mention, use only the product name without the trademark symbol:

```markdown
Telerik Reporting renders reports to PDF, DOCX, and XLSX formats.
```

Or use the shorter, commonly recognized name if the full name is unwieldy:

```markdown
The Reporting engine processes report definitions and renders report documents.
```

### Trademark Rules

1. **Never pluralize a trademark** — Trademarks are proper nouns and cannot be made plural.
   - ❌ "Telerik Reportings"
   - ✅ "Telerik Reporting components"

2. **Never use a trademark as a verb** — Trademarks are nouns or adjectives.
   - ❌ "Telerik the report"
   - ✅ "Render the report with Telerik Reporting"

3. **Never form possessives with trademarks** — Do not add 's to brand names.
   - ❌ "Telerik Reporting's API"
   - ✅ "The Telerik Reporting API"

4. **Lowercase generic nouns after product names** — The product name is the proper noun; the generic category noun that follows is lowercase.
   - ❌ "`ReportProcessor` Class"
   - ✅ "`ReportProcessor` class"
   - ❌ "`UriReportSource` Object"
   - ✅ "`UriReportSource` object"

### Common Product Names

| Full Name (first use) | Subsequent uses |
|---|---|
| Progress® Telerik® Reporting | Telerik Reporting, the Reporting engine (when referring to the engine) |
| Progress® Telerik® Report Server | Telerik Report Server, Report Server |

Use NuGet as the package-manager name, not as a Progress product name. Write exact package identifiers, such as `Telerik.Reporting`, in monospace.

Use component names consistently: Standalone Report Designer, Visual Studio Report Designer, Web Report Designer, HTML5 Report Viewer, WPF Report Viewer, and Windows Forms Report Viewer. These components belong to Telerik Reporting, not to similarly named UI suites. Qualify other viewers, including Blazor or Angular integrations, by their documented component name and architecture.

## Interaction Verbs

Use the correct verb for how users interact with interface elements. The choice depends on the platform (desktop, mobile, or mixed).

### Desktop Interactions

| Action | Verb | Example |
|--------|------|---------|
| Activate a button or link | **click** | Click **Export**. |
| Activate with two rapid clicks | **double-click** | Double-click the report class in Visual Studio to open the designer. |
| Activate with the secondary button | **right-click** | Right-click the report item to open its context menu. |
| Activate a keyboard key | **press** | Press `Enter` to confirm. |
| Choose a menu item | **select** | Select **File** > **Save**. |
| Choose from a dropdown | **select** | Select the PDF export format from the viewer's export options. |
| Mark a checkbox | **select** | Select the checkbox beside an available parameter value. |
| Clear a checkbox | **clear** | Clear the checkbox beside an available parameter value. |
| Enter text in a field | **enter** or **type** | Enter a value in the report parameter editor. |
| Resize a report item | **drag** | Drag the sizing handle to resize the report item. |

### Important: "click" Not "click on"

Use **"click"** without "on". The preposition is redundant:

- ❌ Click on the **Save** button.
- ✅ Click the **Save** button.
- ✅ Click **Save**.

### Mobile Interactions

These verbs describe input methods, not guaranteed viewer capabilities. Use gesture instructions only when the target viewer and version support the action.

| Action | Verb | Example |
|--------|------|---------|
| Activate an element | **tap** | Tap **Export**. |
| Activate with two rapid taps | **double-tap** | Describe double-tap behavior only if the viewer documents it. |
| Move an element | **drag** | Describe drag behavior only for a supported designer or viewer control. |
| Swipe across the screen | **swipe** | Describe the supported scroll or navigation action, not report deletion. |
| Zoom in | **spread** | Use only if the target viewer supports this zoom gesture. |
| Zoom out | **pinch** | Use only if the target viewer supports this zoom gesture. |
| Touch and hold | **press and hold** | Use only for a documented touch-and-hold action. |

### Mixed (Desktop + Mobile) Content

When writing for both desktop and mobile, use **"select"** as the universal verb:

```markdown
Select **Export** to export the report.
```

"Select" works across input methods (mouse click, keyboard, touch tap).

## Vocabulary — Standard Terms

Use these standard terms consistently throughout the documentation. Read the [Reporting vocabulary reference](./references/vocabulary.md) for definitions, distinctions, and troubleshooting terminology.

### Reporting Architecture and Scope

Describe the report workflow accurately:

1. Author a report definition in a report designer or with the `Telerik.Reporting` definition API.
2. Select a report through a report source and supply report parameter values.
3. Let the engine retrieve data, evaluate expressions, and process the report.
4. Render the processed report through a rendering extension.
5. Display the rendered report in a viewer, export it, or print it through a supported path.

Distinguish `Telerik.Reporting` definition objects from `Telerik.Reporting.Processing` runtime objects. Do not describe runtime processing objects as editable report definitions.

For remote viewers, the client report source identifies a report and parameter values. The Reporting REST service resolves it to a server-side `ReportSource`. Do not substitute .NET report source objects for client-side configuration.

Use the following domain boundaries:

| Area | Required Distinction |
|---|---|
| Report definitions | `.trdp` is a packaged definition, `.trdx` is an XML definition, and `.trdj` is a JSON definition where supported. `.trbp` represents a declarative report book. .NET report classes derive from `Telerik.Reporting.Report`. Check format support for the target version and designer. |
| Report sources | `UriReportSource` identifies a definition by URI, `TypeReportSource` identifies a report type, `InstanceReportSource` wraps an instance, and `XmlReportSource` holds XML definition content. |
| Parameters and data | Report parameters supply report inputs. Data source parameters supply query or service inputs. Explain their explicit mapping rather than treating them as interchangeable. |
| Data sources | Use actual components such as `SqlDataSource`, `ObjectDataSource`, `CsvDataSource`, and `WebServiceDataSource`. Distinguish a component from the external database, object, file, or service it accesses. |
| Designers and viewers | Designers author definitions. Viewers display rendered reports and expose supported interaction, export, and print commands. A viewer is not a report editor. |
| Rendering and export | Use `ReportProcessor.RenderReport` for programmatic rendering. PDF, DOCX, XLSX, PPTX, CSV, and image output are rendering targets, not interchangeable report definition formats or general-purpose input formats. |
| Printing | Distinguish viewer print commands from server-side `ReportProcessor.PrintReport`. State printer access, platform, browser, and print-preview requirements for the chosen path. |
| REST services | Distinguish the Reporting REST service, Web Report Designer REST service, and Report Server APIs. Do not reuse endpoints or authentication instructions across them without verification. |
| Deployment | State the runtime, operating system, viewer, and engine host. Verify compatible assemblies, client assets, data providers, fonts, permissions, and rendering dependencies for desktop, web, container, or cloud deployment. |
| Caching | Distinguish engine cache from Reporting REST service storage for client sessions and rendered resources. For multiple service instances, verify shared storage and locking support. |
| Scheduling and management | Attribute built-in scheduling, email delivery, report storage, and role-based management to Report Server. Embedded Reporting needs application-owned scheduling and delivery infrastructure for equivalent workflows. |
| Security | Require trusted definitions, report-access authorization, validated report identifiers and paths, least-privilege data access, and protected secrets. A hidden parameter or viewer control is not an authorization boundary. |
| Licensing | Use the Reporting license guidance for the installed release. Treat Report Server licensing separately. Never request or publish license keys, feed credentials, or connection-string secrets. |

### Most Common Terms

| ❌ Avoid | ✅ Use | Notes |
|---|---|---|
| check box, Check Box | checkbox | One word, lowercase |
| data set | dataset | Use `DataSet` for the .NET API type |
| drop down, drop-down | dropdown | One word when used as a noun or adjective |
| dialog, dialogue | dialog box | Always "dialog box" (two words) when referring to a UI window |
| file name | filename | One word |
| name space | namespace | One word |
| tool bar | toolbar | One word |
| tool tip | tooltip | One word |
| work space | workspace | One word |
| plug in (noun) | plugin | One word as a noun; "plug in" as a verb (two words) |
| log in (noun) | login | One word as a noun; "log in" as a verb (two words) |
| set up (noun) | setup | One word as a noun; "set up" as a verb (two words) |
| back end (adj) | backend | One word as an adjective; varies by context as a noun |
| front end (adj) | frontend | One word as an adjective; varies by context as a noun |
| on-line | online | One word, no hyphen |
| off-line | offline | One word, no hyphen |
| e-mail | email | One word, no hyphen |
| web site | website | One word |
| web page | webpage | One word |

### Version and Comparison Terms

| ❌ Avoid | ✅ Use | Why |
|---|---|---|
| older version | earlier version | "Older" implies age, not sequence |
| newer version | later version | "Newer" implies recency, not sequence |
| lower version | earlier version | "Lower" implies rank, not sequence |
| higher version | later version | "Higher" implies rank, not sequence |
| since version 2.0 | starting with version 2.0 | "Since" is ambiguous (temporal or causal) |
| as of version 2.0 | starting with version 2.0 | Same ambiguity |

### Accessibility-Sensitive Terms

| ❌ Avoid | ✅ Use | Why |
|---|---|---|
| disabled (UI element) | unavailable | "Disabled" has accessibility connotations |
| grayed out | unavailable or dimmed | "Grayed out" is visual-only; inaccessible to screen readers |
| invalid (general prose) | not valid | Preserve exact API identifiers and diagnostic messages |

## Review Workflow and Expected Output

Follow this workflow for an article, support response, or sample prompt:

1. Identify the product, version, designer, viewer, report definition format, runtime, and deployment model from the available context.
2. Read the full article and the vocabulary reference. Check prose, metadata, examples, prompts, tables, captions, links, and checklists.
3. Correct brand names and interaction verbs. Keep the original task, section structure, and exact technical identifiers.
4. Check each domain claim against the matching repository article or official API documentation. Do not guess version support or invent a direct API equivalent.
5. Replace examples with realistic Reporting tasks. Remove unrelated document-editing or format-conversion steps instead of renaming them mechanically.
6. Verify that links resolve, local reference paths exist, and examples match the target component. Flag missing evidence rather than claiming an untested fix.
7. Apply the quick checklist and return the edited content with a concise summary of substantive changes and unresolved questions.

For a review-only request, report the location, original wording, correction, and reason. For an edit request, update the requested files directly. Do not create a separate summary file unless requested.

State what was verified and what still needs runtime validation. A terminology correction alone does not prove that code compiles, a report renders, or a deployment is secure.

### Sample Prompts and Expected Outcomes

Use these examples as realistic review tasks:

| Sample Prompt | Expected Outcome |
|---|---|
| "Correct terminology in an ASP.NET Core article that displays a TRDP report in the HTML5 Report Viewer." | Distinguish the client report source, REST service resolver, server-side `UriReportSource`, and rendered output. Verify the service configuration against the target version. |
| "Review instructions for a SalesYear report parameter mapped to a SQL query parameter." | Distinguish the report input from the `SqlDataSource` parameter. Preserve the exact parameter names and expression syntax. |
| "Review a PDF export example that calls ReportProcessor.RenderReport." | Verify the report source, rendering extension name, device information, and render-error handling. Do not describe the example as PDF editing. |
| "Correct a guide about scheduled monthly report emails from Report Server." | Attribute schedules, recipients, permissions, and delivery configuration to Report Server. Do not imply that embedded Reporting includes a scheduler. |
| "Review a cache troubleshooting response for viewers behind a load balancer." | Identify REST service storage, session expiration, and multi-instance support. Do not recommend an engine-cache setting as a substitute. |

### Troubleshooting Decision Guide

Route terminology and technical claims by the failing layer:

| Symptom | Check and Describe | Do Not Recommend |
|---|---|---|
| A report cannot be resolved | Report identifier, resolver, definition location, allowed paths, deployed assemblies, and service identity permissions. | Accept arbitrary client paths or turn off path validation as a routine fix. |
| Parameters fail or return unexpected data | Parameter names, types, null handling, multivalue settings, available values, expressions, and query-parameter mappings. | Treat a hidden parameter as a security control or concatenate user input into SQL. |
| A viewer fails but designer preview works | Viewer and service versions, service URL, HTTP responses, authentication, resource requests, CORS, and server-side logs. | Assume a designer preview proves the deployed service works. |
| Exports differ from interactive view | Target rendering extension, physical or logical pagination, page size, margins, item widths, fonts, and device information. | Promise pixel-identical output across all renderers or use internal interactive extensions as export targets. |
| Sessions expire or reports fail across instances | REST service storage, supported locking, load balancing, timeout settings, storage access, and cleanup behavior. | Set session timeouts to zero or delete active cache files or database rows as a routine fix. |
| Printing fails | Viewer print path or server-side print API, platform support, PDF handling, printer availability, and host identity. | Promise silent browser printing or access to a client printer from a server-side API. |
| Scheduled delivery fails | Report Server version, schedule status, report permissions, parameter values, mail configuration, and server logs. | Diagnose an embedded Reporting application as though it includes Report Server scheduling. |
| Watermarks or license warnings appear | Exact diagnostic, product version, license activation, and build or deployment environment. | Request license-key content or assume Reporting and Report Server share licensing requirements. |

Request only sanitized diagnostics and minimal report samples. Redact personal data, credentials, tokens, license keys, and sensitive report data before including them in examples.

## Quick Checklist

When reviewing an article for brand names and terminology, verify:

- [ ] First brand mention includes trademark symbol (Progress® Telerik®)
- [ ] Subsequent mentions use product name only, no trademark symbols
- [ ] No possessives with brand names (not "Telerik's")
- [ ] No pluralized trademarks
- [ ] Generic nouns after product names are lowercase ("`ReportProcessor` class")
- [ ] Desktop interactions: click (not "click on"), press, select, enter
- [ ] No "click on" — just "click"
- [ ] Mobile interactions: tap, swipe, spread, pinch
- [ ] Mixed content: "select" as universal verb
- [ ] Standard compound words: checkbox, dropdown, filename, namespace, tooltip
- [ ] Version comparisons: "earlier/later" not "older/newer/lower/higher"
- [ ] Accessibility: "unavailable" not "disabled/grayed out"
- [ ] Exact API identifiers, UI labels, configuration values, and quoted diagnostics remain unchanged
- [ ] Definitions, report sources, processed reports, and rendered documents are distinct
- [ ] Report parameters and data source parameters are distinct and mapped explicitly
- [ ] Designers, viewers, REST services, and Report Server have the correct responsibilities
- [ ] Export formats are rendering targets, not general-purpose document inputs
- [ ] Printing, cache, deployment, and version-specific claims match the target environment
- [ ] Scheduling and management features are attributed to Report Server or application-owned infrastructure
- [ ] Security guidance preserves access controls and excludes secrets
- [ ] Reporting and Report Server licensing references remain separate
- [ ] Examples and prompts are realistic, links resolve, and unverified behavior is explicitly flagged
- [ ] The edited document and concise change summary satisfy the requested output

## References

Use the repository documentation for the target release. These references support terminology checks, not blanket guarantees across versions:

* [Reporting vocabulary and distinctions](./references/vocabulary.md)
* [Report source types and parameter values](../../../../embedding-reports/report-sources.md)
* [Report definition references and viewer architecture](../../../../embedding-reports/report-definitions.md)
* [Available report designers](../../../../designing-reports/report-designer-tools/overview.md)
* [Report parameter concepts](../../../../designing-reports/connecting-to-data/report-parameters/overview.md)
* [Rendering extensions and device information](../../../../doc-output/export-formats.md)
* [Pagination and rendering behavior](../../../../styling/rendering-and-paging/understanding-rendering-behaviors.md)
* [Reporting REST service request workflow](../../../../embedding-reports/host-the-report-engine-remotely/overview.md)
* [REST service storage and multi-instance support](../../../../embedding-reports/host-the-report-engine-remotely/rest-service-storage/overview.md)
* [Engine cache responsibilities](../../../../embedding-reports/cache-management/overview.md)
* [Reporting security practices](../../../../security/security-best-practices.md)
* [Reporting license activation](../../../../licensing/setting-up-your-telerik-reporting-license-key.md)
* [Report Server management and scheduling](https://www.telerik.com/report-server/documentation/introduction)
