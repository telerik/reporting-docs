---
title: Deferred
page_title: Deferred property
description: "Defers the JavaScript initialization statement for the report viewer. Allows manual control over when the viewer initialization script is executed for custom loading scenarios."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/deferred
published: True
reportingArea: MVCWrapper
---

# The `Deferred` option of the HTML5 ASP.NET MVC Report Viewer

Defers the JavaScript initialization statement for the report viewer. Allows manual control over when the viewer initialization script is executed for custom loading scenarios.

## Examples

````C#
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



