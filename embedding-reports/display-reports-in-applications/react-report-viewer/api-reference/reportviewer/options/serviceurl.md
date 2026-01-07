---
title: serviceUrl
page_title: serviceUrl property
description: "Sets the address of the Report REST Service. Required if reportServer is not provided."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/serviceurl
published: True
reportingArea: React
---

# The `serviceUrl` option of the React Report Viewer

Sets the address of the Report REST Service. Required if reportServer is not provided.

## Type

`string`

## Examples

````JavaScript
// Set the service URL for the report viewer
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
/>
````



