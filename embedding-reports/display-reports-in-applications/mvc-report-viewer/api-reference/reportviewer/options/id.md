---
title: Id
page_title: Id property
description: "Sets the unique identifier for the MVC Report Viewer HTML element that will be used by the initialization script to locate and initialize the viewer. This identifier is required for proper viewer initialization and must be unique within the page HTML structure."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/id
published: True
reportingArea: MVCWrapper
---

# The `Id` option of the HTML5 ASP.NET MVC Report Viewer

Sets the unique identifier for the MVC Report Viewer HTML element that will be used by the initialization script to locate and initialize the viewer. This identifier is required for proper viewer initialization and must be unique within the page HTML structure.

## Type

`System.String`

## Examples

````C#
@using Telerik.ReportViewer.Mvc

@* Example: Sets the unique id of the Report Viewer HTML element *@

@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
)
````



