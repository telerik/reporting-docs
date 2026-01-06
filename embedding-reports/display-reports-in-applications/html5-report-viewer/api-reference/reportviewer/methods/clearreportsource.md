---
title: clearReportSource
page_title: The clearReportSource method of the HTML5 Report Viewer explained
description: "Learn more about the clearReportSource method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/clearreportsource
tags: clearreportsource
published: True
reportingArea: HTML5
position: 3
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

# The `clearReportSource` method of the HTML5 Report Viewer

Clears the current reportSource from the viewer's internal state and its persisted session in the browser. Called in order to force the viewer to respect the newly set reportSource on a server postback.

## Example

````JavaScript
// Clear the report source and force the viewer to respect a new reportSource on postbackvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.clearReportSource();
````
