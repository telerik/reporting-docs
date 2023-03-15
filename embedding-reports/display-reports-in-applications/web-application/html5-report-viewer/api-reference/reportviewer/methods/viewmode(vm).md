---
title: viewMode(vm)
page_title: The viewMode(vm) method of the HTML5 Report Viewer explained
description: "Learn more about the viewMode(vm) method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/viewmode(vm)
tags: viewmode(vm)
published: True
position: 19
previous_url: /html5-report-viewer-reportviewer-methods-viewmode-vm
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# The `viewMode(vm)` method of the HTML5 Report Viewer

Sets the view mode and automatically reloads the current report (if any) into the new view.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __vm__ |string; the view mode. For more information please see jQuery.fn.telerik_ReportViewer’s viewMode option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options);|

Returns: the current *ReportViewer* object.

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.viewMode(telerikReportViewer.PrintModes.PRINT_PREVIEW);
````

