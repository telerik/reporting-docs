---
title: pageMode
page_title: pageMode property
description: "The page mode. See [PageModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/pagemodes%})."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/pagemode
published: True
reportingArea: HTML5
---

# The `pageMode` option of the HTML5 Report Viewer

The page mode. See [PageModes]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/pagemodes%}).

## Type

[`PageModes`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/pagemodes%})

## Examples

````JavaScript
// Set page mode to single page using the enum value$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  // The page mode  pageMode: telerikReportViewer.PageModes.SINGLE_PAGE});
````

