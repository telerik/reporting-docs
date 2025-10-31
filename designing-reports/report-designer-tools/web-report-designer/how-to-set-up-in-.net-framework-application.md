---
title: Set up in ASP.NET Framework
page_title: Configure web report designer in ASP.NET Framework
description: "Learn how to configure the web report designer and its controller in the same ASP.NET Framework application."
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-framework-application
tags: how,to,set,up,in,.net,framework,application
published: True
reportingArea: WRDHTML5, WRDRestService
position: 4
previous_url: /web-report-designer-setup-in-dot-net-framework
---

# Configuring the Web Report Designer in ASP.NET Framework application

This article shows how to integrate our [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) in an ASP.NET application.

## Prerequisites

The following list describes the prerequisites for this guide:

1. Create a sample ASP.NET MVC Project.
1. Add the *Telerik.WebReportDesigner.Services* NuGet package. It has dependencies on other Telerik Reporting NuGet packages but they will be automatically added to your project.
1. Update the *Microsoft.AspNet.WebApi.WebHost* NuGet package to version 5.2.7 or later.

When you use NuGet packages, the dependencies will be automatically resolved. Otherwise, you need to add them manually to the project. For more information, see [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).

> If you need to enable users to export reports in Office OpenXML document formats (XLSX, DOCX and PPTX), you must install the [DocumentFormat.OpenXML](https://www.nuget.org/packages/DocumentFormat.OpenXml/) and the Telerik.Reporting.OpenXmlRendering NuGet packages. For more information about the required package versions, see [Deploying Open XML]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}#deploying-open-xml).

## Setting up the Report Designer REST service:

The REST service works as a backend and is responsible for storage operations like creating, opening, or saving report definitions. The following steps describe how to configure it:

1. Implement a Report Designer controller. Right-click on the `Controllers` folder and add a new item: __Add__ > __New item__ > __Web API Controller Class__ item. Name it `ReportDesignerController`. This will be our Telerik Web Report Designer REST service in the project.
1. Inherit the [ReportDesignerControllerBase](/api/Telerik.WebReportDesigner.Services.Controllers.ReportDesignerControllerBase)  type and setup the `ReportServiceConfiguration` instance. Notice that there is another configuration instance named `ReportDesignerServiceConfiguration`, which will initialize the definition storage. This is the class, responsible for opening, saving etc. the report definitions. This is how a basic implementation of the controller should look like:

	````C#
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

	````VB.NET
Imports System.IO
	Imports Telerik.Reporting.Services
	Imports Telerik.WebReportDesigner.Services
	Imports Telerik.WebReportDesigner.Services.Controllers

	'The class name determines the service URL.
	Public Class ReportDesignerController
		Inherits ReportDesignerControllerBase

		Shared ReadOnly configurationInstance As ReportServiceConfiguration
		Shared ReadOnly designerConfigurationInstance As ReportDesignerServiceConfiguration

		Shared Sub New()
			'This is the folder that contains the report definitions
			'In this case this is the Reports folder
			Dim appPath = HttpContext.Current.Server.MapPath("~/")
			Dim reportsPath = Path.Combine(appPath, "Reports")
			'Add report source resolver for trdx/trdp report definitions,
			'then add resolver for class report definitions as fallback resolver;
			'finally create the resolver and use it in the ReportServiceConfiguration instance.
			Dim resolver = New UriReportSourceResolver(reportsPath).AddFallbackResolver(New TypeReportSourceResolver())

			Dim reportServiceConfiguration As New ReportServiceConfiguration()
			reportServiceConfiguration.HostAppId = "Html5App"
			reportServiceConfiguration.ReportSourceResolver = resolver
			reportServiceConfiguration.Storage = New Telerik.Reporting.Cache.File.FileStorage()
			configurationInstance = reportServiceConfiguration

			Dim designerServiceConfiguration As New ReportDesignerServiceConfiguration()
			designerServiceConfiguration.DefinitionStorage = New FileDefinitionStorage(reportsPath)
			designerServiceConfiguration.SettingsStorage = New FileSettingsStorage(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), "Telerik Reporting"))
			designerConfigurationInstance = designerServiceConfiguration
		End Sub

		Public Sub New()
			'nitialize the service configuration
			Me.ReportServiceConfiguration = configurationInstance
			Me.ReportDesignerServiceConfiguration = designerConfigurationInstance

		End Sub
	End Class
````


## Adding the Web Report Designer:

1. Navigate to `Views` -> `Home` and add a new CSHTML Page for the Web Report Designer. Name the file `Index.cshtml`. Add the required references to load the font, jQuery, Telerik Kendo UI libraries, telerikReportViewer, and webReportDesigner scripts listed in the example below. Finally, add the initialization of the telerik_WebReportDesigner widget. Note that the Web Report Designer container has a minimum width of 1200px. The complete report viewer page should look like this:

	````cshtml
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.all.min.js"></script>
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

	````vbhtml
@Imports Telerik.Reporting
	@Code
		Layout = Nothing
	End Code
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
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.all.min.js"></script>
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

	> The `kendo.all.min.js` script from the Kendo CDN includes all Kendo UI for jQuery components and requires a valid Kendo UI license, which may display license warnings. To avoid this, Telerik Reporting includes a license-free subset containing only the Kendo UI components required by the Web Report Designer. You can copy this file from your installation directory at `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportDesigner\js\webReportDesigner.kendo-{{site.buildversion}}.min.js` and reference it locally in your project instead of the CDN version.


	The *ReportDesignerController* we added above is configured to search for its reports in a sub-folder named `Reports`. The Report Designer widget we just configured will try to load a report named `SampleReport.trdp`. Add a new folder named `Reports` to the solution and add an existing report named `SampleReport.trdp` to it.

1. Register the *ReportsControllerConfiguration* and *ReportDesignerControllerConfiguration* routes in the `Application_Start()` method of the `Global.asax` file. It is important to register them before the default routes as shown below:

	````C#
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

	````VB.NET
Imports System.Web.Optimization
	
	Public Class MvcApplication
		Inherits System.Web.HttpApplication

		Sub Application_Start()
			AreaRegistration.RegisterAllAreas()
			FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters)

			Telerik.Reporting.Services.WebApi.ReportsControllerConfiguration.RegisterRoutes(System.Web.Http.GlobalConfiguration.Configuration)
			Telerik.WebReportDesigner.Services.WebApi.ReportDesignerControllerConfiguration.RegisterRoutes(System.Web.Http.GlobalConfiguration.Configuration)

			RouteConfig.RegisterRoutes(RouteTable.Routes)
			BundleConfig.RegisterBundles(BundleTable.Bundles)
		End Sub
	End Class
````


1. In case the reports shown in the viewer need access to a database, add the necessary connection strings to the `web.config` file.
1. Finally, run the project to preview the web designer.
