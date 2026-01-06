---
title: ReportSource
page_title: ReportSource Type
description: "Defines the report source for the viewer, specifying which report to load and any parameters to pass to it."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/reportsource
published: True
reportingArea: HTML5
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }
</style>

# The `ReportSource` type of the HTML5 Report Viewer

Defines the report source for the viewer, specifying which report to load and any parameters to pass to it.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| report | `string` | The report name or path. When the viewer is connected to a Report Server, the name should follow the '{Category}/{ReportName}' pattern. |
| parameters | [`ReportParameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/reportparameters%}) | Report parameters. |

## Example

````JavaScript
// Example: Minimal report source with only the report namevar reportSource = {  report: "MyReport"};
````

````JavaScript
// Example: Report source with parametersvar reportSource = {  report: "SalesReport",  parameters: {    StartDate: "2024-01-01",    EndDate: "2024-12-31",    Region: "North America"  }};
````

````JavaScript
// Example: Using ReportSource with the Report Viewer initialization$("#reportViewer").telerik_ReportViewer({  reportSource: {    report: "InventoryReport",    parameters: {      Category: "Electronics",      InStock: true    }  }});
````

