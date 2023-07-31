---
title: Setting up in Blazor Applications
page_title: How to integrate the Web Report Designer in Blazor Projects
description: "Learn how to set up the Telerik Web Report Designer and the required REST Services in a Blazor application."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-blazor-application
tags: how,to,set,up,in,blazor,wasm,webassembly,server,application
published: True
position: 2
previous_url: /how-to-blazor-web-report-designer
---

# How to set up in Blazor application

> The following article guides you how to use the Blazor Web Report Designer in a [Blazor](https://dotnet.microsoft.com/apps/aspnet/web-apps/blazor) web application.

## Prerequisites

* [Visual Studio 2019, version 16.4 or later](https://www.visualstudio.com/vs/)
* Existing ASP.NET Core 3.1, .NET 5, .NET 6 or .NET 7 Blazor Server or WebAssembly application
* The designer consumes reports generated and served from a running REST Service. Such can be referenced from another application or it can be hosted locally in the Blazor application as described below.

## Adding the Report Designer REST service and configuration

>note If Blazor WebAssembly project is used, this section's steps should be implemented in a separate ASP.NET Core Web API project because the service runs on the server and Blazor WebAssembly is strictly client-side - [`Hosting Reports Service in ASP.NET Core in .NET 6 with Top-Level Statements Explained`]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api%})

1. Use NuGet package manager to add the `Telerik.WebReportDesigner.Services` package. This will also resolve other dependencies automatically. For more information, see [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).
1. Add required settings in the Startup.cs file.The `ConfigureServices` method inside the `Startup.cs` in the project should be modified in order to enable the Web Report Designer REST service. Make sure the application is configured for WebAPI controllers and call the `AddNewtonsoftJson` to enable the required NewtonsoftJson serialization:

	````CSharp
public void ConfigureServices(IServiceCollection services)
	{
		services.AddControllers();
		services.AddRazorPages()
		 .AddNewtonsoftJson();
		services.AddServerSideBlazor();
	 ...
````


1. Add the required services in the __ConfigureServices__ method. The sample configuration below uses the `Reports` folder in the `WebRootPath` to open and save report definitions. It is required to create the `Reports` folder manually under `wwwroot` and optionally add some report definitions inside.

	````CSharp
...
	services.TryAddSingleton<IReportServiceConfiguration>(sp => new ReportServiceConfiguration
	{
		ReportingEngineConfiguration = sp.GetService<IConfiguration>(),
		HostAppId = "BlazorWebReportDesignerDemo",
		Storage = new FileStorage(),
		ReportSourceResolver = new UriReportSourceResolver(Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath, "Reports"))
	});
	services.TryAddSingleton<IReportDesignerServiceConfiguration>(sp => new ReportDesignerServiceConfiguration
	{
		DefinitionStorage = new FileDefinitionStorage(Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath, "Reports")),
		SettingsStorage = new FileSettingsStorage(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Telerik Reporting")),
		ResourceStorage = new ResourceStorage(Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath, "Resources")),
		SharedDataSourceStorage = new FileSharedDataSourceStorage(Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath, "Reports", "Shared Data Sources")),
	});
	...
````


1. Make sure the endpoints configuration inside the `Configure` method of the `Startup.cs` are configured for API controllers by adding the following line in the lambda expression argument:

	````CSharp
app.UseEndpoints(endpoints =>
	{
		endpoints.MapControllers();
		...
	});
````


1. If not already present, add this line to the __Configure__ method of the `Startup.cs` to assure that the application can serve static files: 

	````CSharp
app.UseStaticFiles();
````


1. Implement a Report Designer controller. Add a `Controllers` folder to the application and right-click on it to add a new __Web API Controller Class__ item. Name it *ReportDesignerController*. This will be the Telerik Web Report Designer REST service in the project.

	````CSharp
using Microsoft.AspNetCore.Mvc;
	using Telerik.Reporting.Services;
	using Telerik.WebReportDesigner.Services;
	using Telerik.WebReportDesigner.Services.Controllers;
	[Route("api/reportdesigner")]
	[ApiController]
	public class ReportDesignerController : ReportDesignerControllerBase
	{
		public ReportDesignerController(IReportDesignerServiceConfiguration reportDesignerServiceConfiguration, IReportServiceConfiguration reportServiceConfiguration)
			: base(reportDesignerServiceConfiguration, reportServiceConfiguration)
		{
		}
	}
````


## Adding the Blazor Web Report Designer component

1. Add NuGet package reference to the `Telerik.WebReportDesigner.Blazor` package hosted on the Progress Telerik proprietary NuGet feed. Make sure you have the needed NuGet feed added to VS setting using the article [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).
1. Add JavaScript dependencies to the __head__ element of the `Pages/_Host.cshtml` (Blazor Server) or `wwwroot/index.html` (Blazor WebAssembly):

	````HTML
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.all.min.js"></script>
	<script src="/api/reportdesigner/resources/js/telerikReportViewer"></script>
	<script src="/api/reportdesigner/designerresources/js/webReportDesigner/"></script>
````


1. Add [Telerik Kendo UI Sass-Based Themes](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes) to the __head__ element of the `Pages/_Host.cshtml` (Blazor Server) or `wwwroot/index.html` (Blazor WebAssembly). The Razor syntax for a server application differs and you need to escape the `@` symbol as `@@`:

	````HTML
<link rel="stylesheet" href="https://unpkg.com/@progress/kendo-theme-default@latest/dist/all.css" />
````


1. Add the dedicated `telerikWebReportDesignerInterop.js` dependency at the end of the __body__ element of the `Pages/_Host.cshtml` (Blazor Server) or `wwwroot/index.html` (Blazor WebAssembly):

	````HTML
<script src="_content/Telerik.WebReportDesigner.Blazor/telerikWebReportDesignerInterop.js" defer></script>
	@* Or this one if using the Telerik.WebReportDesigner.Blazor.Trial package *@
	@*<script src="_content/Telerik.WebReportDesigner.Blazor.Trial/telerikWebReportDesignerInterop.js" defer></script>*@
````


1. Use the following snippet to place the designer component in a razor page like `Pages/Index.razor`.

	````HTML
@page "/"
	@using Telerik.WebReportDesigner.Blazor
	<style>
		#wrd1 {
			position: relative;
			width: 1300px;
			height: 880px;
			padding-right: 50px;
		}
	</style>
	@* Create the WebReportDesignerWidget *@
	<WebReportDesigner DesignerId="wrd1"
				ServiceUrl="/api/reportdesigner"
				Report="SampleReport.trdp"
				ReportViewerOptions="@(new ReportViewerOptions() {
					templateUrl = "api/reportdesigner/resources/templates/telerikReportViewerTemplate.html",
					scaleMode = ScaleMode.Specific,
					scale = 1.0,
					pageMode = PageMode.ContinuousScroll,
					viewMode = ViewMode.Interactive
				})"
				ToolboxArea="new ToolboxAreaOptions() { Layout = ToolboxAreaLayout.List }"
				PropertiesArea="new PropertiesAreaOptions() { Layout = PropertiesAreaLayout.Categorized }" />
````


1. The __Report__ option will instruct the designer to look for *SampleReport.trdp* inside `wwwroot/Reports` on first load. You can create this report definition in the folder or omit the __Report__ option above. Finally, run the project.
