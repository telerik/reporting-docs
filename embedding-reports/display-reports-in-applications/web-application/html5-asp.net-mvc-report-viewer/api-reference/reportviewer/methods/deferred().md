---
title: Deferred()
page_title: The Deferred() method of the ASP.NET MVC Report Viewer explained
description: "Learn more about the Deferred() method of the ASP.NET MVC Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/methods/deferred()
tags: deferred
published: True
reportingArea: MVCWrapper
position: 5
---

# The `Deferred()` method of the ASP.NET MVC Report Viewer

Defers the JavaScript initialization statement for the report viewer. <remarks>Allows manual control over when the viewer initialization script is executed for custom loading scenarios.</remarks>

Returns: The current <xref href="Telerik.ReportViewer.Mvc.IReportViewerBuilder" data-throw-if-not-resolved="false"></xref> instance for method chaining.

````JavaScript
@using Telerik.ReportViewer.Mvc

@* Example demonstrating the use of Deferred() to defer the script initialization statement of the report viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .Deferred()
)

@section scripts
{
    @Html.TelerikReporting().DeferredScripts()
}
````


## See Also

* [ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})

