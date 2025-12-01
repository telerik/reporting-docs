---
title: Overview
page_title: Read-Only Properties of the Native Angular Report Viewer
description: Read-Only Properties of the Native Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/overview
tags: overview,properties
published: True
reportingArea: NativeAngular
position: 0
---

# Read-Only Properties of the Native Angular Report Viewer

| Property | Description |
| ------ | ------ |
| [parametersAreaVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/parametersareavisible%})|Controls the visibility of the parameters area if the report has parameters.|
| [reportServer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/read-only-properties/reportserver%})|Configuration for Telerik Report Server connection.  The authentication method depends on the Report Server version: - Report Server for .NET: Supports Token authentication (ReportServerTokenSettings) or username/password authentication (ReportServerSettings). The token can be from any user, including the Guest user. - Report Server for .NET Framework 4.6.2: Supports username/password authentication (ReportServerSettings) or Guest account (url only with ReportServerSettings, if Guest is enabled on the server).  Required when serviceType is set to 'reportServer'. The ReportServerSettings or ReportServerTokenSettings types should be imported from '@progress/telerik-common-report-viewer'.  ReportServerTokenSettings properties: - url (string, required) - The URL to the Telerik Report Server instance. - getPersonalAccessToken (function, required) - A callback function that returns the Token for authentication against the Telerik Report Server for .NET instance wrapped in a Promise. This is the recommended authentication method for Report Server for .NET. The token can be from any user account, including the Guest user. Only supported by Report Server for .NET.  ReportServerSettings properties: - url (string, required) - The URL to the Telerik Report Server instance. - username (string, required) - A registered username in the Report Server that will be used to get access to the reports. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2. - password (string, required) - The password for the provided username. Supported by both Report Server for .NET and Report Server for .NET Framework 4.6.2.|
