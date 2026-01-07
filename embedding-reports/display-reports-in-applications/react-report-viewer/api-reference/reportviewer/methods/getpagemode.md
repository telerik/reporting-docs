---
title: getPageMode
page_title: The getPageMode method of the React Report Viewer explained
description: "Learn more about the getPageMode method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getpagemode
tags: getpagemode
published: True
reportingArea: React
position: 16
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

# The `getPageMode` method of the React Report Viewer

Gets the current page mode of the viewer.

## Example

````JavaScript
// Get current page mode
const pageMode = reportViewerRef.current.getPageMode();
console.log("Current page mode:", pageMode);
````

