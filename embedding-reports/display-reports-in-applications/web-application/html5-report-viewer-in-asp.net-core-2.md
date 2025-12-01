---
title: HTML5 Report Viewer in ASP.NET Core 2
page_title: HTML5 Report Viewer in ASP.NET Core 2 
description: HTML5 Report Viewer in ASP.NET Core 2
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer-in-asp.net-core-2
tags: html5,report,viewer,in,asp.net,core,2
published: False
position: 9
reportingArea: General
---

# HTML5 Report Viewer in ASP.NET Core 2

> The following article applies to.NET Core projects that target the __full.NET Framework 4.0+__. If the project targets.NET Core 2.1+ please refer to the following articles: 
> 
> * [.NET Core Support]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%})
> 
> * [Using Telerik Reporting in.NET Core Applications](https://www.telerik.com/blogs/using-telerik-reporting-in-net-core-applications) 
> 
> * [Manual Setup of HTML5 Report Viewer in an ASP.NET Core 2+ application.]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-2.1-and-2.2-application%})
> 
> * [Guidance for using reports from an existing.NET Framework 4+ report library in a.NET Core application]({%slug use-existing-report-library-in-net-core-app%}) 
> 
> * [How to implement Telerik Reporting in ASP.NET Core 2.1 MVC]({%slug how-to-implement-telerik-reporting-in-asp-net-core-mvc%})

In case you are not familiar with ASP.NET Core, check it out on the [official page](https://www.asp.net/core). 

Telerik Reporting ASP.NET Core packages are available as of Telerik Reporting R3 2016 SP1 release. They are built against the __full.NET Framework__. 

Telerik NuGet Packages include the Reporting Engine and implementation of the [Reporting REST WebAPI based service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/overview%}). The packages do not include design-time support. 

## Designing the Reports

.NET Core don't have design time support. Our recommendation is to design reports in a separate Telerik Report Library (Class Library created for.NET Framework 4.0+) or to use the [Overview]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}). 

## Supported Environment

Telerik Reporting ASP.NET Core package is built against the full.NET Framework because the Reporting engine relies on the GDI+ API, that is available only on Windows OS. The GDI+ API is required for measuring, layouting and preparing the text glyphs. 

For targeting non-Windows platforms with ASP.NET Core Application, add the HTML5 Viewer as a JavaScript widget, which does not require any Telerik NuGet packages. The Reporting REST service can be hosted separately on a Windows OS machine, where the HTML5 Viewer will need the address of the service to display content produced on the remote machine. More details about hosting the Reporting REST Service are available in [How to Add Telerik Reporting REST Web API to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application%}) and [How to Self Host Telerik Reporting REST Web API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-self-host-telerik-reporting-rest-web-api%}). 

## Connection Strings and Engine Configuration

Telerik Reporting relies on the ConfigurationManager to resolve named connection strings and to configure the reporting engine. Thus add any named connectionstrings or Telerik Reporting configuration to the project's root __app.config__ configuration file. For more information see: [Overview]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}). 

## Prerequisites

