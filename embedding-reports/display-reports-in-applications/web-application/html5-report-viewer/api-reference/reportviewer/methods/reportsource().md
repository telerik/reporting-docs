---
title: reportSource()
page_title: The reportSource() method of the HTML5 Report Viewer explained
description: "Learn more about the reportSource() method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()
tags: reportsource()
published: True
reportingArea: HTML5
position: 12
previous_url: /html5-report-viewer-reportviewer-methods-reportsource
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# The `reportSource()` method of the HTML5 Report Viewer

Gets the current report source - report and parameters.
The viewer's report source is updated dynamically as the users navigate between reports and change parameter values.

Returns: an object with properties:

| Property | Description |
| ------ | ------ |
| __report__ |the report. For more information please see jQuery.fn.telerik_ReportViewer’s reportSource option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).|
| __parameters__ |an object with properties the names of which are the report parameters’ IDs, and values - the report parameters’ values.|

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
var rs = reportViewer.reportSource();
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
