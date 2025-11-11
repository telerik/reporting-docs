---
title: Using with Report Server for .NET
page_title: Using Native Blazor Report Viewer with Telerik Report Server for .NET
description: "Learn how to configure and use the Telerik Reporting Native Blazor Report Viewer with a Telerik Report Server for .NET instance."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-with-report-server-net
tags: how, to, use, native, blazor, report, viewer, server, webassembly, hybrid, report, server, net
published: True
reportingArea: NativeBlazor
position: 2
---

# Using the Native Blazor Report Viewer with the Report Server for .NET

The article explains how to set up the Native Blazor Report Viewer to work with the Telerik Report Server for .NET. 

The user account that will authenticate with the Report Server may be any User, including the Guest User, provided there is an enabled Token in its [Tokens](https://docs.telerik.com/report-server/dotnet-docs/token-authentication) collection.

## Prerequisites

* Existing .NET {{site.mindotnetversion}} and higher Blazor Server App or .NET {{site.mindotnetversion}} and higher hosted Blazor WebAssembly App.
* Review the Native Blazor Report Viewer [Requirements]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}#Requirements).
* Installed and running [Telerik Report Server for .NET](https://docs.telerik.com/report-server/dotnet-docs/overview).
* Report Server for .NET's User that will connect from the viewer should have at least one enabled Token.
* Report Server for .NET should contain at least one report that can be accessed by the User account.

## Configuring the Native Blazor Report Viewer to work with the Report Server for .NET

1. Add NuGet package reference to the __Telerik.ReportViewer.BlazorNative__ package hosted on the Progress Telerik proprietary NuGet feed. Ensure that the Telerik NuGet feed is added to the NuGet Package Sources by following [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).
1. (Optional) The [Native Blazor Report Viewer]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) depends on version **9.1.0** of the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) product. If [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) is already used in your Blazor application, this step can be skipped. Otherwise, add the [Telerik UI for Blazor](https://www.telerik.com/blazor-ui) JS and its [Kendo theme](https://www.telerik.com/design-system/docs/themes/get-started/introduction/) dependencies to the __head__ element of the __Pages/_Layout.cshtml__ (Blazor Server) or __wwwroot/index.html__ (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App):

	````HTML
<script src="_content/Telerik.UI.for.Blazor/js/telerik-blazor.js" defer></script>

	@* The version of the Kendo Utils should be updated according to the version of the Kendo theme used by the Telerik UI for Blazor package. *@
	@* The version of the Kendo Theme can be seen in the release notes of the Telerik UI for Blazor version - https://www.telerik.com/support/whats-new/blazor-ui/release-history. *@
	<link rel="stylesheet" href="https://kendo.cdn.telerik.com/themes/10.0.1/utils/all.css" />
	<link rel="stylesheet" href="_content/Telerik.UI.for.Blazor/css/kendo-theme-default/all.css" />
	<link rel="stylesheet" href="_content/Telerik.UI.for.Blazor/css/kendo-font-icons/font-icons.css" />
````


1. Add the  [Native Blazor Report Viewer's]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%}) JS and CSS dependencies to the __head__ element of the __Pages/_Layout.cshtml__ (Blazor Server) or __wwwroot/index.html__ (Blazor WebAssembly), or `Components/App.razor` (Blazor Web App).

	````HTML
<link href="_content/Telerik.ReportViewer.BlazorNative/css/reporting-blazor-viewer.css" rel="stylesheet" />
<script src="_content/Telerik.ReportViewer.BlazorNative/js/reporting-blazor-viewer.js"></script>
````


1. Configure the project to recognize all Telerik components without explicit __@using__ statements on every __.razor__ file by adding the following code to your __~/_Imports.razor__:

	````C#
@using Telerik.Blazor
	@using Telerik.Blazor.Components
	@using Telerik.ReportViewer.BlazorNative
````


1. Wrap the content of the main layout file(by default, the __~/Shared/MainLayout.razor__ file in the Blazor project) with a razor component called __TelerikLayout.razor__:

	````HTML
@inherits LayoutComponentBase

	<TelerikRootComponent>
		@Body
	</TelerikRootComponent>
````


1. Set up an endpoint on the server that will securely return the token used by the Report Server for .NET to authorize. For example, create an environment variable in the `launchSettins.json` file named **'RS_NET_TOKEN**, and store the token in it. Then, the endpoint can be configured to read and return the value of the environment variable:

	````C#
app.MapGet("/rs-token", () =>
	{
		return Environment.GetEnvironmentVariable("RS_NET_TOKEN") ?? string.Empty;
	})
	.RequireAuthorization();
````

	For Blazor Web Assembly applications where the server is not available, the token can be injected on the `.RAZOR` page at build-time. Use `appsettings.{Environment}.json` files (they are bundled at build time), and read the token from the configuration.

1. Configure an `HttpClient` in the `Program.cs` file that will be injected on the `.RAZOR` page on the next step when we make an HTTP request to get the token from the server.

	````C#
builder.Services.AddHttpClient();
````


1. Create a method in the `RAZOR` or `RAZOR.CS` file of the Blazor component that returns a `Task<string>` with the token retrieved from the Report Server:

	````C#
@inject HttpClient Http
	@inject NavigationManager Nav
	
	@code {
		private string? _cachedRsToken;
		private static readonly SemaphoreSlim _tokenLock = new(1, 1);
		
		// /rs-token returns plain text: token
		async Task<string> GetRsNetAccessToken()
		{
			if (_cachedRsToken is not null)
				return _cachedRsToken;
		
			await _tokenLock.WaitAsync();
			try
			{
				if (_cachedRsToken is not null) // double-check after lock
					return _cachedRsToken;
		
				var uri = Nav.ToAbsoluteUri("/rs-token");
				try
				{
					var raw = await Http.GetStringAsync(uri);
					_cachedRsToken = raw?.Trim() ?? string.Empty;
				}
				catch (Exception)
				{
					_cachedRsToken = string.Empty;
				}
			}
			finally
			{
				_tokenLock.Release();
			}
		
			return _cachedRsToken;
		}
	}
````


1. Use the `ReportServerSettings` fragment to provide the URL to the Report Server for .NET, and the `GetRsNetAccessToken` function that the Native Blazor Report Viewer will execute internally to retrieve the token.

	````CSHTML
<ReportViewer 
		@bind-ReportSource="@ReportSource"
		ServiceType="@ReportViewerServiceType.ReportServer"
		Height="800px"
		Width="100%">
	<ReportViewerSettings>
		<ReportServerSettings Url="http://yourreportserver:port/" GetPersonalAccessToken="GetRsNetAccessToken" ></ReportServerSettings>
	</ReportViewerSettings>
</ReportViewer>
````


1. Finally, run the project to see the rendered report.

## See Also

* [Integration with Telerik Reporting](https://docs.telerik.com/blazor-ui/integrations/reporting)
* [Native Blazor Report Viewer Overview]({%slug telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
