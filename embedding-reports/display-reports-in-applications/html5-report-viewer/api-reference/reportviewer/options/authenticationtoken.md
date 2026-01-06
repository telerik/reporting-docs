---
title: authenticationToken
page_title: authenticationToken property
description: "If provided, a Bearer token will be set in the Authorization header for requests to the REST service."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/options/authenticationtoken
published: True
reportingArea: HTML5
---

# The `authenticationToken` option of the HTML5 Report Viewer

If provided, a Bearer token will be set in the Authorization header for requests to the REST service.

## Type

`string`

## Examples

````JavaScript
// Set authentication token$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: { report: "Dashboard.trdp" },  // Bearer token for REST service requests  authenticationToken: "YOUR_AUTH_TOKEN"});
````



