---
title: ScaleMode
page_title: ScaleMode property
description: "Sets the scale mode of the viewer. Three modes exist currently: FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height. FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match. Specific - Uses the scale to zoom in and out the report. Determines how the report is sized within the viewer area to optimize readability and user experience."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/options/scalemode
published: True
reportingArea: MVCWrapper
---

# The `ScaleMode` option of the HTML5 ASP.NET MVC Report Viewer

Sets the scale mode of the viewer.

- Three modes exist currently:
- FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.
- FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.
- Specific - Uses the scale to zoom in and out the report.
- Determines how the report is sized within the viewer area to optimize readability and user experience.

## Type

[`Telerik.ReportViewer.Mvc.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/scalemode%})

## Examples

````C#
@using Telerik.ReportViewer.Mvc

@* Example: Set the scale mode of the viewer to FitPage *@
@(Html.TelerikReporting().ReportViewer()
    .Id("reportViewer1")
    .ServiceUrl(Url.Content("~/api/reports/"))
    .ScaleMode(ScaleMode.FitPage)
)
````

## See Also

* [HTML5 ASP.NET MVC Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/overview%})
* [ScaleMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/mvc-report-viewer/api-reference/reportviewer/enumerations/scalemode%})
