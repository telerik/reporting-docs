---
title: getReportParameters()
page_title: The getReportParameters() method of the HTML5 Report Viewer explained
description: "The getReportParameters() method of the Telerik Reporting HTML5 Report Viewer returns a collection of objects representing the evaluated report parameters."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/getreportparameters()
tags: getreportparameters()
published: True
reporting_area: HTML5
position: 7
---

# The `getReportParameters()` method of the HTML5 Report Viewer

Returns an object with properties, the names of which are the report parameters’ IDs, and values - the report parameters’ values.
The values of multivalue parameters include their display and value members.

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
var currentParameters = reportViewer.getReportParameters();
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
