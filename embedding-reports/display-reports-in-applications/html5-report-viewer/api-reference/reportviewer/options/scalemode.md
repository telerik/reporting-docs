---
title: scaleMode
page_title: scaleMode property
description: "The scale mode. See [ScaleModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/scalemodes%})."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/scalemode
published: True
reportingArea: HTML5
---

# The `scaleMode` option of the HTML5 Report Viewer

The scale mode. See [ScaleModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/scalemodes%}).

## Type

[`ScaleModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/scalemodes%})

## Examples

````JavaScript
// Fit page width using the enum value
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // The scale mode
  scaleMode: telerikReportViewer.ScaleModes.FIT_PAGE_WIDTH
});
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/overview%})
* [searchMetadataOnDemand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/searchmetadataondemand%})
* [selector]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/selector%})

