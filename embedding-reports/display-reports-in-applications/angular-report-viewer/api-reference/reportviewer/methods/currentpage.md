---
title: currentPage
page_title: The currentPage method of the Angular Report Viewer explained
description: "Learn more about the currentPage method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/currentpage
tags: currentpage
published: True
reportingArea: AngularWrapper
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

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `currentPage` method of the Angular Report Viewer

Gets the viewer's current page that is displayed. The current page number

## Example

````typescript
const currentPageNum = viewer.currentPage();
console.log(`Current page: ${currentPageNum}`);
````

