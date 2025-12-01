---
title: getReportParameters
page_title: getReportParameters property
description: "Returns an object with properties, the names of which are the report parameters’ IDs, and values - the report parameters’ values. The values of multivalue parameters include their display and value members."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/read-only-properties/getreportparameters
published: True
reportingArea: HTML5
---

# getReportParameters

Returns an object with properties, the names of which are the report parameters’ IDs, and values - the report parameters’ values. The values of multivalue parameters include their display and value members.

## Type

`Array.<Object>`

## Examples

````JavaScript
// Get all report parameters and log themvar viewer = $("#reportViewer1").data("telerik_ReportViewer");var parameters = viewer.getReportParameters();console.log(parameters);
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
