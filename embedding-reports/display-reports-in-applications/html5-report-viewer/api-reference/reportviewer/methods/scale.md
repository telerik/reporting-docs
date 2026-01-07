---
title: scale
page_title: The scale method of the HTML5 Report Viewer explained
description: "Learn more about the scale method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/scale
tags: scale
published: True
reportingArea: HTML5
position: 7
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }

    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `scale` method of the HTML5 Report Viewer

Gets or sets the scale and scale mode for the viewer.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| args | `Object` | Yes | The scale settings to apply. Should contain 'scale' (number) and 'scaleMode' (string). |
| args.scale | `number` | Yes | The zoom scale (e.g., 1.0 for 100%). |
| args.scaleMode | [`ScaleModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/scalemodes%}) | Yes | The scale mode (e.g., 'FIT_PAGE', 'FIT_PAGE_WIDTH', 'SPECIFIC'). |

## Example

````JavaScript
// Get the current scale and scale modevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var scaleInfo = viewer.scale();
````

````JavaScript
// Set scale to 1.2 and scale mode to FIT_PAGE_WIDTHvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.scale({ scale: 1.2, scaleMode: telerikReportViewer.ScaleModes.FIT_PAGE_WIDTH });
````