* [Visual Studio 2017 Update 3](https://www.visualstudio.com/vs/) 

* [NET Core 2 SDK](https://www.microsoft.com/net/download/core) 

## Creating a Sample ASP.NET Core Project

1. Open __Visual Studio 2017 Update 3__. 

1. From the __File__ menu, select __New__ > __Project__. 

1. In the __New Project__ dialog, expand __Installed > Visual C# >.NET Core__, and select __ASP.NET Core Web Application__ project template. Choose a name for the project and click __OK__. 

1. On the __New ASP.NET Core Web Application dialog__ select from the drop downs __.NET Framework__ and __ASP.NET Core 2__. Next from the list of templates select __API__. *If.NET Framework cannot be selected from the Visual Studio 2017 UI it will be necessary to manually edit the targeted framework in the project file (__.csproj__). Here is the step-by-step guide:

   1. Unload the project - right click on it and select 'Unload Project'. 

   1. Right click on the unloaded project and select 'Edit *YourProjectName*.csproj'. The.csproj file opens in the VS for editing. 

   1. Change the PropertyGroup section to look like: 
    
      ````html
<PropertyGroup>
  <TargetFramework>net461</TargetFramework>
</PropertyGroup>
````

      For another *.NET Framework* (for example *4.7.1*) the value should be changed accordingly (for the example - *net471*), etc. Save the .csproj file. 

   1. Reload project - right click on the unloaded project and select 'Reload Project'. 

## Adding the required NuGet Packages

ASP.NET Core does not support references to assemblies, but instead works with NuGet packages. 

> If the project refers __Microsoft.AspNetCore.All__ package the latter should be removed from *Dependencies->NuGet* - right click on the package and select 'Remove'. In this case the following packages should be added manually to the project - right click on the project and select 'Manage NuGet Packages...': 
> 
> * __Microsoft.AspNetCore__  
> 
> * __Microsoft.AspNetCore.Mvc__ 

To setup the Reporting REST service download __Telerik.Reporting__ and __Telerik.Reporting.Services.AspNetCore__ NuGet packages from the private Telerik NuGet feed at [https://nuget.telerik.com/v3/index.json](https://nuget.telerik.com/v3/index.json). How to add a NuGet feed is explained in [https://www.visualstudio.com/en-us/docs/package/nuget/consume](https://www.visualstudio.com/en-us/docs/package/nuget/consume). 

[Telerik account](https://www.telerik.com/account) is required to access the private repository. 

For static files support add [Microsoft.AspNetCore.StaticFiles](https://www.nuget.org/packages/Microsoft.AspNetCore.StaticFiles/) NuGet package. 

For Office OpenXML document formats (XLSX, DOCX and PPTX) install the [DocumentFormat.OpenXML](https://www.nuget.org/packages/DocumentFormat.OpenXml/) NuGet package. The package support out of the box version 2.7.2.0. For newer versions [binding redirect](http://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx) in the app.config is required. 

## Setting up the REST service

1. In the project, right-click __Dependencies__, choose __Manage NuGet Packages__ and from the drop down menu, select Telerik private feed. 

1. Install __Telerik.Reporting__ and __Telerik.Reporting.Services.AspNetCore__ NuGet packages, which will give the Telerik Reporting REST Service functionality and the reporting engine.             

1. Implement a Reports controller. Right-click on the __Controllers__ folder and add a new item: Add - New item - __Web API Controller Class__ item. Name it ReportsController. This will be our Telerik Reporting REST service in the project. Inherit the __ReportsControllerBase__ type and provide proper settings for ReportSourceResolver and Storage. This is how a basic implementation of the controller should look like: 
    
      ````c#
namespace WebApplication1.Controllers
{
    using System.IO;
    using System.Linq;
    using System.Collections.Generic;
    using Microsoft.AspNetCore.Hosting;
    using Microsoft.AspNetCore.Mvc;
    using Telerik.Reporting.Cache.File;
    using Telerik.Reporting.Services;
    using Telerik.Reporting.Services.AspNetCore;
    [Route("api/reports")]
    public class ReportsController : ReportsControllerBase
    {
        string reportsPath = string.Empty;
        public ReportsController(IHostingEnvironment environment)
        {
            this.reportsPath = Path.Combine(environment.WebRootPath, "Reports");
            this.ReportServiceConfiguration = new ReportServiceConfiguration
            {
                HostAppId = "Html5DemoApp",
                Storage = new FileStorage(),
                ReportSourceResolver = new TypeReportSourceResolver()
                                 .AddFallbackResolver(new UriReportSourceResolver(this.reportsPath)),
            };
        }
        [HttpGet("reportlist")]
        public IEnumerable<string> GetReports()
        {
            return Directory
             .GetFiles(this.reportsPath)
             .Select(path =>
                    Path.GetFileName(path));
        }
    }
}
````

## Adding the HTML5 Report Viewer

1. To set up a folder for the reports, right-click on *wwwroot* and select __Add > New Folder__. Name the folder __Reports__ and add sample reports in TRDP format. Find the sample reports in *{Telerik Reporting installation path}\Report Designer\Examples* Note that the name of the folder is considered with the folder path used by the UriReportSourceResolver in the ReportsController. This tutorial will use __Barcodes Report.trdp__ in all examples. 

1. Add a HTML Page for the HTML5 Report Viewer. 

1. Add the HTML5 Report Viewer. For a detailed explanation, check the HTML5 Report Viewer [Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/manual-setup%}) help article. The required references to jQuery and Telerik Kendo UI CSS and JS files are listed in the example below. Copy the Kendo subset from {Telerik Reporting installation path}\Html5\ReportViewer folder to wwwroot. The complete report viewer page should look like this: 
    
      ````html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>
    <link href="http://cdn.kendostatic.com/2022.1.301/styles/kendo.common.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2022.1.301/styles/kendo.blueopal.min.css" rel="stylesheet" />
    <script src="telerikReportViewer.kendo-<token>buildversion</token>"></script>
    <script src="/api/reports/resources/js/telerikReportViewer-<token>buildversion</token>"></script>
    <style>
        #reportViewer1 {
            position: absolute;
            left: 5px;
            right: 5px;
            top: 50px;
            bottom: 5px;
            overflow: hidden;
            font-family: Verdana, Arial;
        }
    </style>
</head>
<body>
    <div id="reportViewer1">
        loading...
    </div>
    <script>
        $(document).ready(function () {
            $("#reportViewer1")
             .telerik_ReportViewer({
                    serviceUrl: "api/reports/",
                    reportSource: {
                        //report: "Telerik.Reporting.Examples.CSharp.ReportCatalog, CSharp.ReportLibrary",
                        report: "Barcodes Report.trdp",
                        parameters: {}
                    },
                    viewMode: telerikReportViewer.ViewModes.INTERACTIVE,
                    scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,
                    scale: 1.0
                });
        });
    </script>
</body>
</html>
````

    >The reference to the report viewer's JavaScript file (*telerikReportViewer-x.x.x.x.min.js*) should be updated to the corresponding version of the Reporting NuGet package. 

1. Set the launchSettings.json launchUrl to the new HTML page. 

1. Finally, run the project to see the report. 
