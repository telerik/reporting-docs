---
title: KeepClientAlive
page_title: KeepClientAlive property
description: "Sets whether the client session will be kept alive by sending periodic requests to prevent session timeout. Prevents client session expiration during extended report viewing sessions by maintaining server communication."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/keepclientalive
published: True
reportingArea: MVCWrapper
---

# The `KeepClientAlive` option of the HTML5 ASP.NET MVC Report Viewer

Sets whether the client session will be kept alive by sending periodic requests to prevent session timeout. Prevents client session expiration during extended report viewing sessions by maintaining server communication.

## Type

`System.Boolean`

## Examples

````C#
@using Telerik.ReportViewer.Mvc

@{
    // This example demonstrates how to use KeepClientAlive to enable client session keep-alive for the report viewer.
}

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .KeepClientAlive(true) // Enables sending periodic keep-alive requests
)
````



