---
title: initialPageAreaImageUrl
page_title: initialPageAreaImageUrl property
description: "The image URL for the PageArea background image."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/initialpageareaimageurl
published: True
reportingArea: HTML5
---

# The `initialPageAreaImageUrl` option of the HTML5 Report Viewer

The image URL for the PageArea background image.

## Type

`string`

## Examples

````JavaScript
// Set a background image
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: { report: "Dashboard.trdp" },
  initialPageAreaImageUrl: "/images/bg.png"
});
````



