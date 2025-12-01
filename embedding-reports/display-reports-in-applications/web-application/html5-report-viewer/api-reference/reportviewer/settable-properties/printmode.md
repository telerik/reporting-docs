---
title: printMode
page_title: printMode property
description: "Gets or sets the print mode for the viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/printmode
published: True
reportingArea: HTML5
---

# printMode

Gets or sets the print mode for the viewer.

## Type

`string`

## Examples

````JavaScript
// Get the current print modevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var printMode = viewer.printMode();
````

````JavaScript
// Set the print mode to Force PDF Filevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.printMode(telerikReportViewer.PrintModes.FORCE_PDF_FILE);
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
