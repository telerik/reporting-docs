---
title: documentMapAreaPosition
page_title: documentMapAreaPosition property
description: "The position of the document map area. See [DocumentMapAreaPositions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/documentmapareapositions%})."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/documentmapareaposition
published: True
reportingArea: HTML5
---

# The `documentMapAreaPosition` option of the HTML5 Report Viewer

The position of the document map area. See [DocumentMapAreaPositions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/documentmapareapositions%}).

## Type

[`DocumentMapAreaPositions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/enumerations/documentmapareapositions%})

## Examples

````JavaScript
// Place document map on the right using the enum value
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  // The position of the document map area
  documentMapAreaPosition: telerikReportViewer.DocumentMapAreaPositions.RIGHT
});
````



