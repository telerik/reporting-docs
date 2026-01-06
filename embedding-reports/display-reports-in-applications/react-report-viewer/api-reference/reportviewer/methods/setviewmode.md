---
title: setViewMode
page_title: The setViewMode method of the React Report Viewer explained
description: "Learn more about the setViewMode method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setviewmode
tags: setviewmode
published: True
reportingArea: React
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
</style>

# The `setViewMode` method of the React Report Viewer

Sets the view mode and automatically reloads the current report (if any) into the new view.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| vm | `string` | No | The view mode to set. |

## Example

    ````JavaScript
// Set view mode to print previewreportViewerRef.current.setViewMode("PRINT_PREVIEW");
````
