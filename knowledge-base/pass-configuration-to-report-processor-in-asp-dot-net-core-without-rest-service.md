---
title: How to pass configuration settings to ReportProcessor in ASP.NET Core application that does not use REST Service
description: How to pass the configuration settings from the appsettings.json file to ReportProcessor in ASP.NET Core application that does not use Telerik Reporting REST Service
type: how-to
page_title: How to pass configuration settings to ReportProcessor in ASP.NET Core application that does not use Telerik Reporting REST Service
slug: pass-configuration-to-report-processor-in-asp-dot-net-core-without-rest-service
position:
tags:
ticketid: 1424992
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>13.0.19.116 and higher</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Project Type</td>
			<td>ASP.NET Core</td>
		</tr>
	</tbody>
</table>

## Description

If you want to export a report in ASP.NET Core application with the [ReportProcessor](/api/telerik.reporting.processing.reportprocessor) without using the _Telerik Reporting REST Service_, you may need the configuration settings from the `appsettings.json` file.

For example, when the report uses external user functions, their assembly should be registered in the **telerikReporting** section of the configuration file - [Extending Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/overview%}).

## Solution

1. You need to create a code which ensures reading the `appsettings.json` as a configuration file. For example with the following class:

   ```C#
   public class ConfigurationService
   {
   	public IConfiguration Configuration { get; private set; }

   	public IHostingEnvironment Environment { get; private set; }
   	public ConfigurationService(IHostingEnvironment environment)
   	{
   		this.Environment = environment;

   		var configFileName = System.IO.Path.Combine(environment.ContentRootPath, "appsettings.json");
   		var config = new ConfigurationBuilder()
   						.AddJsonFile(configFileName, true)
   						.Build();

   		this.Configuration = config;
   	}
   }
   ```

2. Then you need to put the above service in the container in the _Startup.cs_ -\> _ConfigureServices_ class, like :

   ```C#
   public void ConfigureServices(IServiceCollection services)
   {
   	this.services = services;
   	this.services.Configure<CookiePolicyOptions>(options =>
   	{
   		options.CheckConsentNeeded = context => true;
   		options.MinimumSameSitePolicy = SameSiteMode.None;
   	});

   	this.services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_2);
   	this.services.AddSingleton<ConfigurationService>();
   }
   ```

   For more details about the above settings, you may check [How to implement Telerik Reporting in ASP.NET Core 2.1 MVC]({%slug how-to-implement-telerik-reporting-in-asp-net-core-mvc%}).

3. The next step is to use the _ReportProcessor_ with its overload specific for .NET Standard that takes as an argument the configuration - in an MVC controller you may inject it in the constructor of the controller:

   ```C#
   private readonly ConfigurationService configuration;

   public HomeController(ConfigurationService configuration)
   {
   	this.configuration = configuration;
   }
   ```

   or alternatively, take it from the HttpContext:

   ```C#
   var configuration = this.HttpContext.RequestServices.GetService(typeof(ConfigurationService)) as ConfigurationService;
   ```

   and use it like:

   ```C#
   ReportProcessor reportProcessor = new ReportProcessor(configuration.Configuration);
   ```
