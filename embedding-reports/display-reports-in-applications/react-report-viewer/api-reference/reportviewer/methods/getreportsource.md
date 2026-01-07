---
title: getReportSource
page_title: The getReportSource method of the React Report Viewer explained
description: "Learn more about the getReportSource method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getreportsource
tags: getreportsource
published: True
reportingArea: React
position: 2
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

# The `getReportSource` method of the React Report Viewer

Gets the current ReportSource - report and parameters.

## Example

````JavaScript
// Get current report source
const reportSource = reportViewerRef.current.getReportSource();
console.log("Current report:", reportSource.report);
console.log("Current parameters:", reportSource.parameters);
````

