---
title: How to set up in .NET Core 2.1+ application
page_title: How to set up in .NET Core 2.1+ application | for Telerik Reporting Documentation
description: How to set up in .NET Core 2.1+ application
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-core-2.1+-application
tags: how,to,set,up,in,.net,core,2.1+,application
published: True
position: 3
---

# How to set up in .NET Core 2.1+ application



This article shows how to integrate our [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})         in а .NET Core 2.1 application.       

## Prerequisites

The following list describes the prerequisites for this guide:

1. Create a sample ASP.NET Core 2.1+ Project.             

1. Add the required dependencies:             

   + Telerik.WebReportDesigner.Services                 

   + Telerik.Reporting.Services.AspNetCore                 

   + Telerik.Reporting.JsonSerialization                 

   + Telerik.Reporting.WebServiceDataSource                 

   + Telerik.Reporting                 

When you use NuGet packages, you may add only the __Telerik.WebReportDesigner.Services__  package as it depends on           the rest of the required Telerik Reporting assemblies, so they will be added automatically. Their dependencies will also be resolved           automatically. For more information, see           [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).         

If you don't use NuGet packages, along with the above assemblies, you need to add also all their dependencies manually to the project.         

>note If you need to enable users to export reports in Office OpenXML document formats (XLSX, DOCX and PPTX), you must install the            [DocumentFormat.OpenXML](https://www.nuget.org/packages/DocumentFormat.OpenXml/)            and the Telerik.Reporting.OpenXmlRendering NuGet packages. For more information about the required package versions,            see [Deploying Open XML](25b584e0-8dd7-4cfd-8878-ffe5e0a95ad4#deploying_open_xml_sdk_for_ms_office).       


## Add Required Settings in the Startup.cs file

>note Some of the Visual Studio template projects may have the required settings already added by default. In other .NET Core 2.1 Web projects you may need              to add manually some or all of the settings.           


1. Inject the                 [IConfiguration](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-5.0)                  and                   [IHostingEnvironment](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.hosting.ihostingenvironment?view=aspnetcore-2.1)             in the constructor of the Startup class. We will need them later to get the configuration settings and the relative paths:             

	
      ````c#
              public Startup(IConfiguration configuration, IHostingEnvironment hostingEnvironment)
              {
                  Configuration = configuration;
                  HostingEnvironment = hostingEnvironment;
              }
              public IConfiguration Configuration { get; }
              public IHostingEnvironment HostingEnvironment { get; }
````



1. The __ConfigureServices__  method inside the __Startup.cs__  in the project               should be modified in order to enable the Web Report Designer Service functionality. Make sure the application               calls the following methods that add MVC functionality and prevent from potentially breaking behavior changes between ASP.NET Core versions:             

	
      ````c#
services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
````



1. Make sure the configuration inside the __Configure__  method of the               __Startup.cs__  is set up for MVC by adding the following line:             

	
      ````c#
app.UseMvc();
````



1. Assure also that the application configuration inside the __Configure__  method can serve static files:             

	
      ````c#
app.UseStaticFiles();
````



## Add Configuration Settings in the Startup.cs file

The report generation engine can retrieve Sql Connection Strings and specific Report Generation Engine           Settings that provide flexibility of the deployed application. It utilizes the            [IConfiguration interface](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-5.0)            for this purpose.         

The .NET Core 2.1 applications use a            [key-value JSON-based](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-2.1)            file named by default __appSettings.json__ . The default ReportingEngineConfiguration:         

	
````C#
ReportingEngineConfiguration = sp.GetService<IConfiguration>()
````



will be initialized from __appSettings.json__  or           __appsettings.{EnvironmentName}.json__ .         

To activate JSON file configuration with a different name, for example, __reportingAppSettings.json__ ,           call the            [AddJsonFile](https://docs.microsoft.com/dotnet/api/microsoft.extensions.configuration.jsonconfigurationextensions.addjsonfile/)            extension method on an instance of            [ConfigurationBuilder](https://docs.microsoft.com/dotnet/api/microsoft.extensions.configuration.configurationbuilder) .           Here are the exact steps you may follow:         

1. Add a new __ResolveSpecificReportingConfiguration__  class as a separate file or in the               Startup.cs file (optional)             

	
      ````c#
        static IConfiguration ResolveSpecificReportingConfiguration(IHostingEnvironment environment)
        {
            // If a specific configuration needs to be passed to the reporting engine, add it through a new IConfiguration instance.
            var reportingConfigFileName = System.IO.Path.Combine(environment.ContentRootPath, "reportingAppSettings.json");
            return new ConfigurationBuilder()
                .AddJsonFile(reportingConfigFileName, true)
                .Build();
        }
````



1. Add the required services in the __ConfigureServices__  method. Here is how it may look finally:             

	
      ````c#
         public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);
            var reportsPath = Path.Combine(this.HostingEnvironment.ContentRootPath, "Reports");
            // Configure dependencies for ReportsController.
            services.TryAddSingleton<IReportServiceConfiguration>(sp =>
                new ReportServiceConfiguration
                {
                    // The default ReportingEngineConfiguration will be initialized from appsettings.json or appsettings.{EnvironmentName}.json:
                    ReportingEngineConfiguration = sp.GetService<IConfiguration>(),
                    // In case the ReportingEngineConfiguration needs to be loaded from a specific configuration file, use the approach below:
                    // ReportingEngineConfiguration = ResolveSpecificReportingConfiguration(sp.GetService<IHostingEnvironment>()),
                    HostAppId = "Html5DemoAppCore",
                    Storage = new FileStorage(),
                    ReportSourceResolver = new TypeReportSourceResolver()
                        .AddFallbackResolver(new UriReportSourceResolver(reportsPath)),
                });
            // Configure dependencies for ReportDesignerController.
            services.TryAddSingleton<IReportDesignerServiceConfiguration>(sp => new ReportDesignerServiceConfiguration
            {
                DefinitionStorage = new FileDefinitionStorage(reportsPath),
                SettingsStorage = new FileSettingsStorage(
                    Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Telerik Reporting")),
                ResourceStorage = new ResourceStorage(
                    Path.Combine(reportsPath, "Resources")),
            });
        }
````



1. Add a new folder named __Reports__  in the main application folder according to the above settings.                We will use the folder as report definition storage. Add some report definitions inside, for example, our "Product Catalog.trdp"               demo report we are going to reference in the designer web page.             

## Setting up the Report Designer REST service:

The REST service works as a backend and is responsible for storage operations like creating, opening, or saving report definitions.           The following steps describe how to configure it:         

1. Make sure that a key-value JSON-based file is available in your project and add the required               [configuration settings in it](7714DF84-CB60-44F2-A890-DEDAD595A3AB#json), for example the               __ConnectionStrings__ .             

1. Implement a Report Designer controller. Create the __Controllers__  folder if it doesn't exist, right-click on it                and add a new item: Add > New item... > __API Controller - Empty__  item.               Name it ReportDesignerController. This will be our Telerik Web Report Designer REST service in the               project.             

1. Inherit the  [ReportDesignerControllerBase](/reporting/api/Telerik.Reporting.Services.WebApi.ReportDesignerControllerBase)                type and inject the required configuration settings in the constructor. Along with the ReportServiceConfiguration               there is another configuration instance named ReportDesignerServiceConfiguration, which will initialize the               definition storage. This is the class responsible for opening, saving, etc. the report definitions. This is               how a basic implementation of the controller should look like:             

	
      ````c#
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



1. To ensure that the service operates, run the application and navigate to               URL __{applicationRoot}/api/reportdesigner/cultureContext__ .               It should return a JSON representing the separators determined by the current culture, for example:             

	
      ````js
              {"decimalSeparator":".","listSeparator":","}
````



## Adding the Web Report Designer:

1. Add a new HTML Page for the Web Report Designer by right-clicking on *wwwroot*                and __Add > New Item... > HTML Page__ . Name the file, for example __webReportDesigner.html__ .               Add the required references to load the font, jQuery, Telerik Kendo UI libraries,               telerikReportViewer and webReportDesigner scripts listed in the example below. Finally,               add the initialization of the telerik_WebReportDesigner widget. Note that the Web Report Designer container has a minimum width of 1200px.             The complete report viewer page should look like this:

	
      ````html
<!DOCTYPE html> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
    <title>Telerik Web Report Designer Demo</title> 
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" /> 
    <meta http-equiv="X-UA-Compatible" content="IE=edge" /> 
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,500&display=swap" rel="stylesheet"> 
</head> 
  <body> 
    <div id="webReportDesigner"> 
        loading... 
    </div> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> 
    <script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.all.min.js"></script> 
    <script src="api/reportdesigner/resources/js/telerikReportViewer"></script> 
    <script src="api/reportdesigner/designerresources/js/webReportDesigner"></script> 
    <script type="text/javascript"> 
        $(document).ready(function () { 
            $("#webReportDesigner").telerik_WebReportDesigner({ 
                persistSession: false, 
                toolboxArea: { 
                    layout: "list" 
                }, 
                serviceUrl: "api/reportdesigner/", 
                report: "Product Catalog.trdp" 
            }).data("telerik_WebDesigner"); 
        }); 
    </script> 
  </body> 
</html>
````



1. To setup the new page as startup check                [Make index.html as startup file in ASP.NET Core](https://www.talkingdotnet.com/make-index-html-startup-file-in-aspnet-core/) . Then, change the launchUrl to webReportDesigner.html in *launchSettings.json* .             

1. Finally, run the project to preview the web designer.             

## Examples

Find the complete example setup of the Web Report Designer in the __AspNetCoreDemo__            located in Telerik Reporting installation folder. For example,           *%PROGRAMFILES(x86)%\Progress\Telerik Reporting* .           The Web Report Designer’s page is in __wwwroot__  folder. To setup the page to be a startup           page, change the launchUrl to webReportDesigner.html in *launchSettings.json* .         

# See Also

