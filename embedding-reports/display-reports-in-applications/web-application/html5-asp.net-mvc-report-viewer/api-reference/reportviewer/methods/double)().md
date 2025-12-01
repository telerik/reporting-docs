---
title: Double)()
page_title: The Double)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the Double)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/double)()
tags: double)
published: True
reportingArea: MVCWrapper
position: 25
---

# The `Double)()` method of the ASP.NET MVC Report Viewer

Sets the zoom scale factor for the report display when using Specific scale mode. <remarks>Only effective when ScaleMode is set to Specific, allowing precise control over report magnification.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.ReportViewer.Mvc

<!--
Example demonstrating how to set the zoom scale factor for the report display using .Scale(double).
-->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .Scale(1.0) // Sets the zoom scale to 100%
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

