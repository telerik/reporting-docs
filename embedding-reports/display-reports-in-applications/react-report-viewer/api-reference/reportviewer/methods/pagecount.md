---
title: pageCount
page_title: The pageCount method of the React Report Viewer explained
description: "Learn more about the pageCount method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/pagecount
tags: pagecount
published: True
reportingArea: React
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

# The `pageCount` method of the React Report Viewer

Gets the total page count of viewer’s currently displayed report.

## Example

````JavaScript
// Get total page countconst totalPages = reportViewerRef.current.pageCount();console.log("Total pages:", totalPages);
````
