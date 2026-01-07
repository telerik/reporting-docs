---
title: documentMapVisible
page_title: documentMapVisible property
description: "Determines whether the viewer's document map is displayed if any bookmark is defined."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/documentmapvisible
published: True
reportingArea: HTML5
---

# The `documentMapVisible` option of the HTML5 Report Viewer

Determines whether the viewer's document map is displayed if any bookmark is defined.

## Type

`boolean`

## Examples

````JavaScript
// Show document map
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  documentMapVisible: true
});
````



