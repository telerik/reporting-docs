---
title: How to Host Reports Service in ASP.NET Core in .NET 6 with Minimal API
page_title: How to Host Reports Service in ASP.NET Core in .NET 6 with Minimal API 
description: How to Host Reports Service in ASP.NET Core in .NET 6 with Minimal API
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-6-with-minimal-api
tags: how,to,host,reports,service,in,asp.net,core,in,.net,6,with,minimal,api
published: True
position: 2
---

# How to Host Reports Service in ASP.NET Core in .NET 6 with Minimal API

This article guides you how to host a Reports Web Service in order to expose the Reports Generation Engine to an ASP.NET Core in .NET 6 Web Application with Minimal API implementation. 

The guide is separated into sections for readability reasons. Along with the steps, it elaborates on the concepts and theory behind each step. 

## Prerequisites

* [Visual Studio 2022, version 17+](https://www.visualstudio.com/vs/) 

* [NET 6 SDK](https://dotnet.microsoft.com/download/dotnet/6.0) 

## Creating a Sample ASP.NET Core in .NET 6 Project

First, you need to create a new ASP.NET Core project: 

1. Open __Visual Studio 2022__. 

1. From the __File__ menu, select __New > Project__. 

1. In the __Create a new project__ dialog select __ASP.NET Core Web App__ project template and click __Next__. 

1. In the __Configure your new project__ dialog choose a name and location for the project and click __Next__. 

1. In the __Additional information__ dialog select from the drop down __.NET 6.0 (Long-term support)__. If you configure the project for HTTPS make sure to have a proper certificate assigned. Click on __Create__. 

## Add Report Definitions

In this tutorial, the resulting service will use the sample report definitions deployed with the Telerik Reporting product installer: 

1. Find the sample reports in *{Telerik Reporting installation path}\Report Designer\Examples*. 

1. Add a new folder to your solution called __Reports__ and copy all sample reports into it. 

1. Later in the tutorial we will make sure that the ReportsController is able to resolve the definitions for the requested reports from this project folder. 

> It is recommended to use declarative definitions (TRDP/TRDX/TRBP) authored using the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) or the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) in order to take advantage of their design-time tooling because the VS integrated report designer tooling is still not available in .NET 6 projects. 

## Add the required dependencies

This guide applies the recommended NuGet package references approach to add the dependencies: 

1. Reference the __Telerik.Reporting.Services.AspNetCore__ (or __Telerik.Reporting.Services.AspNetCore.Trial__) package. 

1. Optionally, to enable the Office OpenXML document formats (XLSX, DOCX and PPTX) as export options, reference the __Telerik.Reporting.OpenXmlRendering__ (or __Telerik.Reporting.OpenXmlRendering.Trial__) NuGet package. 

> The recommended way of adding the necessary dependencies is to use the [Progress Telerik proprietary NuGet feed]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}) and reference the dependencies as NuGet packages. This would also add the indirect dependencies to your project bringing easier dependency management. Alternatively, the assemblies are available in the __\Bin\net6.0\__ and  __\Bin\netstandard2.0\__ folders of Telerik Reporting installation directory. However, this would require to manually add all indirect dependencies listed in [.NET Core Support - Requirements]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%}#requirements) section and also the following dependency package: [Microsoft.AspNetCore.Mvc.NewtonsoftJson version 5.0.0](https://www.nuget.org/packages/Microsoft.AspNetCore.Mvc.NewtonsoftJson/) and [DocumentFormat.OpenXML version 2.7.2.0 or above](https://www.nuget.org/packages/DocumentFormat.OpenXml/). Note that you need the last reference only to enable the Office OpenXML document formats. The Reporting engine relies on the GDI+ API which is available on the Windows OS. On Linux and macOS we use library called [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/) instead. The GDI+ API is required for measuring, laying out, rendering the text glyphs and images. 

## Setup the Program.cs file as a starting point of your Reporting REST Service project with Minimal API

Modify the __Program.cs__ file in the project to enable the Reports Service functionality. 

1. Make sure the application is configured for WebAPI controllers and call the __AddNewtonsoftJson__ on the IMvcBuilder object to place the NewtonsoftJson serialization: 
    
	````C#
builder.Services.AddControllers().AddNewtonsoftJson();
````

1. Add the dedicated configuration object needed from the Reports Service in the dependency container. Note how the report source resolver will target the Reports folder we created earlier. 
    
	````C#
// Configure dependencies for ReportsController.
	builder.Services.TryAddSingleton<IReportServiceConfiguration>(sp =>
		new ReportServiceConfiguration
		{
			// The default ReportingEngineConfiguration will be initialized from appsettings.json or appsettings.{EnvironmentName}.json:
			ReportingEngineConfiguration = sp.GetService<IConfiguration>(),
			// In case the ReportingEngineConfiguration needs to be loaded from a specific configuration file, use the approach below:
			//ReportingEngineConfiguration = ResolveSpecificReportingConfiguration(sp.GetService<IWebHostEnvironment>()),
			HostAppId = "ReportingNet6",
			Storage = new FileStorage(),
			ReportSourceResolver = new UriReportSourceResolver(System.IO.Path.Combine(sp.GetService<IWebHostEnvironment>().ContentRootPath, "Reports"))
		});
````

