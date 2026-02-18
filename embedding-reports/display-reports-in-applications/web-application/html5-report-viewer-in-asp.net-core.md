---
title: HTML5 Report Viewer in ASP.NET Core
page_title: HTML5 Report Viewer in ASP.NET Core
description: HTML5 Report Viewer in ASP.NET Core
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer-in-asp.net-core
tags: html5,report,viewer,in,asp.net,core
published: False
position: 8
reportingArea: General
---

# HTML5 Report Viewer in ASP.NET Core

> The following article applies to.NET Core projects that target the **full.NET Framework 4.0+**. If the project targets.NET Core 2.1+ please refer to the following articles:
>
> - [.NET Core Support]({%slug telerikreporting/using-reports-in-applications/dot-net-core-support%})
> - [Using Telerik Reporting in.NET Core Applications](https://www.telerik.com/blogs/using-telerik-reporting-in-net-core-applications)
> - [Manual Setup of HTML5 Report Viewer in an ASP.NET Core 2+ application.]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-in-an-asp.net-core-2.1-and-2.2-application%})
> - [Guidance for using reports from an existing.NET Framework 4+ report library in a.NET Core application]({%slug use-existing-report-library-in-net-core-app%})
> - [How to implement Telerik Reporting in ASP.NET Core 2.1 MVC]({%slug how-to-implement-telerik-reporting-in-asp-net-core-mvc%})

In case you are not familiar with ASP.NET Core, check it out on the [official page](https://www.asp.net/core).

Telerik Reporting ASP.NET Core packages are available as of Telerik Reporting R3 2016 SP1 release. They are built against the **full.NET Framework**.

Telerik NuGet Packages include the Reporting Engine and implementation of the [Reporting REST WebAPI based service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/overview%}). The packages do not include design-time support.

## Before you start

The Reporting engine relies on the GDI+ API available only on WindowsOS machines. Without the GDI+ API reports cannot be rendered.

If you need to have your ASP.NET Core Application targeting more platforms, you can add the [HTML5 Viewer as a JavaScript widget]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/manual-setup%}), which does not require any Telerik NuGet packages. The Reporting REST service can be hosted separately on a Windows OS machine, where the HTML5 Viewer will need the address of the service to display content produced on the remote machine.

More details about hosting the Reporting REST Service are available in [How to Add Telerik Reporting REST Web API to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application%}) and [How to Self Host Telerik Reporting REST Web API]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-self-host-telerik-reporting-rest-web-api%}).

