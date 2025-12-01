---
title: clearReportSource
page_title: clearReportSource property
description: "Clears the current reportSource from the viewer's internal state and its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on a server postback."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/clearreportsource
published: True
reportingArea: HTML5
---

# clearReportSource

Clears the current reportSource from the viewer's internal state and its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on a server postback.

## Type

`ReportViewerInstance`

## Examples

````JavaScript
// Clear the report source and force the viewer to respect a new reportSource on postbackvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.clearReportSource();
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
