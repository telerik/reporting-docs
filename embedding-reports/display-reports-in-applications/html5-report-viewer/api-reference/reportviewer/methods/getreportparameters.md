---
title: getReportParameters
page_title: The getReportParameters method of the HTML5 Report Viewer explained
description: "Learn more about the getReportParameters method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/getreportparameters
tags: getreportparameters
published: True
reportingArea: HTML5
position: 11
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

# The `getReportParameters` method of the HTML5 Report Viewer

Returns an object with properties, the names of which are the report parameters’ IDs, and values - the report parameters’ values. The values of multivalue parameters include their display and value members.

## Example

````JavaScript
// Get all report parameters and log them
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
var parameters = viewer.getReportParameters();
console.log(parameters);
````

## See Also

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview%})
* [isReportAutoRun]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/isreportautorun%})
* [pageCount]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/pagecount%})

