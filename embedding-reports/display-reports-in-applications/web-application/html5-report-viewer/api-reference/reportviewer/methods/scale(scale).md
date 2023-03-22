---
title: scale(scale)
page_title: The scale(scale) method of the HTML5 Report Viewer explained
description: "Learn more about the scale(scale) method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/scale(scale)
tags: scale(scale)
published: True
position: 15
previous_url: /html5-report-viewer-reportviewer-methods-scale-sc
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# The `scale(scale)` method of the HTML5 Report Viewer

Sets the scale factor and scale mode. For more information please see jQuery.fn.telerik_ReportViewer’s scale and scaleMode options in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).

Parameters:

| Parameter | Description |
| ------ | ------ |
| __scale__ |object with properties:<ul><li>*scale* </li><li>*scaleMode* </li></ul>|

Returns: the current *ReportViewer* object. 

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.scale({
	scaleMode: “SPECIFIC”,
	scale: 0.75
});
````

