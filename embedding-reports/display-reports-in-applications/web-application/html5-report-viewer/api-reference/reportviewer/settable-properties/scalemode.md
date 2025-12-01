---
title: scaleMode
page_title: scaleMode property
description: "The scale mode. See {@link ScaleModes}."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/settable-properties/scalemode
published: True
reportingArea: HTML5
---

# scaleMode

The scale mode. See {@link ScaleModes}.

## Type

`ScaleModes`

## Examples

````JavaScript
// Fit page width using the enum value$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  // The scale mode  scaleMode: telerikReportViewer.ScaleModes.FIT_PAGE_WIDTH});
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
