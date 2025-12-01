---
title: viewMode
page_title: viewMode property
description: "Gets or sets the view mode of the viewer (e.g., Interactive or Print Preview)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/viewmode
published: True
reportingArea: HTML5
---

# viewMode

Gets or sets the view mode of the viewer (e.g., Interactive or Print Preview).

## Type

`string`

## Examples

````JavaScript
// Get the current view modevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var mode = viewer.viewMode();
````

````JavaScript
// Set the view mode to Print Previewvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.viewMode(telerikReportViewer.ViewModes.PRINT_PREVIEW);
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
