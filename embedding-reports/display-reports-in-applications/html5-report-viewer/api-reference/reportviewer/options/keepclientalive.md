---
title: keepClientAlive
page_title: keepClientAlive property
description: "Determines whether the client will be kept alive."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/keepclientalive
published: True
reportingArea: HTML5
---

# The `keepClientAlive` option of the HTML5 Report Viewer

Determines whether the client will be kept alive.

## Type

`boolean`

## Examples

````JavaScript
// Keep client alive$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  keepClientAlive: true});
````