> You might exprience issues with displaying images in the report if using ASP.NET Core **1.1.0** due to the way the requests are handled. It is recommended to upgrade to a newer version of ASP.NET Core - [.NET Core releases](https://github.com/dotnet/core/releases)

## Prerequisites

To be able to create the sample application on Windows, make sure you provide the requirements listed below.

- [Visual Studio 2015 Update 3](https://www.visualstudio.com/en-us/news/releasenotes/vs2015-update3-vs)

- [NET Core 1.1.7 SDK](https://www.microsoft.com/net/core#windows)

## Creating a Sample ASP.NET Core Project

1. Open **Visual Studio 2015 Update 3**.
1. From the **File** menu, select **New** > **Project**.
1. In the **New Project** dialog, expand **Installed > Templates > Visual C# > Web**, and select **ASP.NET Core Web Application** project template. Choose a name for the project and click **OK**.
1. From the **ASP.NET Core Templates** select **Web Application**.

## Getting Ready to Add Telerik Reporting

You will have to prepare the project for Telerik Reporting.

Open the **project.json** file. The "frameworks" property should look like this:

```JSON
"frameworks": {
    "net461": { }
},
```

The above setting is required since Telerik Reporting supports only the full.NET framework. Note, that using multiple target frameworks will force Visual Studio to build your project as if it will run on all frameworks, and ultimately you will not be able to start it.

## Adding the NuGet Packages

ASP.NET Core does not support references to assemblies, but instead works with references to NuGet packages. To setup the Reporting REST service you have to download **Telerik.Reporting** and **Telerik.Reporting.Services.AspNetCore** NuGet packages from the private Telerik NuGet feed at [https://nuget.telerik.com/v3/index.json](https://nuget.telerik.com/v3/index.json). How to add a NuGet feed is explained in [https://www.visualstudio.com/en-us/docs/package/nuget/consume](https://www.visualstudio.com/en-us/docs/package/nuget/consume)

You will need to enter [your Telerik account](https://www.telerik.com/account) credentials for this operation.

For Office OpenXML document formats (XLSX, DOCX and PPTX) install the [DocumentFormat.OpenXML](https://www.nuget.org/packages/DocumentFormat.OpenXml/) NuGet package. The package support out of the box version 2.7.2.0. For newer versions [binding redirect](<http://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx>) in the app.config is required.

## Setting up the REST service

1. In your project, right-click **References**, choose **Manage NuGet Packages** and from the drop down menu, select Telerik private feed.
1. Install **Telerik.Reporting** and **Telerik.Reporting.Services.AspNetCore** NuGet packages, which will give you the functionality for the Telerik Reporting REST Service and the Reporting engine.
1. Implement a Reports controller. Right-click on the **Controllers** folder and add a new item: Add - New item - Installed - ASP.NET - **Web API Controller Class** item. Name it ReportsController.

   This will be our Telerik Reporting REST service in the project. You will have to inherit the **ReportsControllerBase** type and provide proper settings for the service's ReportResolver and Storage.

   This is how a basic implementation of the controller should look like:

   ```C#
   namespace WebApplication1.Controllers
   {
   	using System.IO;
   	using Microsoft.AspNetCore.Hosting;
   	using Telerik.Reporting.Cache.File;
   	using Telerik.Reporting.Services;
   	using Telerik.Reporting.Services.AspNetCore;
   	public class ReportsController : ReportsControllerBase
   	{
   		public ReportsController(IHostingEnvironment environment)
   		{
   			var reportsPath =
   				Path.Combine(environment.WebRootPath, "Reports");
   			this.ReportServiceConfiguration =
   				new ReportServiceConfiguration
   				{
   					HostAppId = "Html5DemoApp",
   					Storage = new FileStorage(),
   					ReportResolver = new ReportFileResolver(reportsPath),
   					// ReportSharingTimeout = 0,
   					// ClientSessionTimeout = 15,
   				};
   		 }
   	}
   }
   ```

1. After the Reports controller is set up, you have to create an MVC page view with the HTML5 report viewer. To do so, open the HomeController, added by the VS ASP.NET Core project template, and add an action method named Report:

   ```C#
   public IActionResult Report()
   {
   	ViewBag.Message = "Your reports page.";
   	return View();
   }
   ```

## Adding the HTML5 Report Viewer

1. To set up a folder for the reports, right-click on _wwwroot_ and select **Add > New Folder**.

   Name the folder **Reports** and add sample reports in TRDP format for easiness.

   You can find sample reports in _{Telerik Reporting installation path}\Report Designer\Examples_ if you have an existing installation of the Telerik Reporting product. Note that the name of the folder is considered with the folder path used by the ReportFileResolver in the ReportsController.

   This tutorial will use **Barcodes Report.trdp** in all examples.

1. Add a view that contains the HTML5 Report Viewer.

   Open the **Views** folder, right-click on the **Home** folder and select **Add > New Item > Installed > ASP.NET**.

   Then add a new **MVC View Page** named **Report**. We want the Report action in the HomeController to target this view.

1. Add the HTML5 Report Viewer. For a detailed explanation, check the HTML5 Report Viewer [Manual Setup]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/manual-setup%}) help article in the online documentation.

   The required references to jQuery and Telerik Kendo UI CSS and JS files are listed in the example below. Copy the Kendo subset from {Telerik Reporting installation path}\Html5\ReportViewer folder to wwwroot.

   > Whenever you need to route a relative path you will have to use _Url.Content_ helper, like this:
   >
   > ```CSHTML
   > @Url.Content("~/api/reports/")
   > ```
   >
   > instead of simply pasting the path.

   The complete Report view (Report.cshtml) should look like this:

   ```CSHTML
   @{
   	Layout = null;
   }
   <!DOCTYPE html>
   <html>
   <head>
   	<title>APS.NET Core HTML5 Report Viewer Demo</title>
   	<meta charset="utf-8" />
   	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
   	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>>
   	<link href="https://kendo.cdn.telerik.com/2022.1.301/styles/kendo.common.min.css" rel="stylesheet" />
   	<link href="https://kendo.cdn.telerik.com/2022.1.301/styles/kendo.blueopal.min.css" rel="stylesheet" />
   	<!-- the required Kendo subset is located in {Telerik Reporting installation path}\Html5\ReportViewer\js -->
   	<script src="/ReportViewer/js/telerikReportViewer.kendo-x.x.x.x.min.js"></script>>
   	<script src="/api/reports/resources/js/telerikReportViewer-16.0.22.119.min.js"></script>>
   	<style>
   		#reportViewer1 {
   			position: absolute;
   			left: 5px;
   			right: 5px;
   			top: 5px;
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
   	<script type="text/javascript">
   		$(document).ready(function () {
   			$("#reportViewer1")
   			 .telerik_ReportViewer({
   					// The URL of the service which will serve reports.
   					// The URL corresponds to the name of the controller class (ReportsController).
   					// For more information on how to configure the service please check http://www.telerik.com/help/reporting/telerik-reporting-rest-conception.html.
   					serviceUrl: '@Url.Content("~/api/reports/")',
   					// The URL for the report viewer template. The template can be edited -
   					// new functionalities can be added and unneeded ones can be removed.
   					// For more information please check http://www.telerik.com/help/reporting/html5-report-viewer-templates.html.
   					@*templateUrl: '@Url.Content("~/ReportViewer/templates/telerikReportViewerTemplate-FA.html")',*@
   					//ReportSource - report description
   					reportSource: {
   						// The report can be set to a report file name
   						// or CLR type name (report class definition).
   						report: "Barcodes Report.trdp",
   						// Parameters name value dictionary
   						parameters: {}
   					},
   					// Specifies whether the viewer is in interactive or print preview mode.
   					// PRINT_PREVIEW - Displays the paginated report as if it is printed on paper. Interactivity is not enabled.
   					// INTERACTIVE - Displays the report in its original width and height without paging. Additionally interactivity is enabled.
   					viewMode: telerikReportViewer.ViewModes.INTERACTIVE,
   					// Sets the scale mode of the viewer.
   					// Three modes exist currently:
   					// FIT_PAGE - The whole report will fit on the page (will zoom in or out), regardless of its width and height.
   					// FIT_PAGE_WIDTH - The report will be zoomed in or out so that the width of the screen and the width of the report match.
   					// SPECIFIC - Uses the scale to zoom in and out the report.
   					scaleMode: telerikReportViewer.ScaleModes.SPECIFIC,
   					// Zoom in and out the report using the scale
   					// 1.0 is equal to 100%, i.e. the original size of the report
   					scale: 1.0,
   				});
   		});
   	</script>
   </body>
   </html>
   ```

   > The reference to the report viewer's JavaScript file (_telerikReportViewer-_) should be updated to the corresponding version of the Reporting NuGet package.

1. To add a link to the **Report** view in the **Home** page navigation open _Views\Shared_Layout.cshtml_ page and add:

   ```HTML
   <li><a asp-area="" asp-controller="Home" asp-action="Report">Report</a></li>
   ```

   list item to the navigation. It should become like this:

   ```HTML
   <li><a asp-area="" asp-controller="Home" asp-action="Index">Home</a></li>
   <li><a asp-area="" asp-controller="Home" asp-action="About">About</a></li>
   <li><a asp-area="" asp-controller="Home" asp-action="Contact">Contact</a></li>
   <li><a asp-area="" asp-controller="Home" asp-action="Report">Report</a></li>
   ```

## Connection Strings and Engine Configuration

Telerik Reporting relies on the ConfigurationManager to resolve named connection strings and to configure the reporting engine. Thus if you have any named connectionstrings or Telerik Reporting configuration you have to add **app.config** configuration file to the project's root. For more information see: [Overview]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}).

Finally, run the project and navigate to the **Report** view to see the report.
