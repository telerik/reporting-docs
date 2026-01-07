---
title: parametersAreaVisible
page_title: parametersAreaVisible property
description: "Determines whether the viewer's parameters area is displayed if any parameter editor exists."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/parametersareavisible
published: True
reportingArea: HTML5
---

# The `parametersAreaVisible` option of the HTML5 Report Viewer

Determines whether the viewer's parameters area is displayed if any parameter editor exists.

## Type

`boolean`

## Examples

````JavaScript
// Hide parameters area
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  parametersAreaVisible: false
});
````



