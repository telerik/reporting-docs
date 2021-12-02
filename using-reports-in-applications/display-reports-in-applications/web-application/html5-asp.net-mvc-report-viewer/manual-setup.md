---
title: Manual Setup
page_title: Manual Setup | for Telerik Reporting Documentation
description: Manual Setup
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-mvc-report-viewer/manual-setup
tags: manual,setup
published: True
position: 3
---

# Manual Setup



This tutorial shows how to use HTML5 Report Viewer's ASP.NET MVC wrapper in ASP.NET MVC 4|5 applications.         To add the HTML5 Report Viewer via Visual Studio item template check         [Quick Start]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/how-to-use-html5-asp.net-web-forms-report-viewer-with-rest-service%})

## Prerequisites

* Review the HTML5 Report Viewer [System Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}).             

* A running application that hosts a Reporting REST service at address /api/reports. For more information, see               [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).             

* Copy of the "Product Catalog.trdp" report file from __[TelerikReporting_InstallDir]\ReportDesigner\Examples__                in the folder used by the  [ReportFileResolver](/reporting/api/Telerik.Reporting.Services.WebApi.ReportFileResolver)                in the Reporting REST service implementation.             

* Entry with the default connection string used by Telerik Reporting sample reports in the __web.config__  file               of the project hosting the Reporting REST service:             

	
      ````xml
<connectionStrings>
	 <add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
	            connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
	            providerName="System.Data.SqlClient" />
</connectionStrings>
````



