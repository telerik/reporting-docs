---
title: ParametersAreaVisible
page_title: ParametersAreaVisible property
description: "Sets the initial visibility state of the viewer's parameters area. Controls whether the parameters panel is visible when the viewer first loads, regardless of parameter presence."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/parametersareavisible
published: True
reportingArea: MVCWrapper
---

# The `ParametersAreaVisible` option of the HTML5 ASP.NET MVC Report Viewer

Sets the initial visibility state of the viewer's parameters area. Controls whether the parameters panel is visible when the viewer first loads, regardless of parameter presence.

## Type

`System.Boolean`

## Examples

````C#
@using Telerik.ReportViewer.Mvc

<!-- Example showing how to set the parameters area visibility in the HTML5 Report Viewer for MVC -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    // Makes the parameters area initially visible
    .ParametersAreaVisible(true)
)
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/overview%})
* [PersistSession]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/persistsession%})
* [PrintMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/printmode%})

