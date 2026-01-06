---
title: currentPage
page_title: The currentPage method of the React Report Viewer explained
description: "Learn more about the currentPage method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/currentpage
tags: currentpage
published: True
reportingArea: React
position: 9
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

# The `currentPage` method of the React Report Viewer

Gets the viewer’s current page that is displayed.

## Example

````JavaScript
// Get current page numberconst currentPage = reportViewerRef.current.currentPage();console.log("Current page:", currentPage);
````

