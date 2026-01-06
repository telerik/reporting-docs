---
title: PersistSession
page_title: PersistSession property
description: "Sets whether the viewer's client session should be persisted between page refreshes using browser sessionStorage. Session persistence maintains viewer state during postbacks and page refreshes for improved user experience."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/persistsession
published: True
reportingArea: MVCWrapper
---

# The `PersistSession` option of the HTML5 ASP.NET MVC Report Viewer

Sets whether the viewer's client session should be persisted between page refreshes using browser sessionStorage. Session persistence maintains viewer state during postbacks and page refreshes for improved user experience.

## Type

`System.Boolean`

## Examples

````C#
@using Telerik.ReportViewer.Mvc

<!-- Example: Set PersistSession to true to persist session between page refreshes -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .PersistSession(true)
)
````



