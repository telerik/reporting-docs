---
title: Telerik.ReportViewer.Html5.Common.ReportServer
page_title: Telerik.ReportViewer.Html5.Common.ReportServer Type
description: "Provides a class for the report server data. Contains the URL to the report server instance, a valid username and password. Connecting to Telerik Report Server for .NET is not supported."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/api-reference/reportviewer/types/reportserver
published: True
reportingArea: WebForms
---

# The `ReportServer` type of the HTML5 ASP.NET WebForms Report Viewer

Provides a class for the report server data. Contains the URL to the report server instance, a valid username and password. Connecting to Telerik Report Server for .NET is not supported.

## Constructors

| Constructor | Description |
| ------ | ------ |
| ReportServer() | The default constructor. |

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Password | `System.String` | The password associated with the username. Empty when Username is not set |
| Url | `System.String` | The URL of the Telerik Report Server instance |
| Username | `System.String` | A valid username that exists in Report Server registered users.<br>Empty in order to use the built-in Guest account.<br>Either usage requires configured server permissions for accessing the report. |

## See Also

* [HTML5 ASP.NET WebForms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/webforms-report-viewer/overview%})
