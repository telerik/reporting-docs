---
title: ViewMode)()
page_title: The ViewMode)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the ViewMode)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/viewmode)()
tags: viewmode)
published: True
reportingArea: MVCWrapper
position: 31
---

# The `ViewMode)()` method of the ASP.NET MVC Report Viewer

Specifies whether the viewer is in interactive or print preview mode. PrintPreview - Displays the paginated report as if it is printed on paper. Interactivity is not enabled. Interactive - Displays the report in its original width and height with no paging. Additionally interactivity is enabled. <remarks>PrintPreview displays paginated reports as they would appear when printed, while Interactive enables full report interactivity.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
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

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

