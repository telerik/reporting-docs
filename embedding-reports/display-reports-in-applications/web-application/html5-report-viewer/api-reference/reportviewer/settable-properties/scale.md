---
title: scale
page_title: scale property
description: "Gets or sets the scale and scale mode for the viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/scale
published: True
reportingArea: HTML5
---

# scale

Gets or sets the scale and scale mode for the viewer.

## Type

`Object`

## Examples

````JavaScript
// Get the current scale and scale modevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var scaleInfo = viewer.scale();
````

````JavaScript
// Set scale to 1.2 and scale mode to FIT_PAGE_WIDTHvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.scale({ scale: 1.2, scaleMode: telerikReportViewer.ScaleModes.FIT_PAGE_WIDTH });
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
