---
title: viewMode(vm)
page_title: viewMode(vm) | for Telerik Reporting Documentation
description: viewMode(vm)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/viewmode(vm)
tags: viewmode(vm)
published: True
position: 19
---

# viewMode(vm)

Sets the view mode and automatically reloads the current report (if any) into the new view.

Parameters:


| Parameter | Description |
| ------ | ------ |
| __vm__ |string; the view mode. For more information please see jQuery.fn.telerik_ReportViewer’s viewMode option in [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}#options);|


Returns: the current *ReportViewer* object. 

    
````js
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.viewMode(telerikReportViewer.PrintModes.PRINT_PREVIEW);
````

