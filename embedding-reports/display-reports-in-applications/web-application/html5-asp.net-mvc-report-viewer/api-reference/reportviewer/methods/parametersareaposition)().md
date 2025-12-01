---
title: ParametersAreaPosition)()
page_title: The ParametersAreaPosition)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the ParametersAreaPosition)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/parametersareaposition)()
tags: parametersareaposition)
published: True
reportingArea: MVCWrapper
position: 16
---

# The `ParametersAreaPosition)()` method of the ASP.NET MVC Report Viewer

Specifies where the Parameters Area should be displayed. Right - Displays Parameters Area on the right of the page view. Left - Displays Parameters Area on the left of the page view. Top - Displays Parameters Area on the top of the page view. Bottom - Displays Parameters Area on the bottom of the page view. <remarks>Controls the placement of the parameters panel for optimal user experience and interface layout.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.ReportViewer.Mvc

<!-- Example showing how to set the Parameters Area position to the right of the page view -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ParametersAreaPosition(ParametersAreaPosition.Right)
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

