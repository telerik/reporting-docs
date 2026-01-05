---
title: ParametersAreaPosition
page_title: ParametersAreaPosition property
description: "Specifies where the Parameters Area should be displayed. Right - Displays Parameters Area on the right of the page view. Left - Displays Parameters Area on the left of the page view. Top - Displays Parameters Area on the top of the page view. Bottom - Displays Parameters Area on the bottom of the page view. Controls the placement of the parameters panel for optimal user experience and interface layout."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/parametersareaposition
published: True
reportingArea: MVCWrapper
---

# The `ParametersAreaPosition` option of the HTML5 ASP.NET MVC Report Viewer

Specifies where the Parameters Area should be displayed.

- Right - Displays Parameters Area on the right of the page view.
- Left - Displays Parameters Area on the left of the page view.
- Top - Displays Parameters Area on the top of the page view.
- Bottom - Displays Parameters Area on the bottom of the page view.
- Controls the placement of the parameters panel for optimal user experience and interface layout.

## Type

[`Telerik.ReportViewer.Mvc.ParametersAreaPosition`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/parametersareaposition%})

## Examples

````C#
@using Telerik.ReportViewer.Mvc

<!-- Example showing how to set the Parameters Area position to the right of the page view -->
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ParametersAreaPosition(ParametersAreaPosition.Right)
)
````

## See Also

* [ParametersAreaPosition]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/parametersareaposition%})
