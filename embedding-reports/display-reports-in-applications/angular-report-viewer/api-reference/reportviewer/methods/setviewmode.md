---
title: setViewMode
page_title: The setViewMode method of the Angular Report Viewer explained
description: "Learn more about the setViewMode method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setviewmode
tags: setviewmode
published: True
reportingArea: AngularWrapper
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

# The `setViewMode` method of the Angular Report Viewer

Sets the view mode and automatically reloads the current report. The current ReportViewer object

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| vm | `string` | No | View mode string ("INTERACTIVE" or "PRINT_PREVIEW") |

## Example

````typescript
viewer.setViewMode('PRINT_PREVIEW');
````

