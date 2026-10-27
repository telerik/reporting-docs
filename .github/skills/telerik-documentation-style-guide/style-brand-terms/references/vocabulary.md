# Telerik Reporting Vocabulary Reference

Standard vocabulary, compound words, and terminology conventions for Telerik Reporting documentation and support guidance. Use this reference with the [brand and terminology skill](../SKILL.md).

Preserve exact API names, configuration keys, UI labels, and quoted diagnostics even when they differ from prose conventions. Confirm feature and format availability for the target release, designer, runtime, and deployment.

## Table of Contents

- [Compound Words](#compound-words)
- [UI Element Names](#ui-element-names)
- [Technical Terms](#technical-terms)
- [Telerik Reporting Terms](#telerik-reporting-terms)
- [Reporting Architecture and Feature Boundaries](#reporting-architecture-and-feature-boundaries)
- [Action Verbs (Desktop)](#action-verbs-desktop)
- [Action Verbs (Mobile)](#action-verbs-mobile)
- [Version and Comparison Language](#version-and-comparison-language)
- [Accessibility-Sensitive Terms](#accessibility-sensitive-terms)
- [Commonly Confused Terms](#commonly-confused-terms)
- [Validation and Troubleshooting Terms](#validation-and-troubleshooting-terms)
- [References](#references)

## Compound Words

These terms have settled spellings in technical writing. Use the standard form consistently.

| Standard Form | ❌ Avoid These Variants |
|---|---|
| checkbox | check box, check-box, Check Box |
| dataset | data set, data-set (use `DataSet` for the .NET API type) |
| database | data base, data-base |
| dropdown | drop down, drop-down (as noun/adjective) |
| email | e-mail, E-mail |
| filename | file name, file-name |
| frontend | front end, front-end (as adjective) |
| backend | back end, back-end (as adjective) |
| login | log in, log-in (as noun/adjective) |
| namespace | name space, name-space |
| offline | off-line |
| online | on-line |
| plugin | plug in, plug-in (as noun) |
| popup | pop up, pop-up (as noun/adjective) |
| setup | set up, set-up (as noun/adjective) |
| stylesheet | style sheet, style-sheet |
| toolbar | tool bar, tool-bar |
| tooltip | tool tip, tool-tip |
| username | user name, user-name |
| webpage | web page, web-page |
| website | web site, web-site |
| workflow | work flow, work-flow |
| workspace | work space, work-space |

**Note on verb forms**: Some compound words split when used as verbs:
- "Log in to the application" (verb) vs. "Enter your login credentials" (noun)
- "Set up the environment" (verb) vs. "Complete the setup process" (noun)
- "Plug in the device" (verb) vs. "Install the plugin" (noun)
- "Pop up on the screen" (verb) vs. "Close the popup window" (noun)

## UI Element Names

Use these standard names when referring to user interface elements:

| Standard Term | ❌ Avoid |
|---|---|
| dialog box | dialog, dialogue, dialog window, popup dialog |
| dropdown | dropdown list, dropdown menu, drop-down list, combo box (unless technically accurate) |
| context menu | right-click menu, popup menu |
| pane | panel (unless the product UI labels it "panel") |
| tab | tabbed page, tab page |
| text box | text field, input field, edit box |
| checkbox | check box, tick box |
| radio button | option button, radio control |
| scrollbar | scroll bar, scroll-bar |
| menu bar | menubar, menu-bar |
| status bar | statusbar, status-bar |
| tooltip | tool tip, hover text, hint |
| progress bar | progress indicator, loading bar |
| breadcrumb | breadcrumb trail, navigation path |

## Technical Terms

Standard forms for common technical terms:

| Standard Term | ❌ Avoid | Notes |
|---|---|---|
| API | api, Api | Always uppercase |
| URL | url, Url | Always uppercase |
| XML | xml, Xml | Always uppercase |
| JSON | json, Json | Always uppercase |
| HTML | html, Html | Always uppercase |
| CSS | css, Css | Always uppercase |
| SQL | sql, Sql | Always uppercase |
| PDF | pdf, Pdf | Always uppercase |
| .NET | .net, .Net, dotnet | Capital NET with leading dot |
| NuGet | nuget, Nuget, NuGET | Specific casing |
| GitHub | Github, github, GITHUB | Specific casing |
| JavaScript | Javascript, javascript, JAVASCRIPT | Specific casing |
| TypeScript | Typescript, typescript | Specific casing |
| Boolean | Inconsistent prose capitalization | Use `bool` in C# or the exact API type, such as `System.Boolean` |
| null | Changed casing in copied code | Use `null` in C#, `Nothing` in Visual Basic, and the source language's syntax elsewhere |
| true/false | Changed casing in copied code | Use `true`/`false` in C# and JSON, and `True`/`False` in Visual Basic |

## Telerik Reporting Terms

Use these terms for report authoring and delivery. Do not treat report definitions as general-purpose editable office documents:

| Standard Term | Meaning and Usage |
|---|---|
| Telerik Reporting | The product for report authoring, processing, rendering, and integration in applications. Use Progress® Telerik® Reporting on first mention in customer-facing articles. |
| Telerik Report Server | A separate report management product based on the Reporting engine. Use Progress® Telerik® Report Server on first mention. |
| Report definition | The layout, data source configuration, parameters, expressions, and report items that describe a report. |
| TRDP report definition | A packaged report definition with resources, stored as `.trdp`. It is not a rendered PDF or a general-purpose document archive. |
| TRDX report definition | An XML report definition stored as `.trdx`. Preserve the actual schema and namespace. |
| TRDJ report definition | A JSON report definition stored as `.trdj` where the target release and designer support it. Do not assume all designers accept it. |
| TRBP report book | A declarative report book stored as `.trbp`. Distinguish it from a single report definition. |
| Type report definition | A .NET class derived from `Telerik.Reporting.Report`, commonly authored with the Visual Studio Report Designer. |
| Report book | A collection of reports combined for output, represented by `Telerik.Reporting.ReportBook` in the definition API. |
| Report item | A definition element such as `Telerik.Reporting.TextBox`, `Table`, `Crosstab`, `Graph`, `PictureBox`, or `SubReport`. |
| Report section | A structural part such as a detail section, report header, report footer, page header, or page footer. |
| Report source | A reference to a report definition plus parameter values, not the data source used by the report. |
| `UriReportSource` | A server-side report source whose `Uri` identifies a definition, such as a deployed `.trdp` file. |
| `TypeReportSource` | A server-side report source whose `TypeName` identifies the assembly-qualified report type. |
| `InstanceReportSource` | A server-side report source whose `ReportDocument` contains an instantiated report or report book. |
| `XmlReportSource` | A server-side report source whose `Xml` contains XML report definition content. It is not a wrapper for arbitrary XML business data. |
| Client report source | A viewer-side report identifier and parameter values that a remote service resolves to a server-side report source. |
| Report parameter | A typed report input, represented by `ReportParameter` in a definition. Distinguish its name, value, available values, and visibility. |
| Data source component | A component that retrieves data for the report or a data item, not the report source. |
| `SqlDataSource` | Retrieves data through a supported data provider and query or stored procedure. Map report parameters to query parameters explicitly. |
| `ObjectDataSource` | Exposes data from .NET objects or methods. Verify deployed assemblies and the available members. |
| `CsvDataSource` | Retrieves tabular data from CSV content. CSV data input and CSV report export are different operations. |
| `WebServiceDataSource` | Retrieves data from a web service. Verify URLs, authentication, and allowed destinations. |
| Expression | A report expression, such as `=Fields.Total` or `=Parameters.SalesYear.Value`, evaluated in its report context. |
| Data scope | The data context for fields, groups, aggregates, and expressions. Do not imply all items share the same scope. |
| Standalone Report Designer | A desktop report authoring application. State the edition and supported definition formats for the target version. |
| Visual Studio Report Designer | The report authoring environment in Visual Studio for .NET type report definitions. |
| Web Report Designer | A web-based report authoring component with its own designer REST service and storage requirements. |
| Report viewer | An application component that displays rendered reports and offers supported parameters, navigation, export, and print interactions. |
| Reporting engine | The component that processes report definitions and renders report documents. It is not the viewer UI. |
| Report processing | Data retrieval, expression evaluation, grouping, filtering, and other runtime steps that prepare a report for rendering. |
| Rendering extension | An engine component that produces a target output format. Use the documented extension name in configuration or API calls. |
| Rendered report document | The generated output for a particular report, parameter values, and rendering format. Do not confuse it with the definition. |
| Device information settings | Renderer-specific options supplied through configuration or a rendering call. They are not report parameters. |
| Interactive view | A viewer mode optimized for interaction and logical layout. It does not guarantee the same pagination as PDF output. |
| Print preview | A viewer mode that reflects physical pagination. Verify the chosen renderer's behavior. |

## Reporting Architecture and Feature Boundaries

Use these distinctions when adapting workflows and examples:

| Area | Reporting-Specific Guidance |
|---|---|
| Definition API and processing API | `Telerik.Reporting.Report` is a definition object. `Telerik.Reporting.Processing.Report` is a runtime object. Preserve the correct namespace and lifecycle. |
| Embedded engine | A host application can use `Telerik.Reporting.Processing.ReportProcessor` directly. Some desktop viewers can use an embedded engine or remote report sources. State which architecture applies. |
| Remote engine | The viewer sends requests to a Reporting REST service or a supported Report Server integration. The browser does not execute the .NET Reporting engine. |
| Report resolution | A service resolver maps a client report identifier to a server-side report source. Do not assume client identifiers are unrestricted filesystem paths. |
| REST service responsibilities | The Reporting REST service exposes report generation and resources. The Web Report Designer REST service exposes authoring operations. Report Server APIs manage that product's resources. |
| Programmatic export | `ReportProcessor.RenderReport` renders a report source to a supported format. Check the render result and errors before treating output as successful. |
| Export formats | Examples include PDF, DOCX, XLSX, PPTX, CSV, and image formats. Verify available rendering extensions and dependencies in the actual host. |
| Import and conversion | Author or deserialize report definitions. Do not claim that arbitrary PDF, DOCX, or XLSX input becomes an editable report definition. |
| Packaging and serialization | Packaging stores a report definition and resources. Serialization stores definition markup. Neither operation generates a rendered report. |
| Pagination | Physical-page renderers apply page size, margins, and page breaks differently from logical-page renderers. Do not promise identical layout across formats. |
| Printing | Distinguish viewer printing from server-side `ReportProcessor.PrintReport`. Browser printing does not grant silent-print permissions or server access to client printers. |
| REST service storage | `IStorage` implementations store client sessions, interaction state, and rendered resources. State timeout, cleanup, access, and multi-instance requirements. |
| Engine cache | The engine can cache pages and large resources during processing and rendering. Engine-cache settings are not a substitute for REST service storage configuration. |
| Scale-out deployment | Verify shared storage and distributed locking support, compatible service instances, and load-balancer configuration. A local file cache alone is not shared multi-host storage. |
| Host environment | Check runtime and operating-system support, fonts, data providers, renderer dependencies, file access, and service identity. Do not assume Windows and Linux behavior is identical. |
| Report Server scheduling | Built-in schedules and email delivery belong to Report Server. An embedded Reporting application must supply its own scheduler and delivery code. |
| Report Server management | Attribute centralized report storage, permissions, roles, and delivery management to Report Server, not to a standalone viewer or REST service. |
| Security boundaries | Authorize report access on the server. Validate report identifiers, paths, parameter values, and external resource destinations. Treat report definitions as trusted executable configuration, not harmless uploads. |
| Data security | Use least-privilege data access, parameterized queries, and protected connection settings. Hidden report parameters and hidden viewer controls do not enforce authorization. |
| Licensing | Follow the installed Reporting release's activation guidance. Reporting versions starting with 2025 Q1 require license-key activation. Check Report Server licensing separately. |

Keep credentials, license keys, access tokens, and sensitive report data out of sample definitions, code, logs, prompts, and expected outputs.

## Action Verbs (Desktop)

Use the exact label from the target designer or viewer. These examples illustrate terminology, not a universal UI layout:

| User Action | Verb | Example |
|-------------|------|---------|
| Activate a button | click | Click **Export**. |
| Activate with two clicks | double-click | Double-click the report class in Visual Studio. |
| Activate with secondary button | right-click | Right-click the report item. |
| Press a keyboard key | press | Press `Ctrl`+`S`. |
| Choose from menu | select | Select **File** > **Open**. |
| Choose from dropdown | select | Select the PDF export format. |
| Mark a checkbox | select | Select the checkbox beside an available parameter value. |
| Unmark a checkbox | clear | Clear the checkbox beside an available parameter value. |
| Enter text | enter, type | Enter the report parameter value. |
| Move by dragging | drag | Drag the handle to resize the report item. |
| Hover over an element | point to | Point to the icon to see the tooltip. |
| Expand a tree node | expand | Expand the report group node. |
| Collapse a tree node | collapse | Collapse the report group node. |

## Action Verbs (Mobile)

Confirm gesture support in the target viewer and version before writing instructions. For mixed desktop and mobile content, use "select" for activation:

| User Action | Verb | Example |
|-------------|------|---------|
| Activate an element | tap | Tap **Export**. |
| Activate with two taps | double-tap | Use only for documented double-tap behavior. |
| Move an element | drag | Use only for a supported designer or viewer action. |
| Swipe | swipe | Describe the supported scroll or navigation action. |
| Zoom in | spread | Use only if the viewer supports this gesture. |
| Zoom out | pinch | Use only if the viewer supports this gesture. |
| Long press | press and hold | Use only for documented touch-and-hold behavior. |

## Version and Comparison Language

| ❌ Avoid | ✅ Use | Reason |
|---|---|---|
| older version | earlier version | Versions have sequence, not age |
| newer version | later version | Versions have sequence, not recency |
| lower version | earlier version | Versions have sequence, not rank |
| higher version | later version | Versions have sequence, not rank |
| since version X | starting with version X | "Since" can mean "because" |
| as of version X | starting with version X | Ambiguous |
| deprecated since | deprecated starting with, deprecated in | Clearer |

## Accessibility-Sensitive Terms

| ❌ Avoid | ✅ Use | Reason |
|---|---|---|
| disabled (UI) | unavailable | "Disabled" has accessibility connotations |
| grayed out | unavailable, dimmed | Visual-only description |
| invalid input (general prose) | not valid, incorrect | Preserve exact diagnostic messages and API names |
| normal mode | default mode, standard mode | "Normal" implies other modes are abnormal |
| whitelist | allowlist | Inclusive language |
| blacklist | blocklist, denylist | Inclusive language |
| master/slave | primary/secondary, main/replica | Inclusive language |
| sanity check | smoke test, validation check | Inclusive language |
| dummy | placeholder, sample | Inclusive language |

## Commonly Confused Terms

| Term A | Term B | Difference |
|--------|--------|------------|
| log in (verb) | login (noun/adj) | "Log in to the app" vs. "the login page" |
| set up (verb) | setup (noun/adj) | "Set up the environment" vs. "the setup wizard" |
| back up (verb) | backup (noun/adj) | "Back up the data" vs. "the backup file" |
| roll back (verb) | rollback (noun/adj) | "Roll back the changes" vs. "the rollback procedure" |
| that | which | "that" for restrictive clauses, "which" for non-restrictive (with comma) |
| fewer | less | "Fewer" for countable nouns, "less" for uncountable |
| affect | effect | "Affect" = verb (to influence), "Effect" = noun (the result) |
| ensure | insure | "Ensure" = make certain, "Insure" = insurance |
| its | it's | "Its" = possessive, "It's" = it is (but don't use contractions with "it's") |
| Report source | Data source | The report source identifies the definition and report parameter values. The data source retrieves the report's data. |
| Report parameter | Data source parameter | A report parameter supplies report input. A data source parameter supplies an input to a query, method, or service. |
| Report definition | Rendered report document | The definition describes the report. The rendered document is the output for particular data, parameters, and format. |
| Report item | Viewer control | A report item belongs to the definition. A viewer control belongs to the host application's UI. |
| Rendering extension | File extension | A rendering extension produces output. A file extension is a filename suffix, such as `.pdf`. |
| Report processing | Report scheduling | Processing executes a report. Scheduling decides when to execute and deliver it. |
| Telerik Reporting | Telerik Report Server | Reporting embeds report capabilities in applications. Report Server adds centralized report management and delivery. |

## Validation and Troubleshooting Terms

Describe the failing layer and the evidence instead of using a general phrase such as "the report is broken":

| Term or Symptom | Evidence to Request or Verify |
|---|---|
| Definition or resolver failure | Sanitized report identifier, definition format, resolver behavior, allowed paths, deployed report types, and file permissions. |
| Data retrieval or expression failure | Exact sanitized error, data source component, provider, query-parameter mappings, report parameter types, and expression scope. |
| Viewer or REST failure | Viewer and service versions, runtime, service URL, HTTP status, failed resource request, server logs, authentication, and CORS configuration. |
| Pagination or export difference | Target renderer, page settings, item dimensions, fonts, device information, and a minimal sanitized report definition. |
| Cache or session failure | REST storage implementation or engine-cache provider, service topology, timeout settings, host identity, and storage permissions. |
| Print failure | Viewer print flow or server-side API, operating system, browser or PDF handling, printer availability, and process identity. |
| Scheduled delivery failure | Report Server version, schedule configuration, report permissions, parameter values, mail setup, and sanitized server logs. |
| License warning or watermark | Exact diagnostic, product version, activation method, and build or deployment environment. Never request the license key itself. |

Use "verified" only for checks actually performed. State when code execution, rendering, printing, scheduled delivery, or deployment remains untested.

## References

Use the [skill's source references](../SKILL.md#references) for repository guidance on report sources, designers, parameters, rendering, REST services, caching, security, and licensing. Check these sources against the customer's version before making compatibility claims.

For centralized report management and scheduled delivery, consult the [Report Server documentation](https://www.telerik.com/report-server/documentation/introduction). Do not apply its features or configuration to embedded Reporting without an explicit integration.
