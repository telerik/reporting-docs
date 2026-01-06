---
title: isReportAutoRun
page_title: The isReportAutoRun method of the HTML5 Report Viewer explained
description: "Learn more about the isReportAutoRun method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/isreportautorun
tags: isreportautorun
published: True
reportingArea: HTML5
position: 12
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

# The `isReportAutoRun` method of the HTML5 Report Viewer

Returns whether auto-run is enabled for the report (i.e., whether the report runs automatically when parameters change).

## Example

    ````JavaScript
// Check if auto-run is enabled for the reportvar viewer = $("#reportViewer1").data("telerik_ReportViewer");var isReportAutoRun = viewer.isReportAutoRun();
````
