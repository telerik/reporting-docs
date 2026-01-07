---
title: unbind
page_title: The unbind method of the Angular Report Viewer explained
description: "Learn more about the unbind method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/unbind
tags: unbind
published: True
reportingArea: AngularWrapper
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

# The `unbind` method of the Angular Report Viewer

Unbinds a specific event handler from a report viewer event.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | `string` | No | The name of the event to unbind from |
| eventHandler | `Function` | No | The specific function to remove |

## Example

````typescript
viewer.unbind('ready', this.readyHandler);
````

