---
title: viewMode
page_title: viewMode property
description: "Sets if the report is displayed in interactive mode or in print preview. Available values: \"INTERACTIVE\" (enables drill-down interactivity), \"PRINT_PREVIEW\" (paged according to page settings). Default value is \"INTERACTIVE\"."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/viewmode
published: True
reportingArea: React
---

# The `viewMode` option of the React Report Viewer

Sets if the report is displayed in interactive mode or in print preview. Available values: "INTERACTIVE" (enables drill-down interactivity), "PRINT_PREVIEW" (paged according to page settings). Default value is "INTERACTIVE".

## Type

`string`

## Examples

````JavaScript
// Set view mode to print preview<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  viewMode="PRINT_PREVIEW"/>
````

## See Also

* [React Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/react-report-viewer-overview%})
