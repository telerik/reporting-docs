---
title: setPageMode
page_title: The setPageMode method of the Angular Report Viewer explained
description: "Learn more about the setPageMode method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setpagemode
tags: setpagemode
published: True
reportingArea: AngularWrapper
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

# The `setPageMode` method of the Angular Report Viewer

Sets the page mode and automatically reloads the current report. The current ReportViewer object

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| psm | `string` | No | Page mode string ("SINGLE_PAGE" or "CONTINUOUS_SCROLL") |

## Example

````typescript
viewer.setPageMode("SINGLE_PAGE");
````
