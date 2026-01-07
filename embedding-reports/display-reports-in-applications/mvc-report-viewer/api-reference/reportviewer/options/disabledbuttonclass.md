---
title: DisabledButtonClass
page_title: DisabledButtonClass property
description: "Sets the CSS class to be applied to buttons when they are in disabled state. Allows customization of disabled button appearance to match application styling requirements."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/disabledbuttonclass
published: True
reportingArea: MVCWrapper
---

# The `DisabledButtonClass` option of the HTML5 ASP.NET MVC Report Viewer

Sets the CSS class to be applied to buttons when they are in disabled state. Allows customization of disabled button appearance to match application styling requirements.

## Type

`System.String`

## Examples

````C#
@using Telerik.ReportViewer.Mvc

@* Example: Set a CSS class for disabled buttons in the report viewer *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .DisabledButtonClass("my-disabled-button-class")
)
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/overview%})
* [DocumentMapAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/documentmapareaposition%})
* [DocumentMapVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/documentmapvisible%})