* Telerik Kendo UI custom distribution for Telerik Reporting (located in {Telerik Reporting installation path}\Html5\ReportViewer\js) or Kendo UI mainstream distribution downloaded locally or via  [Kendo UI CDN service](http://docs.telerik.com/kendo-ui/install/cdn) . You must load only one version of Telerik Kendo UI styles and scripts on the page.               For more information see [](143e5c03-e69d-416f-9ac0-85c397b22b8e#KendoWidgetsRequirements)

Depending on the used Visual Studio project template CSS and JS files can be linked in:         

* The HEAD element of the HTML document in the view, if the view is used as a standalone page.             

* The HEAD element of the layout page, if the view uses a layout page.             

* In a named section in the view, if the view uses a layout page, where sections are rendered by calling  [WebViewPage.RenderSection Method](https://msdn.microsoft.com/en-us/library/system.web.mvc.webviewpage.rendersection(v=vs.118).aspx)  in the layout page.             

## Using HTML5 ASP.NET MVC Report Viewer in a web application

The following steps produce a view with settings similar to these of the local MvcDemo project,           installed by default under __[TelerikReporting_InstallDir]\Examples__ .           The structure used in this tutorial is view that uses a layout page.         

>tip All path references in the described steps should be adapted according             to your project setup. For more information please refer to the MSDN article              [ASP.NET Web Project Paths](http://msdn.microsoft.com/en-us/library/ms178116.aspx) 


1. Create new ASP.NET MVC 4|5 Web Application.

1. To ensure that the browser will start in the latest rendering mode verify the view's layout page is using the following DOCTYPE directive:                 

	
    ````html
							<!DOCTYPE html>
````



    >tip The above DOCTYPE directive should be considered with your custom requirements. More details about the used in the tutorial settings for the page can be found in the                      [Defining document compatibility](http://msdn.microsoft.com/en-us/library/cc288325(v=vs.85).aspx)  MSDN article.                   



1. Initialize the browser’s viewport in the ```<head>``` element:

	
    ````html
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
````

    The viewport META tag is used to control layout on mobile browsers.    

1. The default viewer implementation depends externally on __jQuery__ .                   Create a section named __scripts__  and add link to jQuery in the view:                 

	
    ````html
@section scripts
{
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
}
````



    >tip jQuery must be loaded only once on the page. Before adding jQuery, verify that it is not already loaded from elsewhere in the application                     (layout page, section or bundle).                   



1. Add references to Telerik Kendo UI scripts and styles in the ```<head>``` element:

	
    ````html
<!-- the required Kendo styles -->                  
<link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.common.min.css" rel="stylesheet" />
<link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.blueopal.min.css" rel="stylesheet" />
````



1. Add references to
   + __Telerik.Reporting__ 

   + __Telerik.ReportViewer.Mvc__ 

   + __Newtonsoft.Json, Version 9.0.0.0 or higher__ 
    assemblies and set their __Copy Local__  properties to true in Visual Studio.                   The Telerik Reporting assemblies may be found by default in the folder __[TelerikReporting_InstallDir]\Bin__ .                 

    >tip Without setting Telerik Reporting references' Copy Local to true the assemblies may not be loaded correctly on running the application.



1. Update the __web.config__  file in the __Views__  folder to                   include the __Telerik.Reporting__  and __Telerik.ReportViewer.Mvc__                    namespaces:                 

	
    ````html
								<system.web.webPages.razor>
    								...
    								<pages pageBaseType="System.Web.Mvc.WebViewPage">
      									<namespaces>
        									...
        									<add namespace="Telerik.Reporting" />
        									<add namespace="Telerik.ReportViewer.Mvc" />        
      									</namespaces>
    								</pages>
  								</system.web.webPages.razor>
````



    >tip Without registering the  __Telerik.Reporting__  and  __Telerik.ReportViewer.Mvc__                      namespaces you will need to use  [using Directive](https://msdn.microsoft.com/en-us/library/sf0df423.aspx)  in the view.                   



1. Add references to the HTML5 Report Viewer’s JavaScript file in the view:                 

	
    ````html
<script src="~/api/reports/resources/js/telerikReportViewer"></script>
````

    The report viewer JavaScript should be referenced after any other Kendo widgets or bundles.                   If no Kendo widgets are utilized in the page the report viewer will register a custom Kendo                   subset to enable the required Kendo widgets. The subset is served from the report service.                     If Kendo is used on the page or the CDN is prefered make sure the following widgets are referenced:                 

	
    ````html
                  <!--
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.core.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.data.odata.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.data.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.userevents.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.selectable.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.calendar.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.fx.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.draganddrop.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.mobile.scroller.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.virtuallist.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.popup.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.list.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.combobox.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.datepicker.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.resizable.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.dropdownlist.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.multiselect.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.splitter.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.window.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.color.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.slider.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.button.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.colorpicker.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.editor.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.listview.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.menu.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.panelbar.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.tooltip.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.treeview.min.js"></script>
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.touch.min.js"></script>
kendo.mobile.min.js - optional, if gestures/touch support is required
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.mobile.min.js"></script>
kendo.all.min.js or kendo.web.min.js can be used as well if Kendo is used outside the report viewer
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.web.min.js"></script>
-->
````



1. Add the HTML5 ASP.NET MVC Report Viewer to the same view:

{{source=CodeSnippets\MvcCS\Views\Home\Index.cshtml region=RazorExample}}
````c#
	@(Html.TelerikReporting().ReportViewer()
	       .Id("reportViewer1")
	       .ServiceUrl("/api/reports/")
	       .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html")
	       .ReportSource(new UriReportSource() { Uri = "Product Catalog.trdp" })
	       .ViewMode(ViewMode.Interactive)
	       .ScaleMode(ScaleMode.Specific)
	       .Scale(1.0)
	       .PersistSession(false)
	       .EnableAccessibility(false)
	       .Deferred()
	       )
````
{{source=CodeSnippets\MvcVB\Views\Home\Index.vbhtml region=RazorExample}}
````vb.net
	@Code
	    Html.TelerikReporting().ReportViewer() _
	    .Id("reportViewer1") _
	    .ServiceUrl("/api/reports/") _
	    .TemplateUrl("/ReportViewer/templates/telerikReportViewerTemplate.html") _
	    .ReportSource(New UriReportSource() With {.Uri = "Product Catalog.trdp"}) _
	    .ViewMode(ViewMode.Interactive) _
	    .ScaleMode(ScaleMode.Specific) _
	    .Scale(1.0) _
	    .PersistSession(False) _
	    .EnableAccessibility(False) _
	    .Deferred()
	End Code
````



    >tip The above example uses deferred loading of the viewer to allow scripts to be handled properly,                     in case jQuery is not yet loaded on the page at the time the view is created.                     The used relative paths must be considered with the project's structure.                   



    >tip The viewer's  __ReportSource__  has 4 overloads allowing to specify report declaratively in code.                     The generated report's string description is sent and handled on the server by the                     [report source resolver used in the Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}).                     The above example uses UriReportSource and a path to TRDP file (report created in the Standalone Report Designer).                     This string description will be handled automatically by the  [ReportFileResolver](/reporting/api/Telerik.Reporting.Services.WebApi.ReportFileResolver) .                   



1. Render the deferred initialization statement for the Report Viewer scripts (remember that they must be rendered after jQuery):                   In case that you do not need the script tag to be rendered just set to false the default argument.                 

{{source=CodeSnippets\MvcCS\Views\Home\Index.cshtml region=DeferredScriptsExample}}
````c#
	@(Html.TelerikReporting().DeferredScripts())
````
{{source=CodeSnippets\MvcVB\Views\Home\Index.vbhtml region=DeferredScriptsExample}}
````vb.net
	@Code
	    Html.TelerikReporting().DeferredScripts()
	End Code
````



1. Make the viewer fill the entire browser window. Add the following style in the correspondingly named section in the view:                 

	
    ````html
									<style>
								       #reportViewer1 {
								            position: absolute;
								            left: 5px;
								            right: 5px;
								            top: 5px;
								            bottom: 5px;
								            overflow: hidden;
								        }
								    </style>
````



    >tip                   The above CSS rule will be applied on the ```<div>``` element holding the viewer object.                  The HTML elements building the viewer object will be sized based on the size of this container ```<div>``` element.                  To make the viewer fit in other container use relative position, and provide witdh and height values.                



1. Open the layout page and call the *RenderSection*  helper method in the                   *```<head>```*  element. The method must be called for each named section in the view with the viewer -                   *scripts section*  and *styles section* .                 

	
    ````html
@RenderSection("styles", required: false)
@RenderSection("scripts", required: false)
````



1. Finally the layout page should look like this:

	
    ````html
<!DOCTYPE html>
<html>
<head>
    <title>Demo</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    @RenderSection("styles", required: false)
    @RenderSection("scripts", required: false)
</head>
<body>
    @RenderBody()
</body>
</html>
````

    The page with the HTML5 ASP.NET MVC Report Viewer should look like this:

	
    ````html
@section styles
{           
    <link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.common.min.css" rel="stylesheet" />
    <link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.blueopal.min.css" rel="stylesheet" />
    <style>
       #reportViewer1 {
            position: absolute;
            left: 5px;
            right: 5px;
            top: 5px;
            bottom: 5px;
            overflow: hidden;
        }
    </style>
}
@section scripts
{
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="~/api/reports/resources/js/telerikReportViewer"></script>
    @(Html.TelerikReporting().DeferredScripts())
}
@(Html.TelerikReporting().ReportViewer()
        .Id("reportViewer1")
        .ServiceUrl("/api/reports/")
        .ReportSource(new UriReportSource() { Uri = "Product Catalog.trdp" })
        .Deferred()
)
````



1. Run the project and navigate to the view with the HTML5 ASP.NET MVC Report Viewer that we have just created.

# See Also

