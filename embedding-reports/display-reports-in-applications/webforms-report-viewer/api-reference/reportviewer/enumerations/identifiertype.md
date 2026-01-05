---
title: Telerik.ReportViewer.Html5.WebForms.IdentifierType
page_title: Telerik.ReportViewer.Html5.WebForms.IdentifierType Enumeration
description: "Specifies the identifier type options used in the HTML5 WebForms ReportViewer ReportSource configuration. Used to determine how report identifiers are interpreted and resolved when loading reports in the HTML5 viewer. Controls the report resolution strategy based on the type of identifier provided, enabling support for different report source configurations in HTML5 viewing scenarios."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/enumerations/identifiertype
published: True
reportingArea: WebForms
---

# The `IdentifierType` enumeration of the HTML5 ASP.NET WebForms Report Viewer

Specifies the identifier type options used in the HTML5 WebForms ReportViewer ReportSource configuration. Used to determine how report identifiers are interpreted and resolved when loading reports in the HTML5 viewer. Controls the report resolution strategy based on the type of identifier provided, enabling support for different report source configurations in HTML5 viewing scenarios.

## Values

| Value | Description |
| ------ | ------ |
| CustomReportSource | Indicates that the identifier represents a custom report source requiring user-implemented resolution logic.<br>Used when the identifier follows a custom format that requires application-specific resolution logic to locate and load the report. |
| TypeReportSource | Indicates that the identifier represents a report type for creating TypeReportSource instances.<br>Used when the identifier is a fully qualified type name that references a report class for strongly-typed report loading. |
| UriReportSource | Indicates that the identifier represents a URI pointing to a .trdp/.trdx report file for creating UriReportSource instances.<br>Used when the identifier is a file path or URI that points to a report definition file stored on disk or accessible via URL. |

