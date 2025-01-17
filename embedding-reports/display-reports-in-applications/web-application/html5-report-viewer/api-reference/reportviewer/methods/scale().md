---
title: scale()
page_title: The scale() method of the HTML5 Report Viewer explained
description: "Learn more about the scale() method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/scale()
tags: scale()
published: True
position: 14
previous_url: /html5-report-viewer-reportviewer-methods-scale
---

# The `scale()` method of the HTML5 Report Viewer

Gets the viewer’s scale factor and scale mode. For more information please see jQuery.fn.telerik_ReportViewer’s scale and scaleMode options in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).

Returns: object, with properties:

* *scale*
* *scaleMode*

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
var scale = reportViewer.scale();
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
