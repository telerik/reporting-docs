---
title: Integrate Telerik Reporting in ASP.NET Core 3.1 MVC Projects
page_title: Adding Telerik Reporting in ASP.NET Core MVC Projects targeting .NET
description: "Learn how to add Telerik Reporting in ASP.NET Core MVC projects targeting .NET or .NET Core in this step-by-step tutorial."
type: how-to
slug: adding-reporting-net-core-mvc
tags: telerik, reporting, add, in, asp, net, core, 3.1, mvc, projects
ticketid: 1454516
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.0.20.115</td>
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

How can I integrate a Telerik Report in a .NET Core MVC 3.1 project?

## Solution

The demonstrated approach to solve this issue is based on the [Host Reports Service In ASP.NET Core 3+]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1 %}) article.

You can also apply the same approach to .NET Core MVC 3.1 project.

1. Add the following `Telerik.Reporting.Services.AspNetCore` and `Microsoft.AspNetCore.Mvc.NewtonsoftJson` packages.
1. Add a folder with the reports.
1. Add the `ReportsController`:

   ```C#
   namespace WebApplication1.Controllers
   {
   	using Microsoft.AspNetCore.Mvc;
   	using System.Net;
   	using System.Net.Mail;
   	using Telerik.Reporting.Services;
   	using Telerik.Reporting.Services.AspNetCore;

   	[Route("api/reports")]
   	public class ReportsController : ReportsControllerBase
   	{
   		public ReportsController(IReportServiceConfiguration reportServiceConfiguration)
   			: base(reportServiceConfiguration)
   		{
   		}

   		protected override HttpStatusCode SendMailMessage(MailMessage mailMessage)
   		{
   			throw new System.NotImplementedException("This method should be implemented in order to send mail messages");

   			//using (var smtpClient = new SmtpClient("smtp01.mycompany.com", 25))
   			//{
   			//    smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
   			//    smtpClient.EnableSsl = false;

   			//    smtpClient.Send(mailMessage);
   			//}
   			//return HttpStatusCode.OK;
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

1. Add the required configurations in the `Startup.cs` from the [Set Up the Startup.cs File for the Reports Service]({% slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-3.1 %}#setup-the-startup-cs-file-for-the-reports-service) article:

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
   		services.AddRazorPages().AddNewtonsoftJson();
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

1. The view has to look as demonstrated in the following example:

   ```HTML
   <!DOCTYPE html>
   <html xmlns="http://www.w3.org/1999/xhtml">
   	<head>
   		<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>

   		<link href="https://kendo.cdn.telerik.com/2019.1.115/styles/kendo.common.min.css" rel="stylesheet" id="common-css" />
   		<link href="https://kendo.cdn.telerik.com/2019.1.115/styles/kendo.blueopal.min.css" rel="stylesheet" id="skin-css" />

   		<style>
   			body {
   				margin: 5px;
   				font-family: Verdana, Arial, sans-serif;
   			}

   			#reportViewer1 {
   				position: absolute;
   				left: 5px;
   				right: 5px;
   				top: 160px;
   				bottom: 5px;
   				overflow: hidden;
   				clear: both;
   			}
   		</style>

   		<title>Telerik HTML5 Report Viewer Demo</title>

   		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
   		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
   	</head>
   	<body>
   		<div id="reportViewer1">
   			loading...
   		</div>
   	</body>
   </html>

   @section scripts
   {
   	<script src="/api/reports/resources/js/telerikReportViewer"></script>

   	<script type="text/javascript">
   		$(document).ready(function () {
   			$("#reportViewer1")
   				.telerik_ReportViewer({
   					serviceUrl: "api/reports/",
   					reportSource: {
   						report: "Product Sales.trdp",
   						// Parameters name value dictionary
   						//parameters: {}
   					},
   					viewMode: telerikReportViewer.ViewModes.INTERACTIVE,
   					scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,
   					scale: 1.0,
   					enableAccessibility: false,
   					sendEmail: { enabled: true }
   				});
   		});
   	</script>
   }
   ```

1. If you are using an [SQL DataSource]({% slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview %}) with a Shared connection string, add a connection string in the `appsettings.json` file:

   ```JSON
   "ConnectionStrings": [
   	{
   		"name": "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString",
   		"connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
   		"providerName": "System.Data.SqlClient"
   	}
   ]
   ```

## See Also

- [Demo Application on Git](https://github.com/telerik/reporting-samples/tree/master/.NET%20Core%203.1%20MVC)
