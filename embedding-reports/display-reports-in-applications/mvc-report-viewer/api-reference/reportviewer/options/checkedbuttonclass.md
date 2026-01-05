---
title: CheckedButtonClass
page_title: CheckedButtonClass property
description: "Sets the CSS class to be applied to buttons when they are in checked state. Allows customization of checked button appearance to match application styling requirements."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/checkedbuttonclass
published: True
reportingArea: MVCWrapper
---

# The `CheckedButtonClass` option of the HTML5 ASP.NET MVC Report Viewer

Sets the CSS class to be applied to buttons when they are in checked state. Allows customization of checked button appearance to match application styling requirements.

## Type

`System.String`

## Examples

````C#
@using Telerik.Reporting
@using Telerik.ReportViewer.Mvc

<!-- Example demonstrating the use of CheckedButtonClass(string) -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Sets the CSS class to be applied to buttons when they are in checked state.
    .CheckedButtonClass("my-custom-checked-btn")
)
````

