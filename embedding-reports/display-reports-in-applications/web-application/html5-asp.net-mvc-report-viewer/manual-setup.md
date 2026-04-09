---
title: Manual Setup
page_title: Manually Setting Up the HTML5 MVC Report Viewer
description: "Learn how the Telerik Reporting HTML5 MVC Report Viewer can be manually set up in an ASP.NET MVC project with a few simple steps."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/manual-setup
tags: manual,setup
published: True
reportingArea: MVCWrapper
position: 3
previous_url: /html5-mvc-report-viewer-embedding
---

# Manual Setup Overview

This tutorial shows how to use HTML5 Report Viewer's ASP.NET MVC wrapper in `ASP.NET MVC 4|5` applications. To add the HTML5 MVC Report Viewer via the Visual Studio item template check the [Quick Start](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/how-to-use-html5-asp.net-mvc-report-viewer-with-rest-service) article.

## Prerequisites

- Review the HTML5 Report Viewer [System Requirements](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support).
- A running application that hosts a Reporting REST service at address `/api/reports`. For more information, see [Telerik Reporting REST Services](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview).
- Copy of the "Product Catalog.trdp" report file from `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\Examples` placed in the folder used by the [UriReportSourceResolver](/api/telerik.reporting.services.urireportsourceresolver) in the Reporting REST service implementation.
- Entry with the default connection string used by Telerik Reporting sample reports in the `web.config` file of the project hosting the Reporting REST service:

	```XML
	<connectionStrings>
	<add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
		connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
		providerName="System.Data.SqlClient" />
	</connectionStrings>
	```

* [Kendo UI for jQuery](https://www.telerik.com/kendo-jquery-ui) custom distribution for Telerik Reporting (located in `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportViewer\js`) or [Kendo UI for jQuery](https://www.telerik.com/kendo-jquery-ui) mainstream distribution downloaded locally or via the [Reporting CDN service](slug:telerikreporting/getting-started/installation/cdn-assets). You must load only one version of Kendo UI styles and scripts on the page. For more information, see [Kendo Widgets Requirements](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support#kendo-widgets-requirements).

Depending on the used Visual Studio project template, CSS and JS files can be linked in:

- The `HEAD` element of the HTML document in the view, if the view is used as a standalone page.
- The `HEAD` element of the layout page, if the view uses a layout page.
- In a named section in the view, if the view uses a layout page, where sections are rendered by calling [WebViewPage.RenderSection Method](<https://learn.microsoft.com/en-us/previous-versions/aspnet/gg480694(v=vs.118)>) in the layout page.

## Using HTML5 ASP.NET MVC Report Viewer

The following steps produce a view with settings similar to these of the local `AspNetMvcIntegrationDemo` project, installed by default under `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp\.NET Framework\AspNetMvcIntegrationDemo`. The structure used in this tutorial is a _view_ that uses a _layout_ page.

> All path references in the described steps should be adapted according to your project setup. For more information, please refer to the MSDN article [ASP.NET Web Project Paths](<https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)>).

1. Create new ASP.NET MVC 4|5 Web Application - [Getting started with ASP.NET MVC 5](https://learn.microsoft.com/en-us/aspnet/mvc/overview/getting-started/introduction/getting-started).

1. To ensure that the browser will start in the latest rendering mode verify the view's layout page is using the following `DOCTYPE` directive:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\MvcViewerManualSetup.html region=MvcViewerUsingHtml5AspnetMvcReportViewer}}

	> The above `DOCTYPE` directive should be considered with your custom requirements. More details about the one used in the tutorial settings for the page can be found in the [Defining document compatibility](<https://learn.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/compatibility/cc288325(v=vs.85)>) MSDN article.

1. Initialize the browser’s viewport in the `<head>` element:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerStyling.html region=Html5ViewerViewportMeta}}

	The viewport `META` tag is used to control layout on mobile browsers.

1. The default viewer implementation depends externally on **jQuery**. Create a section named **scripts** and add link to jQuery in the view:

	{{source=CodeSnippets\MvcCS\Views\Home\LayoutRenderSections_2.cshtml region=JQuerySectionExample}}

	> jQuery must be loaded only once on the page. Before adding jQuery, verify that it is not already loaded from elsewhere in the application (layout page, section or bundle).

1. Add a reference to a [Telerik Kendo UI SASS-Based Theme](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) in the `<head>` element:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5ViewerStyling.html region=Html5ViewerKendoThemeCss}}

