---
title: currentPage
page_title: The currentPage method of the HTML5 Report Viewer explained
description: "Learn more about the currentPage method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/currentpage
tags: currentpage
published: True
reportingArea: HTML5
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

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `currentPage` method of the HTML5 Report Viewer

Gets the viewer’s current page that is displayed.

## Example

````JavaScript
// Get the current page number
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var page = viewer.currentPage();
````

