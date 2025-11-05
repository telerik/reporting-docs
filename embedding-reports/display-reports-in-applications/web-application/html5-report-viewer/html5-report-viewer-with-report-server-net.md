---
title: Using with Report Server for .NET
page_title: Using HTML5 Report Viewer with Telerik Report Server for .NET
description: "Learn how to configure and use the Telerik Reporting HTML5 Report Viewer with a Telerik Report Server for .NET instance."
slug: html5-report-viewer-with-report-server-net
tags: how,use,html5,report,viewer,report,server,dotnet
published: True
reportingArea: HTML5
position: 3
---

# Using the HTML5 Report Viewer with the Report Server for .NET

The article explains how to set up the HTML5 Report Viewer to work with the Telerik Report Server for .NET. This may be any User, including the Guest User, provided there is an enabled Token in its [Tokens](https://docs.telerik.com/report-server/dotnet-docs/token-authentication) collection. 

## Prerequisites

1. Review the HTML5 Report Viewer [Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}).
1. Installed and running [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview).
1. Report Server for .NET's User that will connect from the viewer should have at least one enabled Token.
1. Report Server for .NET should contain at least one report that can be accessed by the User account.

## Configuring the HTML5 Report Viewer to work with the Report Server for .NET

Follow the steps below to set up your HTML5 Report Viewer to work with the Telerik Report Server for .NET as a backend instead of [using a Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%}).

1. Use the following code instead of `serviceUrl: "/api/reports/",` to connect to the Report Server for .NET rather than to a Reporting REST Service:

	````JavaScript
reportServer: {
		url: "https://yourReportServerUrl:port",
		getPersonalAccessToken: function() {
			return Promise.resolve("<personal-access-token>");
		}
	},
````

	>caution The `serviceUrl` option shouldn't be present, or the viewer would default to no authentication scheme utilizing the Report Server for .NET as a regular Reporting REST Service.

	Substitute the `https://yourReportServerUrl:port` with the actual url of your Report Server for .NET instance, along with the port if needed.

	(__recommended__) The `reportServer.getPersonalAccessToken` option should be set to a function returning the Token of the user who is logging in to the Report Server for .NET wrapped in a [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise). Here is a sample implementation that relies on a dedicated secure endpoint '/rs-token' to return the token:

	````JavaScript
reportServer: {
		url: "https://yourReportServerUrl:port",
		getPersonalAccessToken: function() {
			return fetch('/rs-token')
				.then(response => response.text())
		}
	},
````

	Server-side, you may configure the endpoint, as shown below, after ensuring the EnvironmentVariable 'RS_NET_TOKEN' is set up correctly. We strongly recommend securing the endpoint:

	````C#
app.MapGet("/rs-token", (HttpContext context) =>
	{
		return Environment.GetEnvironmentVariable("RS_NET_TOKEN") ?? string.Empty;
	})
	.RequireAuthorization();
````


	(_not recommended_) Alternatively, you may use a hardcoded username and password instead of Token authentication. We do not recommend this for security reasons:

	````JavaScript
reportServer: {
		url: "https://yourReportServerUrl:port",
		username: "<hardcoded-username>",
		password: "<hardcoded-password>"
	},
````

	>caution The Guest User may connect to the Report Server for .NET only with a Token. It doesn't have a password and cannot connect to the Report Server for .NET with Null credentials, as the Report Server for .NET Framework 4.6.2.

1. Locate the lines that set the report source's report definition (it should start with `report: "...`). Replace them with the following line: `report: "{Category}/{ReportName}"`, where `{Category}` and `{ReportName}` are the actual names of the category and report that can be accessed by the User you have provided Token or login credentials for. Set up the report parameters if needed.
1. The initialization should look like the following: 

	````JavaScript
$("#reportViewer1")
		.telerik_ReportViewer({
			reportServer: {
				url: "https://yourReportServerUrl:port",
				getPersonalAccessToken: function() {
					return Promise.resolve("<personal-access-token>");
				}
			},
			reportSource: {
				// The report value should contain the Category and ReportName in the following format
				// {Category/ReportName}
				report: "Samples/Dashboard"
				parameters: {
					ReportYear: 2004
				}
			}
		});
````


1. Run the project, and you should see the report configured in the previous step appearing in the Report Viewer.

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
* [How To: Use HTML5 Report Viewer With REST Service]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%})
* [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview)
* [Tokens Authentication in Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/token-authentication) 
