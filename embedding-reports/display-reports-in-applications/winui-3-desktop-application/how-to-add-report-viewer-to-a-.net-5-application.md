---
title: Using in a .NET 8 application
page_title: Integrating the WinUI Report Viewer in a .NET 8 application
description: "Learn how to start using the Telerik Reporting WinUI Report Viewer in .NET 8 applications with this tutorial."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/winui-3-desktop-application/how-to-add-report-viewer-to-a-.net-5-application
tags: how,to,add,winui,report,viewer,to,a,.net,8,application
published: True
position: 1
previous_url: /winui-report-viewer-how-to-add-in-net5-app
reportingArea: General
components: [general]
---

# Integrating the WinUI Report Viewer in .NET {{site.mindotnetversion}}

This article explains the steps needed to integrate the WinUI report viewer to a `.NET {{site.mindotnetversion}}` project.

## Prerequisites:

* Visual Studio 2022 or newer
* Windows 10 SDK 10.0.18362 or newer
* .NET {{site.mindotnetversion}} project

## Use the example projects as a reference

Since __R1 2023__, the examples we distribute along with our product contain two new projects: `CSharp.Net8.WinUIIntegrationDemo` and `CSharp.Net8.WinUIIntegrationDemo (Package)`. These projects are designed as a showcase of our WinUI report viewer and can be used as a reference when configuring the viewer in your own WinUI application.

The project `CSharp.Net8.WinUIIntegrationDemo.csproj` targets .NET 8 and contains the references to the necessary Nuget packages. This project also contains the XAML files that configure the application and the window that will host the ReportViewer control. The project `CSharp.Net8.WinUIIntegrationDemo.wapproj` is a Windows Application Packaging Project and specifies which project will be packed as `.appx` and loaded for execution.

These projects are not included in our `CSharp.ReportExamples.sln` file as the rest of the example projects, because building a WinUI application would require a specific configuration of the development machine and that might ruin the smooth "getting started" experience we want to deliver to our users. In order to run the WinUI example projects, make sure the prerequisites above are met and follow the steps below:

* Open Visual Studio and create a new solution.
* Add both projects __CSharp.Net8.WinUIIntegrationDemo__ and __CSharp.Net8.WinUIIntegrationDemo (Package)__ to the solution.
* Mark the __CSharp.Net8.WinUIIntegrationDemo (Package)__ as a startup project.
* Right-click on the __CSharp.Net8.WinUIIntegrationDemo (Package)__ and select __Deploy__ from the context menu.
* Once the deployment process has finished successfully, start the project. The hosting application should show a window containing the WinUI report viewer. By default, the report viewer will try to load the __Report Catalog__ report, located in the *{installation-directory}\Report Designer\Examples* folder.

## Configure Custom HTTP Headers for a REST Service

To send custom headers with REST Service requests, assign a `RestServiceConnectionInfo` instance with `HttpHeaders` set to the viewer's `ReportEngineConnectionInfo` property. You cannot store custom headers in the `ReportEngineConnection` string.

The following example adds tenant information and retrieves an authorization token asynchronously:

```CSharp
var connection = new RestServiceConnectionInfo("https://example.com/api/reports")
{
	HttpHeaders = new HttpHeadersOptions
	{
		Headers = new Dictionary<string, string>
		{
			{ "X-Tenant-Id", "tenant-42" }
		},
		GetHeadersAsync = async () =>
		{
			var token = await GetAccessTokenAsync();
			return new Dictionary<string, string>
			{
				{ "X-Tenant-Id", "tenant-42" },
				{ "Authorization", "Bearer " + token }
			};
		},
		RefreshInterval = 60
	}
};

reportViewer.ReportEngineConnectionInfo = connection;
reportViewer.RefreshReport();
```

`GetHeadersAsync` takes precedence over `Headers`. Return all required header values from the callback. Header callback results are cached for 300 seconds by default. Set `RefreshInterval` to another number of seconds, or set it to `0` to invoke the callback before every request.

Assign a new `HttpHeadersOptions` instance to `connection.HttpHeaders` when you change the options. Changes to the same options instance are not applied until you assign it again. A custom `Authorization` header takes precedence over the connection's token.

Custom headers apply to requests sent to the configured Reporting REST Service origin. They do not apply when the viewer connects to Report Server. Avoid redirects to another origin because they can forward custom headers to the destination.
