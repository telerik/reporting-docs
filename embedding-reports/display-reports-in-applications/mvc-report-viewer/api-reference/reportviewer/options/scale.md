---
title: Scale
page_title: Scale property
description: "Sets the zoom scale factor for the report display when using Specific scale mode. Only effective when ScaleMode is set to Specific, allowing precise control over report magnification."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/scale
published: True
reportingArea: MVCWrapper
---

# The `Scale` option of the HTML5 ASP.NET MVC Report Viewer

Sets the zoom scale factor for the report display when using Specific scale mode. Only effective when ScaleMode is set to Specific, allowing precise control over report magnification.

## Type

`System.Double`

## Examples

````C#
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

