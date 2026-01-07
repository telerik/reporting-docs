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

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `printMode` method of the HTML5 Report Viewer

Gets or sets the print mode for the viewer.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| pm | [`PrintModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/printmodes%}) | Yes | The print mode to set. If omitted, returns the current print mode. |

## Example

````JavaScript
// Get the current print mode
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var printMode = viewer.printMode();
````

````JavaScript
// Set the print mode to Force PDF File
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.printMode(telerikReportViewer.PrintModes.FORCE_PDF_FILE);
````

## See Also

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview%})
* [refreshReport]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/refreshreport%})
* [reportSource]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource%})

