---
title: Setting up in .NET
page_title: Embedding the Web Report Designer in .NET 8+
description: "Learn how to set up the Telerik Web Report Designer in .NET 8 and higher applications via the Visual Studio Item Templates or Manually."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-5-and-.net-core-3.1-applications
tags: how,to,set,up,in,.net,8,applications
published: True
reportingArea: WRDHTML5, WRDRestServiceCore
position: 1
previous_url: /web-report-designer-setup-in-net-core3,/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-5-and-.net-core-3.1-applications
---

# Setting up the Web Report Designer in .NET applications

This article shows how to integrate our [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) in `.NET {{site.mindotnetversion}}+` applications.

The quickest way to add the web report designer to a web project is with the __Telerik Web Report Designer__ item template in Visual Studio. The item template is compatible with projects targetting `.NET {{site.mindotnetversion}}+`. The item template adds a page with the Web Report Designer and, if needed, enables the Web Report Designer REST Service. To start the item template wizard, in Visual Studio `Solution Explorer`, select the target project. On the Project menu, click `Add` -> `New Item`. In the Add New Item search box enter "*Telerik Web Report Designer*" and select the item template which corresponds to your project type.

For full control, instead of using the item template, you can manually configure the REST service and add the web report designer as elaborated in the rest of this article.

## Prerequisites

1. Create a sample ASP.NET Core Project targeting .NET {{site.mindotnetversion}}+ or higher. It may be an empty Web project or a Web API project.
1. Add the required dependencies:

	* `Telerik.WebReportDesigner.Services`
	* `Telerik.Reporting.Services.AspNetCore`
	* `Telerik.Reporting.JsonSerialization`
	* `Telerik.Reporting`

When you use NuGet packages, you may add only the `Telerik.WebReportDesigner.Services` package as it depends on the rest of the required Telerik Reporting assemblies, so they will be added automatically. Their dependencies will also be resolved automatically. For more information, see [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).

If you don't use NuGet packages, along with the above assemblies, you need to add all their dependencies manually to the project.

>note If you need to enable users to export reports in Office OpenXML document formats (XLSX, DOCX, and PPTX), you must install the [DocumentFormat.OpenXML](https://www.nuget.org/packages/DocumentFormat.OpenXml/) and `the Telerik.Reporting.OpenXmlRendering` NuGet packages. For more information about the required package versions, see [Deploying Open XML]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}#deploying-open-xml).

## Add Required Settings in the `Startup.cs` file

>note Some of the Visual Studio template projects, like the .NET {{site.mindotnetversion}}+ Web API project, have the required settings already added by default. In the empty .NET Web projects, you may need to add manually the settings.

1. The `ConfigureServices` method inside the `Startup.cs` in the project should be modified in order to enable the Web Report Designer Service functionality. Make sure the application is configured for WebAPI controllers and call the [`AddNewtonsoftJson`](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.dependencyinjection.newtonsoftjsonmvcbuilderextensions.addnewtonsoftjson?view=aspnetcore-7.0) to place the __NewtonsoftJson__ serialization:

	````CSharp
services.AddControllers().AddNewtonsoftJson();
````


1. Make sure the endpoints configuration inside the `Configure` method of the `Startup.cs` are configured for API controllers by adding the following line in the lambda expression argument:

	````CSharp
app.UseEndpoints(endpoints =>
	{
		endpoints.MapControllers();
	});
````


1. Assure that the app configuration inside the `Configure` method of the `Startup.cs` can serve static files:

	````CSharp
app.UseStaticFiles();
````


## Add Configuration Settings in the Startup.cs file

The report generation engine can retrieve Sql Connection Strings and specific Report Generation Engine Settings that provide flexibility for the deployed application. It utilizes the [IConfiguration interface](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-7.0) for this purpose.

The ASP.NET Core applications use a [key-value JSON-based](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-7.0) file named by default `appSettings.json`. The default ReportingEngineConfiguration:

````CSharp
ReportingEngineConfiguration = sp.GetService<IConfiguration>()
````

will be initialized from `appSettings.json` or `appsettings.{EnvironmentName}.json`.

To activate JSON file configuration with a different name, for example, `reportingAppSettings.json`, call the [AddJsonFile](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.jsonconfigurationextensions.addjsonfile?view=dotnet-plat-ext-7.0) extension method on an instance of [ConfigurationBuilder](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.configurationbuilder?view=dotnet-plat-ext-7.0). Here are the exact steps to follow:

1. Add a new `ResolveSpecificReportingConfiguration` class as a separate file or in the `Startup.cs` file

	````CSharp
static IConfiguration ResolveSpecificReportingConfiguration(IWebHostEnvironment environment)
	{
		var reportingConfigFileName = System.IO.Path.Combine(environment.ContentRootPath, "reportingAppSettings.json");
		return new ConfigurationBuilder()
		 .AddJsonFile(reportingConfigFileName, true)
		 .Build();
	}
````


1. Add the required services in the `ConfigureServices` method 

	````CSharp
public void ConfigureServices(IServiceCollection services)
	{
		services.AddControllers().AddNewtonsoftJson();
		services.TryAddSingleton<IReportServiceConfiguration>(sp =>
			new ReportServiceConfiguration
			{
				ReportingEngineConfiguration = ResolveSpecificReportingConfiguration(sp.GetService<IWebHostEnvironment>()),
				HostAppId = "ReportingCoreApp",
				Storage = new FileStorage(),
				ReportSourceResolver = new TypeReportSourceResolver().AddFallbackResolver
									   (new UriReportSourceResolver(Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath,  "Reports")))
			});
		services.TryAddSingleton<IReportDesignerServiceConfiguration>(sp => new ReportDesignerServiceConfiguration
		{
			DefinitionStorage = new FileDefinitionStorage(Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath, "Reports"), new[] { "Resources", "Shared Data Sources" }),
			ResourceStorage = new ResourceStorage(Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath, "Reports", "Resources")),
			SharedDataSourceStorage = new FileSharedDataSourceStorage(Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath, "Reports", "Shared Data Sources")),
				SettingsStorage = new FileSettingsStorage(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Telerik Reporting"))
		});
	}
