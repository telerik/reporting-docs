---
title: viewMode
page_title: The viewMode method of the HTML5 Report Viewer explained
description: "Learn more about the viewMode method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/viewmode
tags: viewmode
published: True
reportingArea: HTML5
position: 4
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

# The `viewMode` method of the HTML5 Report Viewer

Gets or sets the view mode of the viewer (e.g., Interactive or Print Preview).

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| vm | [`ViewModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/viewmodes%}) | Yes | The view mode to set. If omitted, returns the current view mode. |

## Example

````JavaScript
// Get the current view mode
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var mode = viewer.viewMode();
````

````JavaScript
// Set the view mode to Print Preview
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.viewMode(telerikReportViewer.ViewModes.PRINT_PREVIEW);
````

