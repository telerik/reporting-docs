---
title: reportSource()
page_title: reportSource() | for Telerik Reporting Documentation
description: reportSource()
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource()
tags: reportsource()
published: True
position: 12
---

# reportSource()



Gets the current report source - report and parameters.

Returns: an object with properties:

| Property | Description |
| ------ | ------ |
| __report__ |the report. For more information please see jQuery.fn.telerik_ReportViewer’s reportSource option in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options).|
| __parameters__ |an object with properties that names are the report parameters’ ids and values - the report parameters’ values.|

    
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
var rs = reportViewer.reportSource();
````

