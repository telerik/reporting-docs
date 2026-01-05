---
title: ViewMode
page_title: ViewMode property
description: "Specifies whether the viewer is in interactive or print preview mode. PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is not enabled. Interactive - Displays the report in its original width and height with no paging. Additionally interactivity is enabled. PrintPreview displays paginated reports as they would appear when printed, while Interactive enables full report interactivity."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/viewmode
published: True
reportingArea: MVCWrapper
---

# The `ViewMode` option of the HTML5 ASP.NET MVC Report Viewer

Specifies whether the viewer is in interactive or print preview mode.

- PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is not enabled.
- Interactive - Displays the report in its original width and height with no paging. Additionally interactivity is enabled.
- PrintPreview displays paginated reports as they would appear when printed, while Interactive enables full report interactivity.

## Type

[`Telerik.ReportViewer.Mvc.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/viewmode%})

## Examples

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!--
This example demonstrates how to set the ViewMode of the Telerik Report Viewer to Interactive using the ViewMode method.
-->

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ViewMode(ViewMode.Interactive)
)
````

## See Also

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})
* [ViewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/viewmode%})
