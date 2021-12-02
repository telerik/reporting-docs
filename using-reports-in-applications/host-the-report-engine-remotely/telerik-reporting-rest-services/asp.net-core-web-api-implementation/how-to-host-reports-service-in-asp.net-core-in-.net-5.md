---
title: How to Host Reports Service in ASP.NET Core in .NET 5
page_title: How to Host Reports Service in ASP.NET Core in .NET 5 | for Telerik Reporting Documentation
description: How to Host Reports Service in ASP.NET Core in .NET 5
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-in-.net-5
tags: how,to,host,reports,service,in,asp.net,core,in,.net,5
published: True
position: 1
---

# How to Host Reports Service in ASP.NET Core in .NET 5



This article guides you how to host a Reports Web Service in order to expose the Reports Generation Engine to an                 ASP.NET Core in .NET 5 Web Application.             

The guide is separated into sections for readability reasons. Along with the steps, it elaborates on the concepts and theory                 behind each step.             

## Prerequisites

*  [Visual Studio 2019, version 16.8+](https://www.visualstudio.com/vs/) 

*  [NET 5 SDK](https://dotnet.microsoft.com/download/dotnet/5.0) 

## Creating a Sample ASP.NET Core in .NET 5 Project

First, you need to create a new ASP.NET Core project:                 

1. Open __Visual Studio 2019__ .                         

1. From the __File__  menu, select __New > Project__ .                         

1. In the __Add a new Project__  dialog select __ASP.NET Core Web Application__  project template.                             Choose a name and location for the project and click __Create__ .                         

1. In the __Create a new ASP.NET Core web application__  dialog                             select from the drop downs __.NET Core__  and __ASP.NET Core 5.0__ .                             Click on __Create__ .                         

## Add Report Definitions

In this tutorial, the resulting service will use the sample report definitions deployed with the Telerik Reporting product installer:                 

1. Find the sample reports in                             *{Telerik Reporting installation path}\Report Designer\Examples* .                         

1. Add a new folder to your solution called __Reports__  and copy all sample reports into it.                         

1. Later in the tutorial we will make sure that the ReportsController is able to resolve the definitions for the                             requested reports from this project folder.                         

>tip It is recommended to use declarative definitions (TRDP/TRDX/TRBP) authored using the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})                         or the [Overview]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) in order to take advantage of their design-time tooling because the VS integrated report designer tooling is still not available                         in .NET 5 projects.                     


## Add the required dependencies

This guide applies the recommended NuGet package references approach to add the dependencies:                 

1. Reference the __Telerik.Reporting.Services.AspNetCore__  (or __Telerik.Reporting.Services.AspNetCore.Trial__ ) package.                         

1. Optionally, to enable the Office OpenXML document formats (XLSX, DOCX and PPTX) as export options, reference the                             __Telerik.Reporting.OpenXmlRendering__  (or __Telerik.Reporting.OpenXmlRendering.Trial__ )                             NuGet package.                         

>tip The recommended way of adding the necessary dependencies is to use the                         [Progress Telerik proprietary NuGet feed]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%})                         and reference the dependencies as NuGet packages. This would also add the indirect dependencies to your project                         bringing easier dependency management.                     Alternatively, the assemblies are available in the  __\Bin\net5.0\__                          folder of Telerik Reporting installation directory. However, this would require to manually add all indirect dependencies                         listed in the Requirements section of the [](aee150e8-e29d-4739-b8b9-d8a973982efc#requirements) section                         and also the following dependency packages:                          [Microsoft.AspNetCore.Mvc.NewtonsoftJson version 5.0.0](https://www.nuget.org/packages/Microsoft.AspNetCore.Mvc.NewtonsoftJson/)                          and                          [DocumentFormat.OpenXML version 2.7.2.0 or above](https://www.nuget.org/packages/DocumentFormat.OpenXml/) .                       Note that you need the last reference only to enable the Office OpenXML document formats.                     The Reporting engine relies on the GDI+ API which is available on the Windows OS. On Linux and macOS we use library called                          [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/)                          instead. The GDI+ API is required for measuring, laying out, rendering the text glyphs and images.                     


## Setup the Startup.cs file for the Reports service

The __ConfigureServices__  method inside the __Startup.cs__  in the project should be modified                     in order to enable the Reports Service functionality.                 

1. Make sure the application is configured for WebAPI controllers and call the __AddNewtonsoftJson__  on                       the IMvcBuilder object to place the NewtonsoftJson serialization:                     

	
      ````c#
services.AddControllers().AddNewtonsoftJson();
````



1. Add the dedicated configuration object needed from the Reports Service in the dependency container.                             Note how the report source resolver will target the Reports folder we created earlier.                         

	
      ````c#
// Configure dependencies for ReportsController.
services.TryAddSingleton<IReportServiceConfiguration>(sp =>
    new ReportServiceConfiguration
    {
        ReportingEngineConfiguration = ConfigurationHelper.ResolveConfiguration(sp.GetService<IWebHostEnvironment>()),
        HostAppId = "Net5RestServiceWithCors",
        Storage = new FileStorage(),
        ReportSourceResolver = new UriReportSourceResolver(
            System.IO.Path.Combine(sp.GetService<IWebHostEnvironment>().ContentRootPath, "Reports"))
    });
````



1. Make sure the endpoints configuration inside the __Configure__  method of the __Startup.cs__                      are configured for API controllers by adding the following line in the lambda expression argument:                 

	
      ````c#
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllers();
    // ... 
});
````



