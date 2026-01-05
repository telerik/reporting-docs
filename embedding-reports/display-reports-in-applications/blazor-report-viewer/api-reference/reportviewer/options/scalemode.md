---
title: ScaleMode
page_title: ScaleMode property
description: "Gets or sets the scale mode of the viewer. Three modes exist currently: FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height. FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match. Specific - Uses the scale to zoom the report in and out."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/scalemode
published: True
reportingArea: BlazorWrapper
---

# The `ScaleMode` option of the Blazor Report Viewer

Gets or sets the scale mode of the viewer.

- Three modes exist currently:
- FitPage - The whole report will fit on the page (will zoom in or out), regardless of its width and height.
- FitPageWidth - The report will be zoomed in or out so that the width of the screen and the width of the report match.
- Specific - Uses the scale to zoom the report in and out.

## Type

[`Telerik.ReportViewer.Blazor.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/scalemode%})

## Examples

````C#
<ReportViewer ScaleMode="ScaleMode.FitPageWidth" />
````

## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})
* [ScaleMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/scalemode%})
