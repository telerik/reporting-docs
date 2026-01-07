---
title: disabledButtonClass
page_title: disabledButtonClass property
description: "A class used for disabled state buttons."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/disabledbuttonclass
published: True
reportingArea: HTML5
---

# The `disabledButtonClass` option of the HTML5 Report Viewer

A class used for disabled state buttons.

## Type

`string`

## Examples

````JavaScript
// Use a custom class for disabled buttons
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  disabledButtonClass: "my-disabled"
});
````



