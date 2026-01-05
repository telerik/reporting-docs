---
title: printMode
page_title: printMode property
description: "The print mode. See [PrintModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/printmodes%})."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/printmode
published: True
reportingArea: HTML5
---

# The `printMode` option of the HTML5 Report Viewer

The print mode. See [PrintModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/printmodes%}).

## Type

[`PrintModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/printmodes%})

## Examples

````JavaScript
// Set print mode to force PDF file using the enum value$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  // The print mode  printMode: telerikReportViewer.PrintModes.FORCE_PDF_FILE});
````

