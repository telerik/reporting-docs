---
title: pageCount
page_title: The pageCount method of the Angular Report Viewer explained
description: "Learn more about the pageCount method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/pagecount
tags: pagecount
published: True
reportingArea: AngularWrapper
position: 8
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

# The `pageCount` method of the Angular Report Viewer

Gets the total page count of the currently displayed report. The total number of pages

## Example

````typescript
const totalPages = viewer.pageCount();
console.log(`Total pages: ${totalPages}`);
````

