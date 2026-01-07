---
title: pageCount
page_title: The pageCount method of the HTML5 Report Viewer explained
description: "Learn more about the pageCount method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagecount
tags: pagecount
published: True
reportingArea: HTML5
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

# The `pageCount` method of the HTML5 Report Viewer

Gets the total page count of the viewer’s currently displayed report.

## Example

````JavaScript
// Get the total number of pages in the current report
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var totalPages = viewer.pageCount();
````

