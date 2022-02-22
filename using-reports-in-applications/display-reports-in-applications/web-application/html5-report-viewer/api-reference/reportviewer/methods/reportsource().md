---
title: reportSource()
page_title: reportSource() 
description: reportSource()
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()
tags: reportsource()
published: True
position: 12
---
<style>
table th:first-of-type {
    width: 25%;
}
table th:nth-of-type(2) {
    width: 75%;
}
</style>

# reportSource()

Gets the current report source - report and parameters.

Returns: an object with properties:


| Property | Description |
| ------ | ------ |
| __report__ |the report. For more information please see jQuery.fn.telerik_ReportViewer’s reportSource option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).|
| __parameters__ |an object with properties that names are the report parameters’ ids and values - the report parameters’ values.|


    
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
var rs = reportViewer.reportSource();
````

