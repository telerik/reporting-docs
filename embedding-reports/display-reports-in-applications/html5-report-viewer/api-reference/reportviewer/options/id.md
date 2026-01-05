---
title: id
page_title: id property
description: "Sets the unique identifier of the ReportViewer instance. If not specified, the id of the target HTML element will be used."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/id
published: True
reportingArea: HTML5
---

# The `id` option of the HTML5 Report Viewer

Sets the unique identifier of the ReportViewer instance. If not specified, the id of the target HTML element will be used.

## Type

`string`

## Examples

````JavaScript
// Set a custom viewer ID$("#reportViewer1").telerik_ReportViewer({ serviceUrl: "api/reports/", reportSource: { report: "Dashboard.trdp" }, id: "myViewer1"});
````

