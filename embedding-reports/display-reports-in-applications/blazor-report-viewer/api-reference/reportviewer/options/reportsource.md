---
title: ReportSource
page_title: ReportSource property
description: "Gets or sets the Telerik.ReportViewer.Blazor.ReportSourceOptions for the report displayed in the viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/reportsource
published: True
reportingArea: BlazorWrapper
---

# The `ReportSource` option of the Blazor Report Viewer

Gets or sets the [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%}) for the report displayed in the viewer.

## Type

[`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%})

## Examples

````C#
<ReportViewer ReportSource="@(new ReportSourceOptions("Invoice.trdp", new Dictionary<string, object>
              {
                  {"OrderNumber", "SO43659"},
                  {"ForYear", 2024}
              }))" />
````

## See Also

* [ReportSourceOptions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%})


