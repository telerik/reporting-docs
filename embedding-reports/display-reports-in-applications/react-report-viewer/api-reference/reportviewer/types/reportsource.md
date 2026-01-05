---
title: ReportSource
page_title: ReportSource Type
description: "Configuration object that identifies the report to be displayed and provides initial parameter values."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/reportsource
published: True
reportingArea: React
---

# The `ReportSource` type of the React Report Viewer

Configuration object that identifies the report to be displayed and provides initial parameter values.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| report | `string` | A string that represents a report on the server. On the server side, this string will be converted to a ReportSource through an IReportResolver. This may be an assembly qualified type name that can be converted to TypeReportSource, a path to a report definition file (.trdp/.trdx) as in the UriReportSource, or even a report id that a dedicated IReportSourceResolver will use to read the report definition stored in a database. When using the viewer with Report Server, the report should be provided in the format: "{Category}/{ReportName}". |
| parameters | [`ReportParameters`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/reportparameters%}) | A JSON object with properties name/value equal to the report parameters' names and values used in the report definition. |

## Example

````JavaScript
// Example: Using ReportSource with the React Report Viewer<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{    report: "InventoryReport",    parameters: {      Category: "Electronics",      InStock: true    }  }}/>
````

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
