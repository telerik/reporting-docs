---
title: viewMode
page_title: viewMode property
description: "The view mode. See [ViewModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/viewmodes%})."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/viewmode
published: True
reportingArea: HTML5
---

# The `viewMode` option of the HTML5 Report Viewer

The view mode. See [ViewModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/viewmodes%}).

## Type

[`ViewModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/viewmodes%})

## Examples

````JavaScript
// Set view mode to print preview using the enum value
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // The view mode
  viewMode: telerikReportViewer.ViewModes.PRINT_PREVIEW
});
````



