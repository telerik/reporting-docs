---
title: serviceUrl
page_title: serviceUrl property
description: "The URL of the REST service serving reports. Required if reportServer is not provided."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/serviceurl
published: True
reportingArea: HTML5
---

# The `serviceUrl` option of the HTML5 Report Viewer

The URL of the REST service serving reports. Required if reportServer is not provided.

## Type

`string`

## Examples

````JavaScript
// Set the service URL
// Set the service URL for the report viewer
$("#reportViewer1").telerik_ReportViewer({
  // The URL of the REST service serving reports
  serviceUrl: "api/reports/",
  // The report source to display
  reportSource: { report: "Dashboard.trdp" }
});
````



