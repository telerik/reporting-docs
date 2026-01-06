---
title: InitialPageAreaImageUrl
page_title: InitialPageAreaImageUrl property
description: "Sets the background image URL for the PageArea when parameter values are missing or invalid. Provides visual feedback to users when the report cannot be displayed due to missing or invalid parameters."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/initialpageareaimageurl
published: True
reportingArea: MVCWrapper
---

# The `InitialPageAreaImageUrl` option of the HTML5 ASP.NET MVC Report Viewer

Sets the background image URL for the PageArea when parameter values are missing or invalid. Provides visual feedback to users when the report cannot be displayed due to missing or invalid parameters.

## Type

`System.String`

## Examples

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!-- Example: Setting the InitialPageAreaImageUrl for the Report Viewer -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Sets the background image URL for the PageArea when parameter values are missing or invalid.
    .InitialPageAreaImageUrl(Url.Content("~/Content/images/empty-parameters.png"))
)
````



