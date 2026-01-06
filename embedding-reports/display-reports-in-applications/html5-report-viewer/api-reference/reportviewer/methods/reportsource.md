---
title: reportSource
page_title: The reportSource method of the HTML5 Report Viewer explained
description: "Learn more about the reportSource method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource
tags: reportsource
published: True
reportingArea: HTML5
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

    th {
        white-space: nowrap;
    }
</style>

# The `reportSource` method of the HTML5 Report Viewer

Gets or sets the report source for the viewer. When called with an argument, sets the report source When called without arguments, gets the current report source - report and parameters. The viewer's report source is updated dynamically as the users navigate between reports and change parameter values.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| rs | `ReportSource` | Yes | The report source object to set, or null to clear. If omitted, acts as a getter. |

## Example

````JavaScript
// Get the current report sourcevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var currentSource = viewer.reportSource();
````

````JavaScript
// Set a new report sourcevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.reportSource({  report: "MyReport",  parameters: { StartDate: "2024-01-01", EndDate: "2024-12-31" }});
````

````JavaScript
// Clear the report sourcevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.reportSource(null);
````
