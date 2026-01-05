---
title: refreshReport
page_title: The refreshReport method of the HTML5 Report Viewer explained
description: "Learn more about the refreshReport method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/refreshreport
tags: refreshreport
published: True
reportingArea: HTML5
position: 1
---

# The `refreshReport` method of the HTML5 Report Viewer

Refreshes the currently loaded report. Forces the viewer to reload the report from the server. Optionally ignores the cache.

## Example

````JavaScript
// Refresh the report, ignoring cache (default)var viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.refreshReport();
````

````JavaScript
// Refresh the report, using cache if availablevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.refreshReport(false);
````


