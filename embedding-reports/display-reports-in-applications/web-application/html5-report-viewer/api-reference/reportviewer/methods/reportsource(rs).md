---
title: reportSource(rs)
page_title: The reportSource(rs) method of the HTML5 Report Viewer explained
description: "Learn more about the reportSource(rs) method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)
tags: reportsource(rs)
published: True
reportingArea: HTML5
position: 13
previous_url: /html5-report-viewer-reportviewer-methods-reportsource-rs, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# The `reportSource(rs)` method of the HTML5 Report Viewer

Sets the report source.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __rs__ |an object with properties:<ul><li>*report* - the report. For more information please see jQuery.fn.telerik_ReportViewer’s reportSource option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).;</li><li>*parameters* - an object with properties that names are the report parameters’ ids and values - the report parameters’ values;</li></ul>|

Returns: the current *ReportViewer* object. 

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.reportSource({
	report: "product catalog.trdx",
	parameters: { "CultureID": "fr" },
});
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
