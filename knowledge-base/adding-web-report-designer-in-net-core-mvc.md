---
title: Adding Telerik Web Report Designer in ASP.NET Core 3.1 MVC Project
description: "Learn how to add the Telerik Web Report Designer in ASP.NET Core 3.1 MVC project targeting .NET or .NET Core."
type: how-to
page_title: Adding Web Designer in ASP.NET Core MVC Project targeting .NET Core
slug: adding-web-report-designer-in-net-core-mvc
ticketid: 1478336
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.1.20.618</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>.NET Framework</td>
			<td>.NET Core 3.1</td>
		</tr>
	</tbody>
</table>

## Description

This KB article lists all necessary steps for integrating our [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) in .NET Core MVC 3.1 project.

It is based on the following articles:

- [How To Host Reports Service In ASP.NET Core 3+]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1%})
- [How to Set Up the WebReportDesigner in .NET Core Applications]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-core-2.1+-application%}).

The same approach can be applied for `.NET Core MVC 3.0` project.

## Solution

1. Add the following NuGet packages:
   - `Telerik.Reporting.Services.AspNetCore`
   - `Telerik.WebReportDesigner.Services`
   - `Microsoft.AspNetCore.Mvc.NewtonsoftJson`

1. Add a folder with the `TRDP` / `TRDX` reports.
1. Add the `ReportDesignerController`:

   ```C#
   namespace WebApplication1.Controllers
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
   ```

1. Add a new class named `ConfigurationHelper`:

   ```C#
   using Microsoft.AspNetCore.Hosting;
   using Microsoft.Extensions.Configuration;

   namespace WebApplication1
   {
   	static class ConfigurationHelper
   	{
   		public static IConfiguration ResolveConfiguration(IWebHostEnvironment environment)
   		{
   			var reportingConfigFileName = System.IO.Path.Combine(environment.ContentRootPath, "appsettings.json");
   			return new ConfigurationBuilder()
   				.AddJsonFile(reportingConfigFileName, true)
   				.Build();
   		}
   	}
   }
   ```

1. Add the required configurations in the `Startup.cs` from [Set Up the Startup.cs File for the Reports Service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1 %}#setup-the-startup-cs-file-for-the-reports-service):

   ```C#
   public class Startup
   {
   	public Startup(IConfiguration configuration)
   	{
   		Configuration = configuration;
   	}

   	public IConfiguration Configuration { get; }

   	// This method gets called by the runtime. Use this method to add services to the container.
   	public void ConfigureServices(IServiceCollection services)
   	{
   		services.AddControllersWithViews();
   		services.AddControllers();
   		services.Configure<IISServerOptions>(options =>
   		{
   			options.AllowSynchronousIO = true;
   		});
   		services.AddRazorPages()
   		.AddNewtonsoftJson();
   		// Configure dependencies for ReportsController.
   		services.TryAddSingleton<IReportServiceConfiguration>(sp =>
   			new ReportServiceConfiguration
   			{
   				ReportingEngineConfiguration = ConfigurationHelper.ResolveConfiguration(sp.GetService<IWebHostEnvironment>()),
   				HostAppId = "ReportingCore3App",
   				Storage = new FileStorage(),
   				ReportResolver = new ReportFileResolver(
   					System.IO.Path.Combine(sp.GetService<IWebHostEnvironment>().ContentRootPath, "Reports"))
   			});

   		services.TryAddSingleton<IReportDesignerServiceConfiguration>(sp => new ReportDesignerServiceConfiguration
   		{
   			DefinitionStorage = new FileDefinitionStorage(
   				Path.Combine(sp.GetService<Microsoft.AspNetCore.Hosting.IHostingEnvironment>().ContentRootPath, "Reports")),
   			SettingsStorage = new FileSettingsStorage(
   				Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Telerik Reporting"))
   		});
   	}

   	// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
   	public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
   	{
   		if (env.IsDevelopment())
   		{
   			app.UseDeveloperExceptionPage();
   		}
   		else
   		{
   			app.UseExceptionHandler("/Home/Error");
   		}

   		app.UseStaticFiles();
   		app.UseRouting();
   		app.UseAuthorization();
   		app.UseEndpoints(endpoints =>
   		{
   			endpoints.MapControllers();
   			endpoints.MapControllerRoute(
   				name: "default",
   				pattern: "{controller=Home}/{action=Index}/{id?}");
   		});
   	}
   }
   ```

1. The initialization of the designer has to look as follows:

   ```HTML
   <!DOCTYPE html>
   <html xmlns="http://www.w3.org/1999/xhtml">
   	<head>
   		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   		<link href="https://fonts.googleapis.com/css?family=Roboto:400,500&display=swap" rel="stylesheet">

   		<title>Telerik HTML5 Report Viewer Demo</title>

   		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
   		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
   	</head>
   	<body>
   		<div id="webReportDesigner">
   			loading...
   		</div>
   	</body>
   </html>

   @section scripts
   {
   	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
   	<script src="https://kendo.cdn.telerik.com/2020.1.114/js/kendo.all.min.js"></script>

   	<script src="/api/reports/resources/js/telerikReportViewer"></script>
   	<script src="api/reportdesigner/designerresources/js/webReportDesigner-14.1.20.618.min.js/"></script>

   	<script type="text/javascript">
   		$(document).ready(function () {
   			$("#webReportDesigner").telerik_WebReportDesigner({
   				toolboxArea: {
   					layout: "list" //Change to "grid" to display the contents of the Components area in a flow grid layout.
   				},
   				serviceUrl: "api/reportdesigner/",
   				report: "Barcodes Report.trdp"
   			}).data("telerik_WebDesigner");
   		});
   	</script>
   }
   ```

1. If you are using [SQL DataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview %}) with Named/Shared connection string, add the connection string in the `appsettings.json` file.

   Here is a sample for the MSSQL database:

   ```JSON
   "ConnectionStrings": [
   		{
   			"name": "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString",
   			"connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
   			"providerName": "System.Data.SqlClient"
   		}
   	]
   ```

## Demo Application

For the demo, refer to the [Reporting Samples GitHub repository](https://github.com/telerik/reporting-samples/tree/master/WRD%20in%20.NET%20Core%203.1%20MVC).
