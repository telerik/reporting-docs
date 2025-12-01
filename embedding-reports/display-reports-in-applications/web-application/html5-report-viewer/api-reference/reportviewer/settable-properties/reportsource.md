---
title: reportSource
page_title: reportSource property
description: "Gets or sets the report source for the viewer. When called with an argument, sets the report source When called without arguments, gets the current report source - report and parameters. The viewer's report source is updated dynamically as the users navigate between reports and change parameter values."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/reportsource
published: True
reportingArea: HTML5
---

# reportSource

Gets or sets the report source for the viewer. When called with an argument, sets the report source When called without arguments, gets the current report source - report and parameters. The viewer's report source is updated dynamically as the users navigate between reports and change parameter values.

## Type

`ReportSource`

## Examples

````JavaScript
// Get the current report sourcevar viewer = $("#reportViewer1").data("telerik_ReportViewer");var currentSource = viewer.reportSource();
````

````JavaScript
// Set a new report sourcevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.reportSource({  report: "MyReport",  parameters: { StartDate: "2024-01-01", EndDate: "2024-12-31" }});
````

````JavaScript
// Clear the report sourcevar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.reportSource(null);
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
