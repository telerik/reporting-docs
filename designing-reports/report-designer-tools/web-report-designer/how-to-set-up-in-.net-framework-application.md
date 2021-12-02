---
title: How to set up in .NET Framework application
page_title: How to set up in .NET Framework application | for Telerik Reporting Documentation
description: How to set up in .NET Framework application
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-framework-application
tags: how,to,set,up,in,.net,framework,application
published: True
position: 4
---

# How to set up in .NET Framework application



This article shows how to integrate our [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})         in an ASP.NET MVC application.       

## Prerequisites

The following list describes the prerequisites for this guide:

1. Create a sample ASP.NET MVC Project.             

1. Add the *Telerik.WebReportDesigner.Services*  NuGet package. It has dependencies on other Telerik Reporting                NuGet packages but they will be automatically added to your project.             

1. Update the *Microsoft.AspNet.WebApi.WebHost*  NuGet package to version 5.2.7 or later.           

When you use NuGet packages, the dependencies will be automatically resolved . Otherwise, you need to add them manually to the project.           For more information, see [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).         

>note If you need to enable users to export reports in Office OpenXML document formats (XLSX, DOCX and PPTX), you must install the              [DocumentFormat.OpenXML](https://www.nuget.org/packages/DocumentFormat.OpenXml/)              and the Telerik.Reporting.OpenXmlRendering NuGet packages. For more information about the required package versions,             see [Deploying Open XML](25b584e0-8dd7-4cfd-8878-ffe5e0a95ad4#deploying_open_xml_sdk_for_ms_office).           


## Setting up the Report Designer REST service:

The REST service works as a backend and is responsible for storage operations like creating, opening, or saving report definitions.            The following steps describe how to configure it:         

1. Implement a Report Designer controller. Right-click on the __Controllers__                folder and add a new item: __Add__  > __New item__  > __Web API Controller Class__  item.               Name it __ReportDesignerController__ . This will be our Telerik Web Report Designer REST service in the               project.             

1. Inherit the  [ReportDesignerControllerBase](/reporting/api/Telerik.Reporting.Services.WebApi.ReportDesignerControllerBase)  type               and setup the `ReportServiceConfiguration` instance. Notice that there is another configuration               instance named `ReportDesignerServiceConfiguration`, which will initialize the definition storage.               This is the class, responsible for opening, saving etc. the report definitions. This is how a basic               implementation of the controller should look like:             

	
      ````c#
namespace CSharp.MvcDemo.Controllers
{
    using System;
    using System.IO;
    using System.Web;
    using System.Web.Http;
    using Telerik.Reporting.Cache.File;
    using Telerik.Reporting.Services;
    using Telerik.Reporting.Services.WebApi;
    using Telerik.WebReportDesigner.Services;
    using Telerik.WebReportDesigner.Services.Controllers;
    //The class name determines the service URL. 
    //ReportsController class name defines /api/report/ service URL.
    [Route("api/reportdesigner")]
    public class ReportDesignerController : ReportDesignerControllerBase
    {
        static ReportServiceConfiguration configurationInstance;
        static ReportDesignerServiceConfiguration designerConfigurationInstance;
        static ReportDesignerController()
        {
            //This is the folder that contains the report definitions
            //In this case this is the Reports folder
            var appPath = HttpContext.Current.Server.MapPath("~/");
            var reportsPath = Path.Combine(appPath, "Reports");
            //Add report source resolver for trdx/trdp report definitions, 
            //then add resolver for class report definitions as fallback resolver; 
            //finally create the resolver and use it in the ReportServiceConfiguration instance.
            var resolver = new UriReportSourceResolver(reportsPath);
		      	//Setup the ReportServiceConfiguration
            configurationInstance = new ReportServiceConfiguration
            {
                HostAppId = "Html5App",
                Storage = new FileStorage(),
                ReportSourceResolver = resolver,
                ReportSharingTimeout = 1000,
                ClientSessionTimeout = 20,
            };
            designerConfigurationInstance = new ReportDesignerServiceConfiguration
            {
                DefinitionStorage = new FileDefinitionStorage(reportsPath),
                SettingsStorage = new FileSettingsStorage(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Telerik Reporting"))
            };
        }
        public ReportDesignerController()
        {
			      //Initialize the service configuration
            this.ReportServiceConfiguration = configurationInstance;
            this.ReportDesignerServiceConfiguration = designerConfigurationInstance;
        }
    }
}
````



## Adding the Web Report Designer:

1. Navigate to __Views__  -> __Home__  and add a new CSHTML Page for the Web Report Designer. Name the file __Index.cshtml__ .               Add the required references to load the font, jQuery, Telerik Kendo UI libraries,               telerikReportViewer and webReportDesigner scripts listed in the example below. Finally,               add the initialization of the telerik_WebReportDesigner widget. Note that the Web Report Designer container has a minimum width of 1200px.             The complete report viewer page should look like this:

	
      ````html
@using Telerik.Reporting
@{
    Layout = null;
}
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
    <script src="/api/reportdesigner/resources/js/telerikReportViewer"></script>
    <script src="/api/reportdesigner/designerresources/js/webReportDesigner"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#webReportDesigner").telerik_WebReportDesigner({
                persistSession: false,
                toolboxArea: {
                    layout: "list"
                },
                serviceUrl: "/api/reportdesigner/",
                report: "SampleReport.trdp"
            }).data("telerik_WebDesigner");
        });
    </script>
</body>
</html>
````

The *ReportDesignerController*  we added above is configured to search for its reports in a sub-folder                named __Reports__ .               The Report Designer widget we just configured will try to load a report named __SampleReport.trdp__ .               Add a new folder named __Reports__  to the solution and add an existing report named __SampleReport.trdp__  in it.             

1. Register the *ReportsControllerConfiguration*  and *ReportDesignerControllerConfiguration*  routes in                the `Application_Start()` method of the __Global.asax__  file.               It is important to register them before the default routes as shown below:             

	
      ````html
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            Telerik.Reporting.Services.WebApi.ReportsControllerConfiguration.RegisterRoutes(System.Web.Http.GlobalConfiguration.Configuration);
            Telerik.WebReportDesigner.Services.WebApi.ReportDesignerControllerConfiguration.RegisterRoutes(System.Web.Http.GlobalConfiguration.Configuration);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
````



1. In case the reports shown in the viewer need access to a database, add the necessary connection strings to the __web.config__  file.             

1. Finally, run the project to preview the web designer.             

# See Also

