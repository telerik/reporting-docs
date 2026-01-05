---
title: printMode
page_title: The printMode method of the HTML5 Report Viewer explained
description: "Learn more about the printMode method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/printmode
tags: printmode
published: True
reportingArea: HTML5
position: 6
---

# The `printMode` method of the HTML5 Report Viewer

Gets or sets the print mode for the viewer.

## Example

````JavaScript
// Get the current print modevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var printMode = viewer.printMode();
````

````JavaScript
// Set the print mode to Force PDF Filevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.printMode(telerikReportViewer.PrintModes.FORCE_PDF_FILE);
````


