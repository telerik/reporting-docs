---
title: reportSource(rs)
page_title: reportSource(rs) | for Telerik Reporting Documentation
description: reportSource(rs)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)
tags: reportsource(rs)
published: True
position: 13
---

# reportSource(rs)



## 

Sets the report source.

Parameters:


| Parameter | Description |
| ------ | ------ |
| __rs__ |an object with properties:<br/>*  *report* - the report. For more information please see jQuery.fn.telerik_ReportViewer’s reportSource option in [](c578f366-93da-4dd1-8972-6efbc5a1790b#Options);<br/>*  *parameters* - an object with properties that names are the report parameters’ ids and values - the report parameters’ values|




Returns: the current *ReportViewer*  object.         

	
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.reportSource({
            report: "product catalog.trdx",
            parameters: { "CultureID": "fr" },
        });
````

