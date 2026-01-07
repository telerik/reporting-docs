---
title: setScale
page_title: The setScale method of the Angular Report Viewer explained
description: "Learn more about the setScale method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setscale
tags: setscale
published: True
reportingArea: AngularWrapper
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

# The `setScale` method of the Angular Report Viewer

Sets the scale factor and scale mode. The current ReportViewer object

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| scale | `any` | No | Object with scale and scaleMode properties |

## Example

````typescript
viewer.setScale({
  scale: 1.5,
  scaleMode: 'SPECIFIC'
});
````

