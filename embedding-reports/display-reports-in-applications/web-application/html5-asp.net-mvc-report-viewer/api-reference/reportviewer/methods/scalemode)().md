---
title: ScaleMode)()
page_title: The ScaleMode)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the ScaleMode)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/scalemode)()
tags: scalemode)
published: True
reportingArea: MVCWrapper
position: 26
---

# The `ScaleMode)()` method of the ASP.NET MVC Report Viewer

Sets the scale mode of the viewer. Three modes exist currently: FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height. FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match. Specific - Uses the scale to zoom in and out the report. <remarks>Determines how the report is sized within the viewer area to optimize readability and user experience.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.ReportViewer.Mvc

@* Example: Set the scale mode of the viewer to FitPage *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ScaleMode(ScaleMode.FitPage)
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

