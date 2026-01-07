---
title: setReportSource
page_title: The setReportSource method of the React Report Viewer explained
description: "Learn more about the setReportSource method of the React Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/setreportsource
tags: setreportsource
published: True
reportingArea: React
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

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `setReportSource` method of the React Report Viewer

Sets the report source - report and parameters. Automatically reloads the report (if any) into the view.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| rs | `Object` | No | The report source object to set. Object with properties: report (string) and parameters (JSON). |

## Example

````JavaScript
// Set a new report source
reportViewerRef.current.setReportSource({
  report: "SalesReport",
  parameters: { StartDate: "2024-01-01", EndDate: "2024-12-31" }
});
````

