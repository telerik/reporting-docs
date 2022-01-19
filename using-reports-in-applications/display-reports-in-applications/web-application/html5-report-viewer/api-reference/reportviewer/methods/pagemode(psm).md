---
title: pageMode(psm)
page_title: pageMode(psm) | for Telerik Reporting Documentation
description: pageMode(psm)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagemode(psm)
tags: pagemode(psm)
published: True
position: 10
---

# pageMode(psm)

Sets the page mode and automatically reloads the current report (if any) into the new view.

Parameters:


| Parameter | Description |
| ------ | ------ |
| __psm__ |string; the page mode. For more information please see jQuery.fn.telerik_ReportViewer’s pageMode option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options).|


Returns: the current *ReportViewer* object. 

    
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.pageMode(telerikReportViewer.PageModes.SINGLE_PAGE);
````

