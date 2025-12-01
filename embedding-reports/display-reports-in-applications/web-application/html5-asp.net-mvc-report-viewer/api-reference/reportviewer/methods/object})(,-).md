---
title: Object})(, )
page_title: The Object})(, ) method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the Object})(, ) method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/object})(,-)
tags: object})
published: True
reportingArea: MVCWrapper
position: 22
---

# The `Object})(, )` method of the ASP.NET MVC Report Viewer

Sets the report source as a string identifier and provides parameter values for the report displayed in the viewer. <remarks>Combines report identification with parameter initialization for streamlined report setup with predefined values.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.ReportViewer.Mvc
@{
    ViewBag.Title = "Telerik HTML5 Report Viewer MVC Demo";
}

@(Html.TelerikReporting().ReportViewer()
    // Minimal setup with id and service URL
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Set the report source using the report identifier and parameters
    .ReportSource("SampleReport", new Dictionary<string, object> { { "Parameter1", "Value1" } })
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

