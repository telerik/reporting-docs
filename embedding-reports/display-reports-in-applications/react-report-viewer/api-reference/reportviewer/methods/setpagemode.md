---
title: setPageMode
page_title: The setPageMode method of the React Report Viewer explained
description: "Learn more about the setPageMode method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setpagemode
tags: setpagemode
published: True
reportingArea: React
position: 17
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
</style>

# The `setPageMode` method of the React Report Viewer

Sets the page mode of the viewer.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| psm | `string` | No | The page mode to set (use PageModes constants). |

## Example

    ````JavaScript
// Set page mode to single pagereportViewerRef.current.setPageMode("SINGLE_PAGE");
````
