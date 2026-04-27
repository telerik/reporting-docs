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

This article shows how to integrate our [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview) in `.NET {{site.mindotnetversion}}+` applications.

The quickest way to add the web report designer to a web project is with the **Telerik Web Report Designer** item template in Visual Studio. The item template is compatible with projects targetting `.NET {{site.mindotnetversion}}+`. The item template adds a page with the Web Report Designer and, if needed, enables the Web Report Designer REST Service. To start the item template wizard, in Visual Studio `Solution Explorer`, select the target project. On the Project menu, click `Add` -> `New Item`. In the Add New Item search box enter "_Telerik Web Report Designer_" and select the item template which corresponds to your project type.

For full control, instead of using the item template, you can manually configure the REST service and add the web report designer as elaborated in the rest of this article.

## Prerequisites

1. Create a sample ASP.NET Core Project targeting .NET {{site.mindotnetversion}}+ or higher. It may be an empty Web project or a Web API project.
1. Add the required dependencies:
   - `Telerik.WebReportDesigner.Services`
   - `Telerik.Reporting.Services.AspNetCore`
   - `Telerik.Reporting.JsonSerialization`
   - `Telerik.Reporting`

When you use NuGet packages, you may add only the `Telerik.WebReportDesigner.Services` package as it depends on the rest of the required Telerik Reporting assemblies, so they will be added automatically. Their dependencies will also be resolved automatically. For more information, see [How to add the Telerik private NuGet feed to Visual Studio](slug:telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio).

If you don't use NuGet packages, along with the above assemblies, you need to add all their dependencies manually to the project.

> note If you need to enable users to export reports in Office OpenXML document formats (XLSX, DOCX, and PPTX), you must install the [DocumentFormat.OpenXML](https://www.nuget.org/packages/DocumentFormat.OpenXml/) and `the Telerik.Reporting.OpenXmlRendering` NuGet packages. For more information about the required package versions, see [Deploying Open XML](slug:telerikreporting/using-reports-in-applications/third-party-dependencies#deploying-open-xml).

## Add Required Settings in the `Startup.cs` file

> note Some of the Visual Studio template projects, like the .NET {{site.mindotnetversion}}+ Web API project, have the required settings already added by default. In the empty .NET Web projects, you may need to add manually the settings.

1. The `ConfigureServices` method inside the `Startup.cs` in the project should be modified in order to enable the Web Report Designer Service functionality. Ensure that the application is configured for WebAPI controllers:

   {{source=CodeSnippets\Blazor\Docs\ProgramWithConfigSection.cs region=ReportingRestServiceAddControllers}}

1. Make sure the endpoints configuration inside the `Configure` method of the `Startup.cs` is configured for API controllers by adding routing and endpoint configuration:

   {{source=CodeSnippets\Blazor\Docs\ProgramWithConfigSection.cs region=RestServiceUseUseRoutingAndEndpoints}}

1. Assure that the app configuration inside the `Configure` method of the `Startup.cs` can serve static files:

   {{source=CodeSnippets\Blazor\Docs\ProgramWithConfigSection.cs region=UseStaticFiles}}

## Add Configuration Settings in the Startup.cs file

The report generation engine can retrieve Sql Connection Strings and specific Report Generation Engine Settings that provide flexibility for the deployed application. It utilizes the [IConfiguration interface](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-7.0) for this purpose.

The ASP.NET Core applications use a [key-value JSON-based](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/configuration/?view=aspnetcore-7.0) file named by default `appSettings.json`. The default ReportingEngineConfiguration:

{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=ReportingEngineConfiguration}}

will be initialized from `appSettings.json` or `appsettings.{EnvironmentName}.json`.

To activate JSON file configuration with a different name, for example, `reportingAppSettings.json`, call the [AddJsonFile](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.jsonconfigurationextensions.addjsonfile?view=dotnet-plat-ext-7.0) extension method on an instance of [ConfigurationBuilder](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.configurationbuilder?view=dotnet-plat-ext-7.0). Here are the exact steps to follow:

