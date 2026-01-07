---
title: refreshReport
page_title: The refreshReport method of the React Report Viewer explained
description: "Learn more about the refreshReport method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/refreshreport
tags: refreshreport
published: True
reportingArea: React
position: 1
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

# The `refreshReport` method of the React Report Viewer

Reloads/refreshes the current report.

## Example

````JavaScript
// Using ref to call refreshReport
const reportViewerRef = useRef();
<TelerikReportViewer ref={reportViewerRef} serviceUrl="api/reports/" reportSource={{ report: "Dashboard.trdp" }} />
// ...
reportViewerRef.current.refreshReport();
````

