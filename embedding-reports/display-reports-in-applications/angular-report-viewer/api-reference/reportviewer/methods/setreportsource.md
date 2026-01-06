---
title: setReportSource
page_title: The setReportSource method of the Angular Report Viewer explained
description: "Learn more about the setReportSource method of the Angular Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/setreportsource
tags: setreportsource
published: True
reportingArea: AngularWrapper
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

    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `setReportSource` method of the Angular Report Viewer

Sets the report source (report and parameters). Automatically reloads the report into the view. The current ReportViewer object

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| rs | `any` | No | Object with report and parameters properties |

## Example

````typescript
viewer.setReportSource({
  report: 'NewReport.trdp',
  parameters: { param1: 'value1' }
});
````