````


## Setting up the Report Designer REST service:

The REST service works as a backend and is responsible for storage operations like creating, opening, or saving report definitions. The following steps describe how to configure it: 

1. Make sure that a key-value JSON-based file is available in your project and add the required [configuration settings in it]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}#json-based-configuration), for example, the `ConnectionStrings`.
1. Implement a Report Designer controller. Right-click on the `Controllers` folder and add a new item: Add > New item... > __Web API Controller Class__ item. Name it ReportDesignerController. This will be our Telerik Web Report Designer REST service in the project.
1. Inherit the [`ReportDesignerControllerBase`](/api/Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase) type and inject the required configuration settings in the constructor. Along with the [`ReportServiceConfiguration`](/api/telerik.reporting.services.reportserviceconfiguration) there is another configuration instance named [`ReportDesignerServiceConfiguration`](/api/Telerik.WebReportDesigner.Services.ReportDesignerServiceConfiguration), which will initialize the definition storage. This is the class responsible for opening, saving, etc. the report definitions. This is how a basic implementation of the controller should look like:

	````CSharp
namespace CSharp.AspNetCoreDemo.Controllers
	{
		using Microsoft.AspNetCore.Mvc;
		using Telerik.Reporting.Services;
		using Telerik.WebReportDesigner.Services;
		using Telerik.WebReportDesigner.Services.Controllers;
		[Route("api/reportdesigner")]
		public class ReportDesignerController : ReportDesignerControllerBase
		{
			public ReportDesignerController(IReportDesignerServiceConfiguration reportDesignerServiceConfiguration, IReportServiceConfiguration reportServiceConfiguration)
				: base(reportDesignerServiceConfiguration, reportServiceConfiguration)
			{
			}
		}
	}
````


1. To ensure the service operates, run the application and navigate to URL `{applicationRoot}/api/reportdesigner/cultureContext`. It should return a JSON representing the separators determined by the current culture, for example:

	````JavaScript
{"decimalSeparator":".","listSeparator":","}
````


## Adding the Web Report Designer:

1. Add TRDP or TRDX report definitions in the dedicated folder, specified in the DefinitionStorage and `UriReportSourceResolver` of the services configurations. In the sample code, this is

	````CSharp
Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath, "Reports")
````

	and corresponds to the folder *Reports* in the *wwwroot* folder. Add the latter to the main application folder if it doesn't exist. You may add to the *Reports* folder one of our demo reports that can be found by default in *{Telerik Reporting installation path}\Report Designer\Examples*.

1. Add a new HTML Page for the Web Report Designer by right-clicking on *wwwroot* and __Add > New Item... > HTML Page__. Name the file `index.html`. Add the required references to load the font, jQuery, Telerik Kendo UI libraries, telerikReportViewer, and webReportDesigner scripts listed in the example below. Finally, add the initialization of the telerik_WebReportDesigner widget. Note that the Web Report Designer container has a minimum width of 1200px. The complete report viewer page should look like this:

	````HTML
<!DOCTYPE html>
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Telerik Web Report Designer</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<link href="https://fonts.googleapis.com/css?family=Roboto:400,500&display=swap" rel="stylesheet">
	</head>
	<body>
		<div id="webReportDesigner">
			loading...
		</div>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.all.min.js"></script>
		<script src="/api/reportdesigner/resources/js/telerikReportViewer/"></script>
		<script src="/api/reportdesigner/designerresources/js/webReportDesigner/"></script>
		<script type="text/javascript">
			$(document).ready(function () {
				$("#webReportDesigner").telerik_WebReportDesigner({
					toolboxArea: {
						layout: "list" // Change to "grid" to display the contents of the Components area in a flow grid layout.
					},
					serviceUrl: "/api/reportdesigner",
					report: "Barcodes Report.trdp"
				}).data("telerik_WebDesigner");
			});
		</script>
	</body>
	</html>
````

	The `kendo.all.min.js` script from the Kendo CDN includes all Kendo UI for jQuery components and requires a valid Kendo UI license, which may display license warnings. To avoid this, Telerik Reporting includes a license-free subset containing only the Kendo UI components required by the Web Report Designer. You can copy this file from your installation directory at `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportDesigner\js\webReportDesigner.kendo-{{site.buildversion}}.min.js` and reference it locally in your project instead of the CDN version.

1. To set up the `index.html` as a startup page check [Make index.html as startup file in ASP.NET Core](https://www.talkingdotnet.com/make-index-html-startup-file-in-aspnet-core/). Then, change the _launchUrl_ to _index.html_ in `launchSettings.json`.
1. Finally, run the project to preview the web designer.

## Examples

You may find the complete example setup of the Web Report Designer in the _Html5IntegrationDemo_ project for the corresponding target framework deployed with the installation of the product. The default installation folder is `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp`.

## See Also

* [Configure Web Report Designer and Create a Basic Report]({%slug telerikreporting/getting-started/web-designer/set-up-and-create-basic-report%})
* [YouTube video tutorial Getting Started with the Web Report Designer: Part 1](https://www.youtube.com/watch?v=L-utkcB8-5c)
