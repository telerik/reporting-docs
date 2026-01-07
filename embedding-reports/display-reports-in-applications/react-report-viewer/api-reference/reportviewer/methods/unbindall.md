---
title: unbindAll
page_title: The unbindAll method of the React Report Viewer explained
description: "Learn more about the unbindAll method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/unbindall
tags: unbindall
published: True
reportingArea: React
position: 15
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

# The `unbindAll` method of the React Report Viewer

Unbinds all event handlers from the specified event.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to unbind all handlers from. |

## Example

````JavaScript
// Unbind all error handlers
reportViewerRef.current.unbindAll("error");
````

