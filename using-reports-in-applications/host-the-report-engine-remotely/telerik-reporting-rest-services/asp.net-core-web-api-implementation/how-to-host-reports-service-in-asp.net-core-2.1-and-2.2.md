---
title: How to Host Reports Service in ASP.NET Core 2.1 and 2.2
page_title: How to Host Reports Service in ASP.NET Core 2.1 and 2.2 
description: How to Host Reports Service in ASP.NET Core 2.1 and 2.2
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-core-web-api-implementation/how-to-host-reports-service-in-asp.net-core-2.1-and-2.2
tags: how,to,host,reports,service,in,asp.net,core,2.1,and,2.2
published: True
position: 2
---

# How to Host Reports Service in ASP.NET Core 2.1 and 2.2



This article guides you how to host a Reports Web Service in order to expose the Reports Generation Engine to an         ASP.NET Core 2.1 / 2.2 Web Application.       

The guide is separated into sections for readability reasons. Along with the steps, it elaborates on the concepts and theory         behind each step.       

## Prerequisites

* [Visual Studio 2017 Update 3](https://www.visualstudio.com/vs/) 

* [NET Core 2 SDK](https://www.microsoft.com/net/download/core) 

## Creating a Sample ASP.NET Core Project

First, you need to create a new ASP.NET Core project:         

1. Open __Visual Studio 2017 Update 3 or later__.             

1. From the __File__ menu, select __New__ > __Project__.             

1. In the __New Project__ dialog, expand __Installed > Visual C# > Web__,               and select __ASP.NET Core Web Application__ project template.               Choose a name for the project and click __OK__.             

1. On the __New ASP.NET Core Web Application dialog__             select from the drop downs __.NET Core__ and __ASP.NET Core 2.1__.               Next, from the list of templates select __API__.             

## Add Report Definitions

In this tutorial, the resulting service will use the sample report definitions deployed with the Telerik Reporting product installer:         

1. Locate the sample reports in              *{Telerik Reporting installation path}\Report Designer\Examples*.             

1. Add a new folder to your solution called __Reports__ and copy all sample reports into it.             

1. Later in the tutorial we will make sure that the ReportsController is able to resolve the definitions               for the requested reports from this project folder.             

> It is recommended to use declarative definitions (TRDP/TRDX/TRBP) authored using the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})             or the [Overview]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) in order to take advantage of their design-time tooling because the VS integrated report designer tooling is still not available             in.NET Core projects.           Existing.NET Framework report libraries can be migrated to declarative report definitions as well. The other available approach is designing reports             in a separate Telerik Report Library created against.NET Framework 4.0+ which later must be migrated to a.NET Standard or.NET Core library.             For more information, please refer to              [Guidance for using reports from an existing.NET Framework 4+ report library in a.NET Core application](knowledge-base/use-existing-report-library-in-net-core-app)              knowledge based article. Design-time support is not yet provided for.Net Core Telerik Report Library (Class Library) projects storing the report definitions.           


## Add the required dependencies

This guide applies the recommended NuGet package references approach to add the dependencies:         

1. Reference the __Telerik.Reporting.Services.AspNetCore__ (or __Telerik.Reporting.Services.AspNetCore.Trial__) package.             

1. Optionally, to enable the Office OpenXML document formats (XLSX, DOCX and PPTX) as export options, reference the               __Telerik.Reporting.OpenXmlRendering__ (or __Telerik.Reporting.OpenXmlRendering.Trial__)               NuGet package.             

