---
title: persistSession
page_title: persistSession property
description: "Sets whether the viewer’s client session is persisted between page refreshes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/persistsession
published: True
reportingArea: HTML5
---

# The `persistSession` option of the HTML5 Report Viewer

Sets whether the viewer’s client session is persisted between page refreshes.

## Type

`boolean`

## Examples

````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  persistSession: true});
````

