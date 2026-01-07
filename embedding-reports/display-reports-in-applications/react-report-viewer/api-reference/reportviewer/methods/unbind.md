---
title: unbind
page_title: The unbind method of the React Report Viewer explained
description: "Learn more about the unbind method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/unbind
tags: unbind
published: True
reportingArea: React
position: 14
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

# The `unbind` method of the React Report Viewer

Unbinds an event handler from the specified event.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to unbind from. |
| eventHandler | `function` | Yes | The handler function to remove. If omitted, all handlers are removed. |

## Example

````JavaScript
// Unbind specific handler
reportViewerRef.current.unbind("error", myErrorHandler);
````

````JavaScript
// Unbind all handlers for an event
reportViewerRef.current.unbind("pageReady");
````

