---
title: Using with Report Server for .NET
page_title: Connect the Telerik Reporting Blazor Report Viewer with Report Server for .NET
description: "Learn how the Telerik Reporting Blazor HTML5 Report Viewer can work with the Report Server for .NET."
slug: use-blazor-report-viewer-with-rs-net
tags: use,blazor,report,viewer,rsnet
published: True
reportingArea: BlazorWrapper
position: 5
---

# Connecting the Blazor Report Viewer with the Report Server for .NET

> The following article will guide you on [how to use the Blazor Report Viewer](https://www.telerik.com/blogs/embed-reporting-everywhere) in a web application and connect it to the [Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview).

## Prerequisites

* [Visual Studio 2019+](https://visualstudio.microsoft.com/vs/)
* Existing .NET {{site.mindotnetversion}} and higher Blazor Server App or .NET {{site.mindotnetversion}} and higher hosted Blazor WebAssembly App
* An installed and running [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview).
* Report Server for .NET's User that will connect from the viewer should have at least one enabled [Token](https://docs.telerik.com/report-server/dotnet-docs/token-authentication).
* Report Server for .NET should contain at least one report that can be accessed by the User account.

## Adding the Blazor Report Viewer component using an item template

The Blazor Report Viewer item template allows you to quickly [add the Blazor Report Viewer](https://www.telerik.com/blogs/telerik-reporting-modern-ui-report-viewer-demo) and [embed the Blazor Report Viewer](https://www.telerik.com/blogs/telerik-reporting-sdk-report-server-dynamic-duo) to your application.

Make sure that you select __Blazor Report Viewer page__, instead of __HTML5 Report Viewer page__ when adding a new item to your project, and follow the steps in the __'Add new Report Viewer'__ dialog.

Refer to the [Configuring the HTML5 Report Viewer to work with Report Server using Item Templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%}#configuring-the-html5-report-viewer-to-work-with-report-server-using-item-templates) section in the [How to Use HTML5 Report Viewer with Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-report-server%}) documentation article, again, making sure that you select the __Blazor Report Viewer page__ in the [Add New Item](https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2010/w0572c5b(v=vs.100)) dialog box.

After creating the Blazor Report Viewer, we need some manual adjustments to make it work with the Report Server for .NET as explained in the section [Connect to the Report Server for .NET instance](#connect-to-the-report-server-for-net-instance).

## Adding the Blazor Report Viewer component manually

1. Add NuGet package reference to the `Telerik.ReportViewer.Blazor` package hosted on the Progress Telerik proprietary NuGet feed. Make sure you have the needed NuGet feed added to the Visual Studio setting using the article [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).
1. Make sure app configuration inside the `Configure` method of the `Startup.cs`(or `Program.cs` if .NET {{site.mindotnetversion}}+ is used) can serve static files:

	````CSharp
app.UseStaticFiles();
````


1. Add JavaScript dependencies to the `head` element of the `Pages/_Host.cshtml` (Blazor Server) or `wwwroot/index.html` (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App): 

	````HTML
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://yourReportServerUrl:port/api/reports/resources/js/telerikReportViewer"></script>
````


1. Add a [Telerik Kendo UI SASS-Based Theme](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) to the `head` element of the `Pages/_Host.cshtml` (Blazor Server) or `wwwroot/index.html` (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App). The Razor syntax for a server application differs and you need to escape the __@__ symbol as __@@__:

	````HTML
<link href="https://kendo.cdn.telerik.com/themes/10.2.0/default/default-ocean-blue.css" rel="stylesheet" />
````


1. Add the dedicated `interop.js` dependency at the end of the `body` element of the `Pages/_Host.cshtml` (Blazor Server) or `wwwroot/index.html` (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App):

	````HTML
<script src="_content/Telerik.ReportViewer.Blazor/interop.js" defer></script>
````


## Connect to the Report Server for .NET instance

The Report Server for .NET provides two approaches for authenticating from the Telerik Report Viewers. We strongly recommend using the __Token authentication__ as more secure.

### Token Authentication

>tip This is the __recommended__ approach.

Use the following snippet to place the viewer component in a Razor page like `Pages/Index.razor`:

````CSHTML
@page "/"
@* For Blazor Web Apps, an interactive render mode should be used, for example: *@
@* @rendermode InteractiveServer *@
@using Telerik.ReportViewer.Blazor
<style>
	#rv1 {
		position: relative;
		width: 1200px;
		height: 600px;
	}
</style>
<ReportViewer ViewerId="rv1"
			  ReportServer="@(new ReportServerOptions {  Url = "https://yourReportServerUrl:port", GetPersonalAccessToken="trvCallbacks.getPersonalAccessToken" })"
			  ReportSource="@(new ReportSourceOptions()
							  {
									Report = "Published/Dashboard"
							  })"
			  ScaleMode="@(ScaleMode.Specific)"
			  Scale="1.0" />
````

>caution The `serviceUrl` option shouldn't be present, or the viewer would default to no authentication scheme utilizing the Report Server for .NET as a regular Reporting REST Service.

Substitute the `https://yourReportServerUrl:port` with the actual url of your Report Server for .NET instance, along with the port if needed.

The `GetPersonalAccessToken` option should be set to a function returning the Token of the User who is logging in to the Report Server for .NET wrapped in a [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise). Here is a sample implementation that relies on a dedicated secure endpoint '/rs-token' to return the token:

````JavaScript
window.trvCallbacks = {
	getPersonalAccessToken: function () {
		return fetch('/rs-token')
			.then(response => response.text())
	}
}
````

Server-side, you may configure the endpoint '/rs-token', as shown below, after ensuring the environment variable "RS_NET_TOKEN" is set up correctly. We strongly recommend securing the endpoint:

````C#
app.MapGet("/rs-token", (HttpContext context) =>
{
	return Environment.GetEnvironmentVariable("RS_NET_TOKEN") ?? string.Empty;
})
.RequireAuthorization();
````

### Username and Password Authentication

>caution Avoid this approach for security reasons.

If you prefer to use hardcoded credentials, use the following snippet to place the viewer component in a Razor page like `Pages/Index.razor`.

````CSHTML
@page "/"
@* For Blazor Web Apps, an interactive render mode should be used, for example: *@
@* @rendermode InteractiveServer *@
@using Telerik.ReportViewer.Blazor
<style>
	#rv1 {
		position: relative;
		width: 1200px;
		height: 600px;
	}
</style>
<ReportViewer ViewerId="rv1"
			  ReportServer="@(new ReportServerOptions {  Url = "https://yourReportServerUrl:port", Username = "demouser", Password = "demopass" })"
			  ReportSource="@(new ReportSourceOptions()
							  {
									Report = "Published/Dashboard"
							  })"
			  ScaleMode="@(ScaleMode.Specific)"
			  Scale="1.0" />
````

>caution The __Guest User__ may connect to the Report Server for .NET only with a __Token__. It doesn't have a password and cannot connect to the Report Server for .NET with Null credentials, as the Report Server for .NET Framework 4.6.2.

## See Also

* [Report Server for .NET Introduction](https://docs.telerik.com/report-server/dotnet-docs/overview)
* [Configuring the Report Server for .NET for Authentication with JWT Tokens](https://docs.telerik.com/report-server/dotnet-docs/token-authentication)
* [Integrating the Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/how-to-use-blazor-report-viewer%})
* [Blazor Integration with Telerik Reporting](https://docs.telerik.com/blazor-ui/integrations/reporting) documentation article.

