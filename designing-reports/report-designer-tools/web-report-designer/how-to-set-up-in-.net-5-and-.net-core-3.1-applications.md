---
title: How to set up in .NET 5 and .NET Core 3.1 applications
page_title: How to set up in .NET 5 and .NET Core 3.1 applications | for Telerik Reporting Documentation
description: How to set up in .NET 5 and .NET Core 3.1 applications
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-5-and-.net-core-3.1-applications
tags: how,to,set,up,in,.net,5,and,.net,core,3.1,applications
published: True
position: 1
---

# How to set up in .NET 5 and .NET Core 3.1 applications



This article shows how to integrate our [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})         in а .NET Core 3.1 and .NET 5 applications.       

The quickest way to add the web report designer to a web project is with the __Telerik Web Report Designer__          item template in Visual Studio. The item template is compatible with .NET Core 3.1 and .NET 5 projects.         The item template adds a page with the Web Report Designer and, if needed, enables the Web Report Designer REST Service.         To start the item template wizard, in Visual Studio Solution Explorer, select the target project. On the Project menu,         click Add -> New Item.         In the Add New Item search box enter "*Telerik Web Report Designer* " and select the item         template which corresponds to your web project type.       

For full control, instead of using the item template, you can manually configure the REST service and add the web report designer as elaborated         in the rest of this article.       

## Prerequisites

1. Create a sample ASP.NET Core 3.1 or .NET 5 Project. It may be an empty Web project or a Web API project.             

1. Add the required dependencies:             

   + Telerik.WebReportDesigner.Services                 

   + Telerik.Reporting.Services.AspNetCore                 

   + Telerik.Reporting.JsonSerialization                 

   + Telerik.Reporting                 

When you use NuGet packages, you may add only the __Telerik.WebReportDesigner.Services__  package as it depends on           the rest of the required Telerik Reporting assemblies, so they will be added automatically. Their dependencies will also be resolved           automatically. For more information, see            [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).         

If you don't use NuGet packages, along with the above assemblies, you need to add also all their dependencies manually to the project.         

>note If you need to enable users to export reports in Office OpenXML document formats (XLSX, DOCX and PPTX), you must install the              [DocumentFormat.OpenXML](https://www.nuget.org/packages/DocumentFormat.OpenXml/)              and the Telerik.Reporting.OpenXmlRendering NuGet packages. For more information about the required package versions,             see [Deploying Open XML](25b584e0-8dd7-4cfd-8878-ffe5e0a95ad4#deploying_open_xml_sdk_for_ms_office).           


## Add Required Settings in the Startup.cs file

>note Some of the Visual Studio template projects, like .NET 5 Web API project, have the required settings already added             by default. In the empty .NET Core 3.1 and .NET 5 Web projects you need to add manually the settings.           


1. The __ConfigureServices__  method inside the __Startup.cs__  in the project               should be modified in order to enable the Web Report Designer Service functionality. Make sure the application                is configured for WebAPI controllers and call the *AddNewtonsoftJson*                to place the NewtonsoftJson serialization:             

	
      ````c#
services.AddControllers().AddNewtonsoftJson();
````



1. Make sure the endpoints configuration inside the __Configure__  method of the               __Startup.cs__  are configured for API controllers by adding the following line in the               lambda expression argument:             

	
      ````c#
app.UseEndpoints(endpoints =>
{
    endpoints.MapControllers();
    // ... 
});
````



1. Assure that the app configuration inside the __Configure__  method of the __Startup.cs__                can serve static files:             

	
      ````c#
app.UseStaticFiles();
````



## Add Configuration Settings in the Startup.cs file (optional)

The report generation engine can retrieve Sql Connection Strings and specific Report Generation Engine           Settings that provide flexibility of the deployed application. It utilizes the            [IConfiguration interface](https://docs.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-5.0)            for this purpose.         

The .NET Core 3.1 and .NET 5 applications use a            [key-value JSON-based](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-3.1)            file named by default __appSettings.json__ . The default ReportingEngineConfiguration:         

	
````C#
ReportingEngineConfiguration = sp.GetService<IConfiguration>()
````



will be initialized from __appSettings.json__  or           __appsettings.{EnvironmentName}.json__ .         

To activate JSON file configuration with a different name, for example, __reportingAppSettings.json__ ,           call the            [AddJsonFile](https://docs.microsoft.com/dotnet/api/microsoft.extensions.configuration.jsonconfigurationextensions.addjsonfile/)            extension method on an instance of            [ConfigurationBuilder](https://docs.microsoft.com/dotnet/api/microsoft.extensions.configuration.configurationbuilder) .           Here are the exact steps you may follow:         

1. Add a new __ResolveSpecificReportingConfiguration__  class as a separate file or in the               Startup.cs file             

	
      ````c#
        static IConfiguration ResolveSpecificReportingConfiguration(IWebHostEnvironment environment)
        {
            var reportingConfigFileName = System.IO.Path.Combine(environment.ContentRootPath, "reportingAppSettings.json");
            return new ConfigurationBuilder()
                .AddJsonFile(reportingConfigFileName, true)
                .Build();
        }
````



1. Add the required services in the __ConfigureServices__  method             

	
      ````c#
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
                DefinitionStorage = new FileDefinitionStorage(Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath, "Reports")),
                SettingsStorage = new FileSettingsStorage(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Telerik Reporting")),
            });
        }
