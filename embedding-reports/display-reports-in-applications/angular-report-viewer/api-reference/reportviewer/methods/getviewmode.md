---
title: getViewMode
page_title: The getViewMode method of the Angular Report Viewer explained
description: "Learn more about the getViewMode method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/getviewmode
tags: getviewmode
published: True
reportingArea: AngularWrapper
position: 4
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

# The `getViewMode` method of the Angular Report Viewer

Gets the current view mode. The current view mode string ("INTERACTIVE" or "PRINT_PREVIEW")

## Example

````typescript
console.log(viewer.getViewMode());
````
