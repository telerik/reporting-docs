---
title: scale
page_title: The scale method of the HTML5 Report Viewer explained
description: "Learn more about the scale method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/scale
tags: scale
published: True
reportingArea: HTML5
position: 7
---

# The `scale` method of the HTML5 Report Viewer

Gets or sets the scale and scale mode for the viewer.

## Example

````JavaScript
// Get the current scale and scale modevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var scaleInfo = viewer.scale();
````

````JavaScript
// Set scale to 1.2 and scale mode to FIT_PAGE_WIDTHvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.scale({ scale: 1.2, scaleMode: telerikReportViewer.ScaleModes.FIT_PAGE_WIDTH });
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})

