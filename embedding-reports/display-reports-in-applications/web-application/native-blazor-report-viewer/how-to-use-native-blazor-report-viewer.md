---
title: Using in .NET
page_title: Integrating Native Blazor Report Viewer in Blazor Server or WebAssembly Application
description: "Learn how to configure and integrate the Native Blazor Report Viewer built on top of the Telerik UI for Blazor widgets in your Blazor Server or WebAssembly Application."
slug: telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-native-blazor-report-viewer
tags: how, to, use, native, blazor, report, viewer, server, webassembly
published: True
position: 1
---

# Using Native Blazor Report Viewer

The following article will guide you on how to use the new Native Blazor Report Viewer in a [Blazor](https://dotnet.microsoft.com/apps/aspnet/web-apps/blazor) web application.

## Prerequisites

* [Visual Studio 2019, version 16.4 or later](https://www.visualstudio.com/vs/)
* Existing ASP.NET Core 3.1 and higher Blazor Server App or ASP.NET Core 3.1 and higher hosted Blazor WebAssembly App
* The report viewer consumes reports generated and served from a running Reports Web Service. Such can be referenced from another application, or it can be hosted locally in a Blazor Server application
* Blazor WebAssembly applications are executed directly on the browser UI thread. In other words, Blazor WebAssembly are stictly client-side applications and the Reports Web Service cannot be hosted in the same project. When using Blazor WebAssembly, the Reports Web Service has to be hosted in a separate project. For more information, see [Blazor WebAssembly vs. Server](https://www.telerik.com/faqs/blazor-ui/what-is-the-difference-between-blazor-webassembly-vs-server). To host the Reporting Service locally, please follow the approach from either the [How to Host Reports Service in ASP.NET Core 3.1]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1%}) or the [Hosting the Reports Service in ASP.NET Core in .NET 6 and .NET 7 with Top-Level Statements]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api%}) articles.

## Adding the Native Blazor component

1. Add NuGet package reference to the __Telerik.ReportViewer.BlazorNative__ (or __Telerik.ReportViewer.BlazorNative.Trial__) package hosted on the Progress Telerik proprietary NuGet feed. Make sure you have the needed NuGet feed added to VS setting using the article [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).

1. Make sure app configuration inside the `Configure` method of the `Startup.cs` (or `Program.cs` if .NET 6+ with Top Level Statements is used) file can serve static files:

	````C#
app.UseStaticFiles();
````

	>note When it comes to Blazor WebAssembly applications, the above step should be implemented in the project used as the *Server* where the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) is located. With the [ASP.NET Core Hosted](https://learn.microsoft.com/en-us/aspnet/core/blazor/tooling?view=aspnetcore-7.0&pivots=windows) template, that would be the `Blazor.Server` project.

1. Add JavaScript and CSS dependencies to the __head__ element of the __Pages/_Layout.cshtml__ (Blazor Server) or __wwwroot/index.html__ (Blazor WebAssembly):

	````HTML
<script src="_content/Telerik.UI.for.Blazor/js/telerik-blazor.js" defer></script>

	<script src="_content/Telerik.ReportViewer.BlazorNative/js/reporting-blazor-viewer.js" defer></script>
	@* Or this one if using the Telerik.ReportViewer.Blazor.Trial package *@
	@* <script src="_content/Telerik.ReportViewer.BlazorNative.Trial/js/reporting-blazor-viewer.js" defer></script> *@

	<link href="_content/Telerik.ReportViewer.BlazorNative/css/reporting-blazor-viewer.css" rel="stylesheet" />
	@* Or this one if using the Telerik.ReportViewer.Blazor.Trial package *@
	@* <link href="_content/Telerik.ReportViewer.BlazorNative.Trial/css/reporting-blazor-viewer.css" rel="stylesheet" /> *@
````


1. Add [Telerik UI for Blazor Built-in Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes) to the __head__ element of the __Pages/_Layout.cshtml__ (Blazor Server) or __wwwroot/index.html__ (Blazor WebAssembly). The Razor syntax for a server application differs and you need to escape the __@__ symbol as __@@__:

	````HTML
<link rel="stylesheet" href="https://blazor.cdn.telerik.com/blazor/{{blazoruiversion}}/kendo-theme-default/all.css" />
````


1. You can set the project to recognize all Telerik components without explicit __@using__ statements on every __.razor__ file. To achieve this, add the following to your  __~/_Imports.razor__:

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


1. If using Reports web service (either locally hosted or in another application) use the following snippet to place the viewer component in a razor page like __Pages/Index.razor__. Note that when referencing the Reports service from another application the `ServiceUrl` setting should be the absolute URI to the service. Remember to set the actual __ReportSource__ along with eventual parameters:

	````CSHTML
@page "/"

	<PageTitle>Report Viewer</PageTitle>

	<ReportViewer
		ServiceType="@ReportViewerServiceType.REST"
		ServiceUrl="https://demos.telerik.com/reporting/api/reports"
		@bind-ReportSource="@ReportSource"
		@bind-ScaleMode="@ScaleMode"
		@bind-ViewMode="@ViewMode"
		@bind-ParametersAreaVisible="@ParametersAreaVisible"
		@bind-DocumentMapVisible="@DocumentMapVisible"
		@bind-Scale="@Scale">
	</ReportViewer>

	@code {
		public ScaleMode ScaleMode { get; set; } = ScaleMode.Specific;
		public ViewMode ViewMode { get; set; } = ViewMode.Interactive;
		public bool ParametersAreaVisible { get; set; }
		public bool DocumentMapVisible { get; set; }
		public double Scale { get; set; } = 1.0;

		public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Report Catalog.trdx", new Dictionary<string, object>
		{
			// Add parameters if applicable
		});
	}
````


1. If displaying reports from a Report Server instance use the following snippet to place the viewer component in a razor page like __Pages/Index.razor__. Remember to set the actual __ReportServer__ and __ReportSource__ settings:

	````CSHTML
@page "/"

	<PageTitle>Report Viewer</PageTitle>

	<ReportViewer 
		ServiceType="@ReportViewerServiceType.ReportServer" 
		@bind-ReportSource="@ReportSource"
		@bind-ScaleMode="@ScaleMode"
		@bind-ViewMode="@ViewMode"
		@bind-ParametersAreaVisible="@ParametersAreaVisible"
		@bind-DocumentMapVisible="@DocumentMapVisible"
		@bind-Scale="@Scale">
		<ReportViewerSettings>
			<ReportServerSettings Url="https://demos.telerik.com/report-server/" Username="demouser" Password="demopass"></ReportServerSettings>
		</ReportViewerSettings>
	</ReportViewer>

	@code {
		public ScaleMode ScaleMode { get; set; } = ScaleMode.Specific;
		public ViewMode ViewMode { get; set; } = ViewMode.Interactive;
		public bool ParametersAreaVisible { get; set; }
		public bool DocumentMapVisible { get; set; }
		public double Scale { get; set; } = 1.0;

		public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Published/Dashboard", new Dictionary<string, object>
		{
			// Add parameters if applicable
		});
	}
````


1. Use the rest of the parameters exposed on the Blazor viewer component to setup its appearance and behavior as desired.
1. Finally, run the project to see the rendered report.

Learn more about Blazor Reporting in [Integration with Telerik Reporting](https://docs.telerik.com/blazor-ui/integrations/reporting) documentation article.
