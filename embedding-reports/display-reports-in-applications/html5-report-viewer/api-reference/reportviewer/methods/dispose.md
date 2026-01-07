---
title: dispose
page_title: The dispose method of the HTML5 Report Viewer explained
description: "Learn more about the dispose method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/dispose
tags: dispose
published: True
reportingArea: HTML5
position: 17
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

# The `dispose` method of the HTML5 Report Viewer

Disposes the viewer instance, cleaning up resources and event handlers. After calling this method, the viewer instance should not be used. Stops sending keep alive requests to the server, if keep client alive was enabled.

## Example

````JavaScript
// Dispose the viewer instance when it is no longer needed
var viewer = $("#reportViewer1").data("telerik_ReportViewer");
viewer.dispose();
````

## See Also

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/overview%})
* [getReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/getreportparameters%})
* [isReportAutoRun]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/isreportautorun%})

