---
title: reportSource(rs)
page_title: reportSource(rs) 
description: reportSource(rs)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)
tags: reportsource(rs)
published: True
position: 13
---
<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# reportSource(rs)

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