> The Telerik Reporting engine and services assemblies are built against  __.NET Standard 2.0 framework__           where applicable, which ensures compatibility with a greater variety of frameworks and applications.           The recommended way of adding the necessary dependencies is to use the             [Progress Telerik proprietary NuGet feed]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%})             and reference the dependencies as NuGet packages. This would also add all indirect dependencies to your project             bringing easier dependency management.           Alternatively, the assemblies are available in the  __\Bin\netstandard2.0\__           folder of Telerik Reporting installation directory. However, this would require to manually add all indirect dependencies             listed in the Requirements section of the [](aee150e8-e29d-4739-b8b9-d8a973982efc#requirements) section             and also the following dependency package:              [DocumentFormat.OpenXML version 2.7.2.0 or above](https://www.nuget.org/packages/DocumentFormat.OpenXml/).             Note that you need the last reference only to enable the Office OpenXML document formats.           The Reporting engine relies on the GDI+ API which is available on the Windows OS. On Linux and macOS we use library called              [libgdiplus](https://www.mono-project.com/docs/gui/libgdiplus/)              instead. The GDI+ API is required for measuring, laying out, rendering the text glyphs and images.           


## Add Configuration Settings (Optional)

The report generation engine can retrieve Sql Connection Strings and specific Report Generation Engine Settings           that provide flexibility of the deployed application. It utilizes the            [IConfiguration interface](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-5.0)            for this purpose.         

.NET Core applications provide a new way of storing the configuration - a            [key-value JSON-based](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-2.2)            file named by default __appSettings.json__. The default ReportingEngineConfiguration:         

    
````C#
ReportingEngineConfiguration = sp.GetService<IConfiguration>()
````

will be initialized from __appSettings.json__ or           __appsettings.{EnvironmentName}.json__.         

To activate JSON file configuration with a different name, for example, __reportingAppSettings.json__,            call the            [AddJsonFile](https://docs.microsoft.com/dotnet/api/microsoft.extensions.configuration.jsonconfigurationextensions.addjsonfile/)            extension method on an instance of            [ConfigurationBuilder](https://docs.microsoft.com/dotnet/api/microsoft.extensions.configuration.configurationbuilder).         

In this guide we will create a helper class loading the json-formatted setting:         

    
````C#
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
static class ConfigurationHelper
{
    static IConfiguration ResolveConfiguration(IHostingEnvironment environment)
    {
        // If a specific configuration needs to be passed to the reporting engine, add it through a new IConfiguration instance.
        var reportingConfigFileName = System.IO.Path.Combine(environment.ContentRootPath, "reportingAppSettings.json");
        return new ConfigurationBuilder()
         .AddJsonFile(reportingConfigFileName, true)
         .Build();
    }
}
````

Finally, all configurations should be placed in the JSON configuration file (add one in the project root if such            does not exist). For example, __ConnectionStrings__ setting should be configured in            JSON-based format like this:         

    
````html
{
...
  "ConnectionStrings": {
    "Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString": "Data Source=.\\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=true"
  }
}
````

The above type of connection string lacks information about the data provider and will use *System.Data.SqlClient* as provider invariant name.           When it's necessary to specify a different data provider, the following notation is also supported:         

    
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

The last supported type of __ConnectionStrings__ configuration uses an array to provide information about each connection string:         

    
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

## Setup the Startup.cs file for the Reports service

The __ConfigureServices__ method inside the __Startup.cs__ in the project should be modified           in order to enable the Reports Service functionality.         

Add the dedicated configuration object needed from the Reports Service in the dependency container.           Note how the report source resolver will target the Reports folder we created earlier.         

    
````c#
// Configure dependencies for ReportsController.
services.TryAddSingleton<IReportServiceConfiguration>(sp =>
    new ReportServiceConfiguration
    {
        ReportingEngineConfiguration = ConfigurationHelper.ResolveConfiguration(sp.GetService<IHostingEnvironment>()),
        HostAppId = "ReportingCore2App",
        Storage = new FileStorage(),
        ReportSourceResolver = new UriReportSourceResolver(
            System.IO.Path.Combine(sp.GetService<IHostingEnvironment>().ContentRootPath, "Reports"))
    });
````

## Setting up the REST service

1. Implement a Reports controller. Right-click on the __Controllers__             folder and add a new item: Add - New item - __Web API Controller Class__ item.               Name it ReportsController. This will be our Telerik Reporting REST service in the project.             

1. Inherit the  [ReportsControllerBase](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase)  type               and inject the configuration settings in the constructor.               This is how a basic implementation of the controller should look like:             

    
      ````c#
namespace AspNetCoreDemo.Controllers
{
    using Microsoft.AspNetCore.Mvc;
    using Telerik.Reporting.Services;
    using Telerik.Reporting.Services.AspNetCore;
    [Route("api/reports")]
    public class ReportsController : ReportsControllerBase
    {
        public ReportsController(IReportServiceConfiguration reportServiceConfiguration)
            : base(reportServiceConfiguration)
        {
        }
    }
}
````

## Test the service implementation

To ensure that the service operates, run the application and navigate to           URL __{applicationRoot}/api/reports/formats__.           It should return a JSON representing the supported rendering extensions.

