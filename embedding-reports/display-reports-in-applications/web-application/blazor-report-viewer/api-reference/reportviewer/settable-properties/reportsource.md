---
title: ReportSource
page_title: ReportSource property
description: "Gets or sets the <xref href=\"Telerik.ReportViewer.Blazor.ReportSourceOptions\" data-throw-if-not-resolved=\"false\"></xref> for the report displayed in the viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/settable-properties/reportsource
published: True
reportingArea: BlazorWrapper
---

# ReportSource

Gets or sets the <xref href="Telerik.ReportViewer.Blazor.ReportSourceOptions" data-throw-if-not-resolved="false"></xref> for the report displayed in the viewer.

## Type

`Telerik.ReportViewer.Blazor.ReportSourceOptions`

## Examples

````JavaScript
<ReportViewer ReportSource="@(new ReportSourceOptions("Invoice.trdp", new Dictionary<string, object>
              {
                  {"OrderNumber", "SO43659"},
                  {"ForYear", 2024}
              }))" />
````

## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})
