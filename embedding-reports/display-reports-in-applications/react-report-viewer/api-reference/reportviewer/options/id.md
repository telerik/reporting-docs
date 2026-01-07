---
title: id
page_title: id property
description: "Sets the unique identifier of the ReportViewer instance. If not specified, the id of the target HTML element will be used (if such is set). The id of the ReportViewer is used to identify the client session of the viewer when persistSession is enabled (true)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/id
published: True
reportingArea: React
---

# The `id` option of the React Report Viewer

Sets the unique identifier of the ReportViewer instance. If not specified, the id of the target HTML element will be used (if such is set). The id of the ReportViewer is used to identify the client session of the viewer when persistSession is enabled (true).

## Type

`string`

## Examples

````JavaScript
// Set a custom viewer ID
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  id="myUniqueViewer"
/>
````



