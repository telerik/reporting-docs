---
title: getReportParameters
page_title: The getReportParameters method of the React Report Viewer explained
description: "Learn more about the getReportParameters method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/getreportparameters
tags: getreportparameters
published: True
reportingArea: React
position: 20
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

# The `getReportParameters` method of the React Report Viewer

Returns an immutable array of name-value objects representing the current evaluated report parameters.

## Example

````JavaScript
// Get current report parametersconst parameters = reportViewerRef.current.getReportParameters();parameters.forEach(param => {  console.log(`Parameter ${param.name}: ${param.value}`);});
````

