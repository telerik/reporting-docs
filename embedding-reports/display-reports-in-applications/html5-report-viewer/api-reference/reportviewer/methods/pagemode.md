---
title: pageMode
page_title: The pageMode method of the HTML5 Report Viewer explained
description: "Learn more about the pageMode method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagemode
tags: pagemode
published: True
reportingArea: HTML5
position: 5
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

# The `pageMode` method of the HTML5 Report Viewer

Gets or sets the page mode (e.g., Single Page or Continuous Scroll).

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| psm | `PageModes` | Yes | The page mode to set. If omitted, returns the current page mode. |

## Example

````JavaScript
// Get the current page modevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var pageMode = viewer.pageMode();
````

````JavaScript
// Set the page mode to Single Pagevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.pageMode(telerikReportViewer.PageModes.SINGLE_PAGE);
````

