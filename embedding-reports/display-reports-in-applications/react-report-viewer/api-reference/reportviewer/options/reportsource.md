---
title: reportSource
page_title: reportSource property
description: "Sets the report and initial report parameter values for the viewer to be displayed."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/reportsource
published: True
reportingArea: React
---

# The `reportSource` option of the React Report Viewer

Sets the report and initial report parameter values for the viewer to be displayed.

## Type

[`ReportSource`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/reportsource%})

## Examples

````JavaScript
// Basic report source<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}/>
````

````JavaScript
// Report source with parameters<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{    report: "SalesReport.trdp",    parameters: { StartDate: "2024-01-01", EndDate: "2024-12-31" }  }}/>
````

````JavaScript
// Report Server format<TelerikReportViewer  reportServer={{ url: "https://myserver/" }}  reportSource={{ report: "Finance/MonthlyReport" }}/>
````

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
