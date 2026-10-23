---
title: Using with Report Server for .NET
page_title: Using HTML5 Report Viewer with Telerik Report Server for .NET
description: "Learn how to configure and use the Telerik Reporting HTML5 Report Viewer with a Telerik Report Server for .NET instance."
slug: html5-report-viewer-with-report-server-net
tags: how,use,html5,report,viewer,report,server,dotnet
published: True
reportingArea: HTML5
components: [html5, general]
position: 3
---

# Using the HTML5 Report Viewer with the Report Server for .NET

The article explains how to set up the HTML5 Report Viewer to work with the Telerik Report Server for .NET. The user account that will authenticate with the Report Server may be any User, including the Guest User, provided there is an enabled Token in its [Tokens](https://docs.telerik.com/report-server/dotnet-docs/token-authentication) collection.

## Prerequisites

1. Review the HTML5 Report Viewer [Requirements](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support).
1. Installed and running [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview).
1. Report Server for .NET's User that will connect from the viewer should have at least one enabled Token.
1. Report Server for .NET should contain at least one report that can be accessed by the User account.

## Configuring the HTML5 Report Viewer to work with the Report Server for .NET

Follow the steps below to set up your HTML5 Report Viewer to work with the Telerik Report Server for .NET as a backend instead of [using a Reporting REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service).

1. Use the following code instead of `serviceUrl: "/api/reports/",` to connect to the Report Server for .NET rather than to a Reporting REST Service:

	{{source=CodeSnippets\Blazor\Docs\JavaScript\Html5ReportViewerCustomTemplate.js region=Html5ViewerRSNet}}

	> caution The `serviceUrl` option shouldn't be present, or the viewer would default to no authentication scheme utilizing the Report Server for .NET as a regular Reporting REST Service.

	Substitute the `https://yourReportServerUrl:port` with the actual url of your Report Server for .NET instance, along with the port if needed.

	To authenticate against the Report Server for .NET you have the following options:

	- (**recommended**) The `reportServer.getPersonalAccessToken` option should be set to a function returning the Token of the user who is logging in to the Report Server for .NET wrapped in a [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise). Here is a sample implementation that relies on a dedicated secure endpoint '/rs-token' to return the token:

		{{source=CodeSnippets\Blazor\Docs\JavaScript\Html5ReportViewerCustomTemplate.js region=Html5ViewerRSNetAuthWithFunction}}

		Server-side, you may configure the endpoint, as shown below, after ensuring the EnvironmentVariable 'RS_NET_TOKEN' is set up correctly. We strongly recommend securing the endpoint:

		{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=Configuring_the_HTML5_Report_Viewer_to_work_with_the_Report_Server_for_NET}}

	- (_not recommended_) Alternatively, you may use a hardcoded _username_ and _password_ instead of Token authentication. We do not recommend this for security reasons:

		{{source=CodeSnippets\Blazor\Docs\JavaScript\Html5ReportViewerCustomTemplate.js region=Html5ViewerRSNetAuthWithCredentials}}

		> caution The Guest User may connect to the Report Server for .NET only with a Token. It doesn't have a password and cannot connect to the Report Server for .NET with Null credentials, as the Report Server for .NET Framework 4.6.2.

1. Locate the lines that set the report source's report definition (it should start with `report: "...`). Replace them with the following line: `report: "{Category}/{ReportName}"`, where `{Category}` and `{ReportName}` are the actual names of the category and report that can be accessed by the User you have provided Token or login credentials for. Set up the report parameters if needed.
1. The initialization should look like the following:

	{{source=CodeSnippets\Blazor\Docs\JavaScript\Html5ReportViewerCustomTemplate.js region=Html5ViewerRSNetInit}}

1. Run the project, and you should see the report configured in the previous step appearing in the Report Viewer.

## How Personal Token Authentication Works

Providing `reportServer.getPersonalAccessToken` does not eliminate the authentication request to Report Server for .NET. The viewer uses the following sequence:

1. The viewer calls `getPersonalAccessToken`. The callback returns a Promise that resolves to the user's personal access token string. Your application can obtain that token from its own secured endpoint, such as `/rs-token` in the example.
2. The viewer sends the returned token as a JSON string in a `POST` request to `{reportServer.url}/PersonalToken`.
3. Report Server for .NET validates the personal token and returns short-lived access and refresh tokens for the session.
4. The viewer uses the returned access token for authenticated report requests under `{reportServer.url}/api/reports`, including client registration and report rendering.

The application's token-supply endpoint and Report Server's `/PersonalToken` endpoint serve different purposes. The callback supplies the personal token. The viewer then exchanges it with Report Server for session tokens. You do not need to create a replacement `/PersonalToken` endpoint in your application.

Set `reportServer.url` to the Report Server application's base URL, without appending `/api/reports/`. The viewer constructs both the authentication and report-service URLs from that base. Correcting the base URL changes the request addresses, but does not remove the expected `POST /PersonalToken` request. The `/PersonalToken` request does not indicate that the viewer has switched to standalone Reporting REST Service mode.

> caution Do not log personal access tokens, returned session tokens, or authorization headers in browser consoles, application logs, or support attachments. Keep the application endpoint that supplies the personal token secured.

## Troubleshoot PersonalToken Requests

The presence of a `/PersonalToken` request is not an error by itself. Inspect the browser's Network panel for the request method, destination, status, and response. Opening the URL in the address bar sends a `GET` request and does not test the viewer's `POST` authentication flow.

| Observation | What to check |
| --- | --- |
| The callback fails before the token exchange | Verify that your secured application endpoint succeeds and that the callback returns a Promise resolving to the personal token string, not the entire service-response object. Do not log the token value. |
| The request targets `/api/reports/PersonalToken` | Check that `reportServer.url` contains the Report Server application base URL, not the Reporting REST service path. |
| `POST /PersonalToken` returns `404` | Confirm that the destination is the intended Report Server for .NET instance. Check the installed server and viewer versions, application base path, and any reverse-proxy routing. Do not diagnose a missing endpoint from the URL alone. |
| `POST /PersonalToken` returns `401` | Check token validity and expiration, and confirm that both the token and its user account are enabled. Report Server validates these before issuing session tokens. |
| The browser reports a transport or cross-origin failure | Investigate the specific browser error and the deployed connection configuration. The request URL alone does not identify the cause. |


## See Also

- [HTML5 Report Viewer](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview)
- [How To: Use HTML5 Report Viewer With REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service)
- [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview)- [Tokens Authentication in Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/token-authentication)
