---
title: clearReportSource
page_title: The clearReportSource method of the Angular Report Viewer explained
description: "Learn more about the clearReportSource method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/clearreportsource
tags: clearreportsource
published: True
reportingArea: AngularWrapper
position: 18
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

# The `clearReportSource` method of the Angular Report Viewer

Clears the current report source from the viewer's internal state and from its persisted session in the browser. Forces the viewer to respect newly set report source on next postback. The current ReportViewer object

## Example

````typescript
viewer.clearReportSource();
````

