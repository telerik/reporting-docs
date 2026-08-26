---
title: Set up in ASP.NET Framework
page_title: Configure web report designer in ASP.NET Framework
description: "Learn how to configure the web report designer and its controller in the same ASP.NET Framework application."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-framework-application
tags: how,to,set,up,in,.net,framework,application
published: True
reportingArea: WRDHTML5, WRDRestService
components: [wrdhtml5, wrdrestservice]
position: 4
previous_url: /web-report-designer-setup-in-dot-net-framework
---

# Configuring the Web Report Designer in ASP.NET Framework application

This article shows how to integrate our [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview) in an ASP.NET application.

## Prerequisites

The following list describes the prerequisites for this guide:

1. Create a sample ASP.NET MVC Project.
1. Add the _Telerik.WebReportDesigner.Services_ NuGet package. It has dependencies on other Telerik Reporting NuGet packages but they will be automatically added to your project.
1. Update the _Microsoft.AspNet.WebApi.WebHost_ NuGet package to version 5.2.7 or later.

When you use NuGet packages, the dependencies will be automatically resolved. Otherwise, you need to add them manually to the project. For more information, see [How to add the Telerik private NuGet feed to Visual Studio](slug:telerikreporting/using-reports-in-applications/install-with-nuget-packages).

> If you need to enable users to export reports in Office OpenXML document formats (XLSX, DOCX and PPTX), you must install the [DocumentFormat.OpenXML](https://www.nuget.org/packages/DocumentFormat.OpenXml/) and the Telerik.Reporting.OpenXmlRendering NuGet packages. For more information about the required package versions, see [Deploying Open XML](slug:telerikreporting/using-reports-in-applications/third-party-dependencies#deploying-open-xml).

## Setting up the Report Designer REST service:

The REST service works as a backend and is responsible for storage operations like creating, opening, or saving report definitions. The following steps describe how to configure it:

1. Implement a Report Designer controller. Right-click on the `Controllers` folder and add a new item: **Add** > **New item** > **Web API Controller Class** item. Name it `ReportDesignerController`. This will be our Telerik Web Report Designer REST service in the project.
1. Inherit the [ReportDesignerControllerBase](/api/Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase) type and setup the `ReportServiceConfiguration` instance. Notice that there is another configuration instance named `ReportDesignerServiceConfiguration`, which will initialize the definition storage. This is the class, responsible for opening, saving etc. the report definitions. This is how a basic implementation of the controller should look like:

   {{source=CodeSnippets\MvcCS\Controllers\ReportDesignerController.cs region=WebReportDesignerController}}
   {{source=CodeSnippets\MvcVB\Controllers\WebReportDesignerControllerSnippet.vb region=WebReportDesignerController}}

## Adding the Web Report Designer:

1. Navigate to `Views` -> `Home` and add a new CSHTML Page for the Web Report Designer. Name the file `Index.cshtml`. Add the required references to load the font, jQuery, Telerik Kendo UI libraries, telerikReportViewer, and webReportDesigner scripts listed in the example below. Finally, add the initialization of the telerik_WebReportDesigner widget. Note that the Web Report Designer container has a minimum width of 1200px. The complete report viewer page should look like this:

   {{source=CodeSnippets\MvcCS\Views\Home\WebReportDesignerSetup.cshtml region=WebReportDesignerExample}}
   {{source=CodeSnippets\MvcVB\Views\Home\WebReportDesignerSetup.vbhtml region=WebReportDesignerExample}}

   The _ReportDesignerController_ we added above is configured to search for its reports in a sub-folder named `Reports`. The Report Designer widget we just configured will try to load a report named `SampleReport.trdp`. Add a new folder named `Reports` to the solution and add an existing report named `SampleReport.trdp` to it.

1. Register the _ReportsControllerConfiguration_ and _ReportDesignerControllerConfiguration_ routes in the `Application_Start()` method of the `Global.asax` file. It is important to register them before the default routes as shown below:

   {{source=CodeSnippets\MvcCS\Global.asax.cs region=RegisterReportDesignerRoutes}}
   {{source=CodeSnippets\MvcVB\Global.asax.vb region=RegisterReportDesignerRoutes}}

1. In case the reports shown in the viewer need access to a database, add the necessary connection strings to the `web.config` file.
1. Finally, run the project to preview the web designer.