## Add Configuration Settings (Optional)

The report generation engine can retrieve Sql Connection Strings and specific Report Generation Engine             Settings that provide flexibility of the deployed application. It utilizes the              [IConfiguration interface](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-5.0)              for this purpose.           

.NET 5 applications use a              [key-value JSON-based](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-5.0)              file named by default __appSettings.json__ . The default ReportingEngineConfiguration:           

	
````C#
ReportingEngineConfiguration = sp.GetService<IConfiguration>()
````



will be initialized from __appSettings.json__  or             __appsettings.{EnvironmentName}.json__ .           

To activate JSON file configuration with a different name, for example, __reportingAppSettings.json__ ,             call the              [AddJsonFile](https://docs.microsoft.com/dotnet/api/microsoft.extensions.configuration.jsonconfigurationextensions.addjsonfile/)              extension method on an instance of              [ConfigurationBuilder](https://docs.microsoft.com/dotnet/api/microsoft.extensions.configuration.configurationbuilder) .           

In this guide we will create a helper class loading the json-formatted setting:           

	
````C#
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
static class ConfigurationHelper
{
    public static IConfiguration ResolveConfiguration(IWebHostEnvironment environment)
    {
        var reportingConfigFileName = System.IO.Path.Combine(environment.ContentRootPath, "reportingAppSettings.json");
        return new ConfigurationBuilder()
            .AddJsonFile(reportingConfigFileName, true)
            .Build();
    }
}
````



Finally, all configurations should be placed in the JSON configuraion file (add one in the project root if such             does not exist). For example, __ConnectionStrings__  setting should be configured in             JSON-based format like this:           

	
````html
{
  ...
  "ConnectionStrings": {
    "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true"
  }
}
````



The above type of connection string lacks information about the data provider and will use *System.Data.SqlClient*              as provider invariant name. When it's necessary to specify a different data provider, the following notation is also supported:           

	
````html
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

The last supported type of __ConnectionStrings__  configuration uses an array to provide information about each connection string:           

	
````html
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

1. Create folder __Controllers__ .                             Right-click on the project name and select __Add > New folder__ .                             Name it __Controllers__ .                         

1. Implement a Reports controller. Right-click on the __Controllers__                              folder and add a new item: __Add > New item > Web API Controller Class__  item.                             Name it __ReportsController__ . This will be our Telerik Reporting REST service in the project.                         

1. Inherit the  [ReportsControllerBase](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase)  type                             and inject the configuration settings in the constructor.                             This is how a basic implementation of the controller should look like:                         

	
      ````c#
namespace CSharp.Net5.ReportingRestServiceCorsDemo.Controllers
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
````



## Test the service implementation

To ensure that the service operates, run the application and navigate to                     URL __{applicationRoot}/api/reports/formats__ .                     It should return a JSON representing the supported rendering extensions.                 

## Demo project

A full example can be found in the installation folder of Telerik Reporting: C:\Program Files (x86)\Progress\Telerik Reporting {Version}\Examples\CSharp\.NET 5\RestServiceCorsNet5Demo                 

## Enable Cross-Origin Resource Sharing (CORS) (Optional)

You may need to enable  [Cross-Origin Resource Sharing (CORS)](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS) , for example, if you use the REST Service from clients hosted in different domains.           

Add the following code to the *ConfigureServices*  method of the             *Startup.cs*  file to add a new CORS policy for the REST Service:           

	
````c#
          services.AddCors(corsOption => corsOption.AddPolicy(
            "ReportingRestPolicy",
            corsBuilder =>
            {
            corsBuilder.AllowAnyOrigin()
            .AllowAnyMethod()
            .AllowAnyHeader();
            }));
````



Activate the above policy for the application by adding the next code in the *Configure*              method of the *Startup.cs*  file:           

	
````c#
              app.UseCors("ReportingRestPolicy");
````



# See Also


# See Also

 * [YouTube video "How to set up a Telerik Reporting REST Service in .NET 5?"](https://www.youtube.com/watch?v=qU_ByzMgJBo)
