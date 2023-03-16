---
title: Connection String to Report Engine
page_title: Constructing a string to connect to the Reporting Engine
description: "Learn How to Construct a string to connect to the Reporting Engine in the desktop viewers of Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-construct-a-string-to-connect-to-report-engine
tags: how,to,construct,a,string,to,connect,to,report,engine
published: True
position: 6
previous_url: /report-engine-connectionstring
---

<style>
table th:first-of-type {
	width: 20%;
}
table th:nth-of-type(2) {
	width: 80%;
}
</style>

# Constructing a Connection String to the Reporting Engine

When using WinForms or WPF Report Viewer, its connection to a Report Server or REST service instance should be additionally set. This topic lists the supported keywords for each report engine type and explains how to construct a connection string with or without using helper classes.

All the keywords and their values are case insensitive where applicable.

## Embedded Report Engine

| Keyword | Value |
| ------ | ------ |
|`Engine`|Embedded|

__Example:__ `engine=embedded`

You can use a [EmbeddedConnectionInfo](/api/Telerik.ReportViewer.Common.EmbeddedConnectionInfo) instance to help you create the connection string or leave it empty - the viewer will use the embedded report engine by default.

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WinForms\Form1.cs region=WinFormsEmbeddedReportEngineConnectionSnippet}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WinForms\Form1.vb region=WinFormsEmbeddedReportEngineConnectionSnippet}}

## Report Server Engine

| Keyword | Value |
| ------ | ------ |
|`Engine`|ReportServer|
|`Uri`| *required*; The URI of the Report Server instance|
|`Username`| *optional*; The user name used to connect to Report Server. If omitted, the __Guest__ account will be used, if it is enabled.|
|`Password`| *optional*; The password associated with the user name.|
|`Timeout`| *optional*; The timeout for rendering a document measured in seconds. The default value is 100 seconds. Value of 0 indicates no expiration.|
|`KeepClientAlive`| *optional True/False*. Sets whether the client will be kept alive. When set to true expiration of the client will be prevented by continually sending a request to the server, determined by the Reporting REST service's __ClientSessionTimeout__. The default value is True.|

__Example:__ `engine=ReportServer;uri=http://localhost:83;username=admin;password=pass;timeout=30;keepClientAlive=true`

You can use a [ReportServerConnectionInfo](/api/Telerik.ReportViewer.Common.ReportServerConnectionInfo) instance to help you create the connection string.

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WinForms\Form1.cs region=WinFormsReportServerReportEngineConnectionSnippet}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WinForms\Form1.vb region=WinFormsReportServerReportEngineConnectionSnippet}}

## REST Service Engine

| Keyword | Value |
| ------ | ------ |
|`Engine`|RestService|
|`Uri`| *required*; The URI of the REST Service instance.|
|`Token`| *optional*; If provided, a *Bearer* token will be set in the *Authorization* header for every request to the REST service.|
|`UseDefaultCredentials`| *optional, True/False*; If provided, the client will send the default credentials with its requests. The default value is *False*.|
|`Timeout`| *optional*; The timeout for rendering a document measured in seconds. The default value is 100 seconds. Value of 0 indicates no expiration.|
|`KeepClientAlive`| *optional True/False*. Sets whether the client will be kept alive. When set to true expiration of the client will be prevented by continually sending a request to the server, determined by the Reporting REST service's __ClientSessionTimeout__. The default value is True.|

__Example:__ `engine=RestService;uri=http://localhost:18103/api/reports;token=authToken;useDefaultCredentials=true;timeout=30;keepClientAlive=true`

You can use a [RestServiceConnectionInfo](/api/Telerik.ReportViewer.Common.RestServiceConnectionInfo) instance to help you create the connection string.

{{source=CodeSnippets\CS\API\Telerik\ReportViewer\WinForms\Form1.cs region=WinFormsRestServiceReportEngineConnectionSnippet}}
{{source=CodeSnippets\VB\API\Telerik\ReportViewer\WinForms\Form1.vb region=WinFormsRestServiceReportEngineConnectionSnippet}}

## See Also

* [EmbeddedConnectionInfo](/api/Telerik.ReportViewer.Common.EmbeddedConnectionInfo)
* [ReportServerConnectionInfo](/api/Telerik.ReportViewer.Common.ReportServerConnectionInfo)
* [RestServiceConnectionInfo](/api/Telerik.ReportViewer.Common.RestServiceConnectionInfo)
