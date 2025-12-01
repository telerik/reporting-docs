---
title: refreshReport
page_title: refreshReport property
description: "Refreshes the currently loaded report. Forces the viewer to reload the report from the server. Optionally ignores the cache."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/refreshreport
published: True
reportingArea: HTML5
---

# refreshReport

Refreshes the currently loaded report. Forces the viewer to reload the report from the server. Optionally ignores the cache.

## Type

`ReportViewerInstance`

## Examples

````JavaScript
// Refresh the report, ignoring cache (default)var viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.refreshReport();
````

````JavaScript
// Refresh the report, using cache if availablevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.refreshReport(false);
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