````



## Setting up the Report Designer REST service:

The REST service works as a backend and is responsible for storage operations like creating, opening, or saving report definitions.           The following steps describe how to configure it:         

1. Make sure that a key-value JSON-based file is available in your project and add the required               [configuration settings in it](7714DF84-CB60-44F2-A890-DEDAD595A3AB#json), for example the               __ConnectionStrings__ .             

1. Implement a Report Designer controller. Right-click on the __Controllers__                folder and add a new item: Add > New item... > __Web API Controller Class__  item.               Name it ReportDesignerController. This will be our Telerik Web Report Designer REST service in the               project.             

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

1. Add TRDP or TRDX report definitions in the dedicated folder, specified in the DefinitionStorage and UriReportSourceResolver of the                services configurations. In the sample code this is               

	
      ````c#
              Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath,  "Reports")
````

and corresponds to the folder *Reports*  in the                *wwwroot*  folder. Add the latter to the main application folder if it doesn't exist.             You may add to the *Reports*  folder one of our demo reports that can be found by default in                *{Telerik Reporting installation path}\Report Designer\Examples* .             

1. Add a new HTML Page for the Web Report Designer by right-clicking on *wwwroot*                and __Add > New Item... > HTML Page__ . Name the file __index.html__ .               Add the required references to load the font, jQuery, Telerik Kendo UI libraries,               telerikReportViewer and webReportDesigner scripts listed in the example below. Finally,               add the initialization of the telerik_WebReportDesigner widget. Note that the Web Report Designer container has a minimum width of 1200px.             The complete report viewer page should look like this:

	
      ````html
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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2020.3.1118/js/kendo.all.min.js"></script>
    <script src="/api/reportdesigner/resources/js/telerikReportViewer/"></script>
    <script src="/api/reportdesigner/designerresources/js/webReportDesigner/"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#webReportDesigner").telerik_WebReportDesigner({
                toolboxArea: {
                    layout: "list" //Change to "grid" to display the contents of the Components area in a flow grid layout.
                },
                serviceUrl: "/api/reportdesigner",
                report: "Barcodes Report.trdp"
            }).data("telerik_WebDesigner");
        });
    </script>
</body>
</html>
````



1. To setup the index.html as startup page check                [Make index.html as startup file in ASP.NET Core](https://www.talkingdotnet.com/make-index-html-startup-file-in-aspnet-core/) . Then, change the launchUrl to index.html in *launchSettings.json* .             

1. Finally, run the project to preview the web designer.             

## Examples

Find the complete example setup of the Web Report Designer in a .NET Core 3.1 application in our            [GitHub repository](https://github.com/telerik/reporting-samples/tree/master/WebReportDesigner%20in%20.NET%20Core%203.1) .         

# See Also


# See Also

 * [YouTube video "How to set up a Telerik Web Report Designer in .NET 5?"](https://www.youtube.com/watch?v=6HXU-3awhis)
