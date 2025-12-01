---
title: String)()
page_title: The String)() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the String)() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/string)()
tags: string)
published: True
reportingArea: MVCWrapper
position: 30
---

# The `String)()` method of the ASP.NET MVC Report Viewer

Sets the URL for the custom report viewer template that defines the viewer's UI structure and appearance. <remarks>Allows customization of the viewer interface by providing a custom template with modified functionality or styling.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

@* Example demonstrating setting a custom template URL for the HTML5 Report Viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl("/api/reports/")
    .TemplateUrl("/ReportViewer/templates/customTemplate.html")
)
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

