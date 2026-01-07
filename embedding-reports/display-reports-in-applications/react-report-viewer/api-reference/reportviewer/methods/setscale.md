---
title: setScale
page_title: The setScale method of the React Report Viewer explained
description: "Learn more about the setScale method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setscale
tags: setscale
published: True
reportingArea: React
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

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `setScale` method of the React Report Viewer

Sets the scale factor and scale mode.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| scale | `Object` | No | The scale object to set. |

## Example

````JavaScript
// Set scale to 150% and mode to SPECIFIC
reportViewerRef.current.setScale({ scale: 1.5, scaleMode: "SPECIFIC" });
````

## See Also

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/overview%})
* [setViewMode]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setviewmode%})
* [unbind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/unbind%})