1. Add references to the following assemblies and set their **Copy Local** properties to **true** in Visual Studio:

	- `Telerik.Reporting`
	- `Telerik.ReportViewer.Mvc`
	- `Newtonsoft.Json, Version 13.0.0.0 or higher`

	The Telerik Reporting assemblies are available by default in the folder `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Bin`.

	> Without setting Telerik Reporting references' `Copy Local` to `true`, the assemblies may not be loaded correctly on running the application.

1. Update the `web.config` file in the **Views** folder to include the `Telerik.Reporting` and `Telerik.ReportViewer.Mvc` namespaces:

	```XML
	<system.web.webPages.razor>
	<pages pageBaseType="System.Web.Mvc.WebViewPage">
			<namespaces>
			<add namespace="Telerik.Reporting" />
			<add namespace="Telerik.ReportViewer.Mvc" />
			</namespaces>
	</pages>
	</system.web.webPages.razor>
	```

	> Without registering the `Telerik.Reporting` and `Telerik.ReportViewer.Mvc` namespaces you will need to use [using Directive](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/using-directive) in the view.

1. Add references to the HTML5 Report Viewer’s JavaScript file in the view:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\MvcViewerManualSetup.html region=MvcViewerUsingHtml5AspnetMvcReportViewer2}}

	The report viewer JavaScript should be referenced after any other Kendo widgets or bundles. If no Kendo widgets are utilized on the page, the report viewer will register a custom Kendo subset to enable the required Kendo widgets. The subset is served from the report service. If Kendo is used on the page or the CDN is prefered, please make sure the following widgets are referenced:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\MvcViewerManualSetup.html region=MvcViewerUsingHtml5AspnetMvcReportViewer3}}

1. Add the HTML5 ASP.NET MVC Report Viewer to the same view:

	{{source=CodeSnippets\MvcCS\Views\Home\Index.cshtml region=RazorExample}}
	{{source=CodeSnippets\MvcVB\Views\Home\Index.vbhtml region=RazorExample}}

	> note The above example uses deferred loading of the viewer to allow scripts to be handled properly, in case jQuery is not yet loaded on the page at the time the view is created. The used relative paths must be considered with the project's structure.

	> The viewer's `ReportSource` has four overloads allowing to specify report declaratively in code. The generated report's string description is sent and handled on the server by the [report source resolver used in the Reporting REST service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview). The above example uses `UriReportSource` and a path to TRDP file (report created in the Standalone Report Designer). This string description will be handled automatically by the [UriReportSourceResolver](/api/telerik.reporting.services.urireportsourceresolver).

1. Render the deferred initialization statement for the Report Viewer scripts (remember that they must be rendered after jQuery): In case that you do not need the script tag to be rendered just set to false the default argument.

	{{source=CodeSnippets\MvcCS\Views\Home\Index.cshtml region=DeferredScriptsExample}}
	{{source=CodeSnippets\MvcVB\Views\Home\Index.vbhtml region=DeferredScriptsExample}}

1. Make the viewer fill the entire browser window. Add the following style in the correspondingly named section in the view:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\MvcViewerManualSetup.html region=MvcViewerUsingHtml5AspnetMvcReportViewer4}}

	> The above CSS rule will be applied on the `<div>` element holding the viewer object. The HTML elements building the viewer object will be sized based on the size of this container `<div>` element. To make the viewer fit in other container use relative position, and provide witdh and height values.

1. Open the layout page and call the `RenderSection` helper method in the `<head>` element. The method must be called for each named section in the view with the viewer - _scripts section_ and _styles section_.

	{{source=CodeSnippets\MvcCS\Views\Home\LayoutRenderSections_1.cshtml region=RenderSectionsExample}}

1. Finally the layout page should look like this:

	{{source=CodeSnippets\MvcCS\Views\Home\LayoutRenderSections.cshtml region=LayoutPageExample}}

	The page with the HTML5 ASP.NET MVC Report Viewer should look like this:

	{{source=CodeSnippets\MvcCS\Views\Home\MvcViewerFullPage.cshtml region=MvcViewerFullPageExample}}

1. Run the project and navigate to the view with the HTML5 ASP.NET MVC Report Viewer that we have just created.
