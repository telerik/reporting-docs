---
title: reportServer
page_title: reportServer property
description: "Sets the configuration details for Telerik Report Server. Required if serviceUrl is not provided."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/options/reportserver
published: True
reportingArea: React
---

# The `reportServer` option of the React Report Viewer

Sets the configuration details for Telerik Report Server. Required if serviceUrl is not provided.

## Type

[`ReportServer`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/reportserver%})

## Examples

````JavaScript
// Use Report Server authentication with Token (recommended for RS.NET)<TelerikReportViewer  reportServer={{    url: "https://yourReportServerUrl:port",    getPersonalAccessToken: function() {      return Promise.resolve("<personal-access-token>");    }  }}  reportSource={{ report: "Samples/Dashboard" }}/>
````

````JavaScript
// Use Report Server authentication with username/password (not recommended)<TelerikReportViewer  reportServer={{    url: "https://myserver.com/",    username: "reportuser",    password: "password123"  }}  reportSource={{ report: "Finance/Dashboard" }}/>
````



