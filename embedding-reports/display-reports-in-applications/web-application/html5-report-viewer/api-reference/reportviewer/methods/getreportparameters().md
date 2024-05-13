---
title: getReportParameters()
page_title: The getReportParameters() method of the HTML5 Report Viewer explained
description: "The getReportParameters() method of the Telerik Reporting HTML5 Report Viewer returns a collection of objects representing the evaluated report parameters."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/getreportparameters()
tags: getreportparameters()
published: True
position: 7
---

# The `getReportParameters()` method of the HTML5 Report Viewer

Returns an immutable array of name-value objects representing the current evaluated report parameters.

Returns: array containing the name and the value of each report parameter.

````JavaScript
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
var currentParameters = reportViewer.getReportParameters();
````


## See Also

* [HTML5 Report Viewer Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