1. Make sure the endpoints are configured for API controllers by adding the following line in the lambda expression argument after the *UseRouting();* call: 
    
	````C#
app.UseEndpoints(endpoints =>
	{
		endpoints.MapControllers();
		//...
	});
````


## Add Configuration Settings to the Program.cs file (Optional)

The report generation engine can retrieve SQL Connection Strings and specific Report Generation Engine Settings that provide flexibility of the deployed application. It utilizes the [IConfiguration interface](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-6.0) for this purpose. 

The .NET 6 applications use a [key-value JSON-based](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-6.0) file named by default __appSettings.json__. The default ReportingEngineConfiguration: 
    
````C#
ReportingEngineConfiguration = sp.GetService<IConfiguration>()
````

will be initialized from __appSettings.json__ or __appsettings.{EnvironmentName}.json__. 

To activate JSON file configuration with a different name, for example, __reportingAppSettings.json__, call the [AddJsonFile](https://docs.microsoft.com/dotnet/api/microsoft.extensions.configuration.jsonconfigurationextensions.addjsonfile/) extension method on an instance of [ConfigurationBuilder](https://docs.microsoft.com/dotnet/api/microsoft.extensions.configuration.configurationbuilder). 

In this guide we will create a helper method loading the json-formatted setting: 
    
````C#
static IConfiguration ResolveSpecificReportingConfiguration(IWebHostEnvironment environment)
{
	// If a specific configuration needs to be passed to the reporting engine, add it through a new IConfiguration instance.
	var reportingConfigFileName = System.IO.Path.Combine(environment.ContentRootPath, "reportingAppSettings.json");
	return new ConfigurationBuilder()
		.AddJsonFile(reportingConfigFileName, true)
		.Build();
}
````

Finally, all configurations should be placed in the JSON configuraion file (add one in the project root if such does not exist). For example, __ConnectionStrings__ setting should be configured in JSON-based format like this: 
    
````JSON
{
	...
	"ConnectionStrings": {
		"Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true"
	}
}
````

The above type of connection string lacks information about the data provider and will use *System.Data.SqlClient* as provider invariant name. When it's necessary to specify a different data provider, the following notation is also supported: 
    
````JSON
{
	...
	"ConnectionStrings": {
		"Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString": {
			"connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
			"providerName": "System.Data.SqlClient"
		}
	}
}
````

The two types of connection string notations specified above can coexist in a single ConnectionStrings section. 

The last supported type of __ConnectionStrings__ configuration uses an array to provide information about each connection string: 
    
````JSON
{
...
	"ConnectionStrings": [
		{
			"name": "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString",
			"connectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true",
			"providerName": "System.Data.SqlClient"
		}
	]
}
````


## Setting up the REST service

1. Create folder __Controllers__. Right-click on the project name and select __Add > New folder__. Name it __Controllers__. 

1. Implement a Reports controller. Right-click on the __Controllers__ folder and add a new item: __Add > New item > API Controller - Empty__ item. Name it __ReportsController__. This will be our Telerik Reporting REST service in the project. 

1. Inherit the [ReportsControllerBase](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase) type and inject the configuration settings in the constructor. This is how a basic implementation of the controller should look like: 
    
	````C#
namespace MinimalApi.Controllers
	{
		using System.Net;
		using System.Net.Mail;
		using Microsoft.AspNetCore.Mvc;
		using Telerik.Reporting.Services;
		using Telerik.Reporting.Services.AspNetCore;

		[Route("api/[controller]")]
		[ApiController]
		public class ReportsController : ReportsControllerBase
		{
			public ReportsController(IReportServiceConfiguration reportServiceConfiguration)
			: base(reportServiceConfiguration)
			{
			}

			protected override HttpStatusCode SendMailMessage(MailMessage mailMessage)
			{
				throw new System.NotImplementedException("This method should be implemented in order to send mail messages");

				// using (var smtpClient = new SmtpClient("smtp01.mycompany.com", 25))
				// {
				//     smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;
				//     smtpClient.EnableSsl = false;
				//     smtpClient.Send(mailMessage);
				// }
				// return HttpStatusCode.OK;
			}
		}
	}
````


## Test the service implementation

To ensure that the service operates, run the application and navigate to URL __{applicationRoot}/api/reports/formats__. It should return a JSON representing the supported rendering extensions. 

## Enable Cross-Origin Resource Sharing (CORS) (Optional)

You may need to enable [Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS), for example, if you use the REST Service from clients hosted in different domains. 

Add the following service to the *Program.cs* file to add a new CORS policy for the REST Service: 
    
````C#
builder.Services.AddCors(corsOption => corsOption.AddPolicy(
	"ReportingRestPolicy",
	corsBuilder =>
	{
		corsBuilder.AllowAnyOrigin()
			.AllowAnyMethod()
			.AllowAnyHeader();
	}
));
````

Activate the above policy for the application by adding the code below in the application configuration part of the *Program.cs* file: 
    
````C#
app.UseCors("ReportingRestPolicy");
````


## Demo project

A full example can be found in the installation folder of Telerik Reporting: 

`C:\Program Files (x86)\Progress\Telerik Reporting {Version}\Examples\CSharp\.NET 6\ReportingRestServiceCorsDemo\CSharp.Net6.ReportingRestServiceCorsDemo`
