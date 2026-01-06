---
title: bind
page_title: The bind method of the React Report Viewer explained
description: "Learn more about the bind method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind
tags: bind
published: True
reportingArea: React
position: 13
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

# The `bind` method of the React Report Viewer

Binds an event handler to the specified event.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to bind to. |
| eventHandler | `function` | No | The handler function to invoke when the event occurs. |

## Example

````JavaScript
// Bind to pageReady eventreportViewerRef.current.bind("pageReady", (e, args) => {  console.log("Page is ready!", args);});
````

````JavaScript
// Bind to error eventreportViewerRef.current.bind("error", (e, args) => {  console.error("Report viewer error:", args);});
````