1. Add a `ResolveSpecificReportingConfiguration` method in a separate class/file or directly in the `Startup.cs` file

   {{source=CodeSnippets\Blazor\Docs\ProgramWithConfigSection.cs region=ResolveSpecificReportingConfiguration}}

1. Add the required services in the `ConfigureServices` method

   {{source=CodeSnippets\Blazor\Docs\ProgramWithConfigSection.cs region=ConfigureServicesMethod}}

## Setting up the Report Designer REST service:

The REST service works as a backend and is responsible for storage operations like creating, opening, or saving report definitions. The following steps describe how to configure it:

1. Make sure that a key-value JSON-based file is available in your project and add the required [configuration settings in it](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview#json-based-configuration), for example, the `ConnectionStrings`.
1. Implement a Report Designer controller. Right-click on the `Controllers` folder and add a new item: Add > New item... > **Web API Controller Class** item. Name it ReportDesignerController. This will be our Telerik Web Report Designer REST service in the project.
1. Inherit the [`ReportDesignerControllerBase`](/api/Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase) type and inject the required configuration settings in the constructor. Along with the [`ReportServiceConfiguration`](/api/telerik.reporting.services.reportserviceconfiguration), there is another configuration instance named [`ReportDesignerServiceConfiguration`](/api/Telerik.WebReportDesigner.Services.ReportDesignerServiceConfiguration), which will initialize the definition storage. This is the class responsible for opening, editing, and saving the report definitions. This is how a basic implementation of the controller should look like the following:

   {{source=CodeSnippets\Blazor\Docs\Controllers\ReportDesignerControllerEmpty.cs region=ReportDesignerControllerEmpty}}

1. To ensure the service operates, run the application and navigate to URL `{applicationRoot}/api/reportdesigner/cultureContext`. It should return a JSON representing the separators determined by the current culture, for example:

   ```JSON
   {"decimalSeparator":".","listSeparator":","}
   ```

## Adding the Web Report Designer:

1. Add TRDP or TRDX report definitions in the dedicated folder, specified in the DefinitionStorage and `UriReportSourceResolver` of the services configurations. In the sample code, this is

   ```C#
   Path.Combine(sp.GetService<IWebHostEnvironment>().WebRootPath, "Reports")
   ```

   and corresponds to the folder _Reports_ in the _wwwroot_ folder. Add the latter to the main application folder if it doesn't exist. You may add to the _Reports_ folder one of our demo reports that can be found by default in _{Telerik Reporting installation path}\Report Designer\Examples_.

1. Add a new HTML Page for the Web Report Designer by right-clicking on _wwwroot_ and **Add > New Item... > HTML Page**. Name the file `index.html`. Add the required references to load the font, jQuery, Telerik Kendo UI libraries, telerikReportViewer, and webReportDesigner scripts listed in the example below. Finally, add the initialization of the telerik_WebReportDesigner widget. Note that the Web Report Designer container has a minimum width of 1200px. The complete report viewer page should look like this:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\WebReportDesignerSetUpInDotnet.html region=WebReportDesignerAddingTheWebReportDesigner}}

1. To set up the `index.html` as a startup page, check [Make index.html as startup file in ASP.NET Core](https://www.talkingdotnet.com/make-index-html-startup-file-in-aspnet-core/). Then, change the _launchUrl_ to _index.html_ in `launchSettings.json`.
1. Finally, run the project to preview the web designer.

## Examples

You may find the complete example setup of the Web Report Designer in the _Html5IntegrationDemo_ project for the corresponding target framework deployed with the installation of the product. The default installation folder is `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp`.

## See Also

- [Configure Web Report Designer and Create a Basic Report](slug:telerikreporting/getting-started/web-designer/set-up-and-create-basic-report)
- [YouTube video tutorial Getting Started with the Web Report Designer: Part 1](https://www.youtube.com/watch?v=L-utkcB8-5c)
