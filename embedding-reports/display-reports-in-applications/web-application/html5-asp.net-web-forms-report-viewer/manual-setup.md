---
title: Manual Setup
page_title: Manual Setup of the HTML5 ASP.NET Web Forms Report Viewer
description: "Learn how to setup manually the Telerik Reporting HTML5 ASP.NET Web Forms Report Viewer in ASP.NET 4 Web Forms applications."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/manual-setup
tags: manual,setup
published: True
reporting_area: WebFormsWrapper
position: 3
previous_url: /html5-webforms-report-viewer-manual-setup
---

# Manual Setup of the HTML5 ASP.NET Web Forms Report Viewer in ASP.NET 4 Web Forms applications

## Prerequisites

- Review the HTML5 Report Viewer [System Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}).
- Copy of the "Product Catalog.trdp" report file from `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Report Designer\Examples` placed in the folder used by the [UriReportSourceResolver](/api/telerik.reporting.services.urireportsourceresolver) in the Reporting REST service implementation.
- Entry with the default connection string used by Telerik Reporting sample reports in the **web.config** file of the project hosting the Reporting REST service:

  ```XML
  <connectionStrings>
  	<add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
  		 connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
  		 providerName="System.Data.SqlClient" />
  </connectionStrings>
  ```

* (Optional) [Kendo UI for jQuery](https://www.telerik.com/kendo-jquery-ui) custom distribution for Telerik Reporting (located in `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Html5\ReportViewer\js`) or [Kendo UI for jQuery](https://www.telerik.com/kendo-jquery-ui) mainstream distribution downloaded locally or via the [Reporting CDN service]({%slug telerikreporting/getting-started/installation/cdn-assets%}). You must load only one version of Kendo UI styles and scripts on the page. For more information, see [Kendo Widgets Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}#kendo-widgets-requirements).

## Using HTML5 ASP.NET Web Forms Report Viewer in a web application

The following steps produce a view with settings similar to these of the local `WebFormsIntegrationDemo` project, installed by default in the directory - `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp\.NET Framework\WebFormsIntegrationDemo`.

> All path references in the described steps should be adapted according to your project setup. For more information please refer to the Microsoft article [ASP.NET Web Project Paths](<https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)>).

1. Create a new [ASP.NET Web Forms](https://learn.microsoft.com/en-us/aspnet/web-forms/) Application.
1. Add new `WebForm` that does not use a `Master` page.
1. Add references to the following assemblies and set their **Copy Local** properties to `true` in Visual Studio:

   - **Telerik.Reporting**
   - **Telerik.ReportViewer.Html5.WebForms**
   - **Newtonsoft.Json, Version 13.0.0.0 or higher**

   The Telerik Reporting assemblies are available by default in the folder `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Bin`.

   > Without setting Telerik Reporting references' Copy Local to true the assemblies may not be loaded correctly on running the application.

1. To ensure that the browser will start in the latest rendering mode verify the page is using the following `DOCTYPE` directive:

   ```HTML
   <!DOCTYPE html>
   ```

   > The above DOCTYPE directive should be considered with your custom requirements. More details about the used in the tutorial settings for the page can be found in the [Defining document compatibility](<https://learn.microsoft.com/en-us/previous-versions/windows/internet-explorer/ie-developer/compatibility/cc288325(v=vs.85)>) Microsoft article.

1. Initialize the browser’s viewport in the `<head>` element:

   ```HTML
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
   ```

   The viewport META tag is used to control layout on mobile browsers.

1. (Optional) The default viewer implementation depends externally on **jQuery**. Add link to jQuery in the `<head>` element:

   ```HTML
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   ```

   > jQuery must be loaded only once on the page. Before adding jQuery, verify that it is not already loaded.

1. Add a reference to a [Telerik Kendo UI SASS-Based Theme](https://docs.telerik.com/kendo-ui/styles-and-layout/sass-themes/overview) in the `<head>` element:

   ```HTML
   <link href="https://kendo.cdn.telerik.com/themes/{{site.kendothemeversion}}/default/default-ocean-blue.css" rel="stylesheet" />
   ```

1. (Optional) Add references to the [Kendo UI for jQuery](https://www.telerik.com/kendo-jquery-ui) scripts in the `<head>` element:

   ```HTML
   <!--If Kendo CDN is prefered here are the required Kendo widgets and bundles
   The minimum required widgets:
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.core.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.data.odata.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.data.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.userevents.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.selectable.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.calendar.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.fx.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.draganddrop.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.mobile.scroller.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.virtuallist.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.popup.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.list.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.combobox.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.datepicker.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.resizable.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.dropdownlist.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.multiselect.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.splitter.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.window.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.color.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.slider.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.button.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.colorpicker.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.editor.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.listview.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.menu.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.panelbar.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.tooltip.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.treeview.min.js"></script>>
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.touch.min.js"></script>>
   Widgets bundles:
   kendo.all.min.js can be used as well instead of kendo.web.min.js and kendo.mobile.min.js
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.web.min.js"></script>>
   kendo.mobile.min.js - optional, if gestures/touch support is required
   <script src="https://kendo.cdn.telerik.com/{{kendosubsetversion}}/js/kendo.mobile.min.js"></script>>
   -->
   ```

1. Switch to the `Design` view of the Web Form and drag the viewer from Visual Studio Toolbox onto the designer surface. The [ReportsController]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application%}) will be automatically added to your project, along with references to the required **Telerik Reporting** assemblies.
1. Configure the HTML5 ASP.NET Web Forms Report Viewer's `ReportSource` using Visual Studio Property Grid. For this, you can use the "Product Catalog.trdp" report file.

   > If you use an `UriReportSource`, the `Identifier` must point to a TRDP/TRDX file's path that will be mapped to the folder used by the [UriReportSourceResolver](/api/Telerik.Reporting.Services.UriReportSourceResolver) in the Reporting REST service implementation.

   > note Verify the modified settings are written in the markup. If not, the viewer will use the default settings visible in Visual Studio Property Grid.

1. Set the report viewer `Width` and `Height`.
1. (Optional) If you set the viewer's **Deferred** to **true**, render the deferred initialization statement for the Report Viewer (remember that they must be rendered after jQuery):

   ```XML
   <telerik:DeferredScripts runat="server"></telerik:DeferredScripts>
   ```

1. Finally, the `WebForm` may look like the following:

   ```HTML
   <%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>
   <!DOCTYPE html>
   <html xmlns="http://www.w3.org/1999/xhtml">
   <head runat="server">
   	<title>Telerik HTML5 Web Forms Report Viewer Demo</title>
   	<link href="https://kendo.cdn.telerik.com/themes/{{site.kendothemeversion}}/default/default-ocean-blue.css" rel="stylesheet" />

   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.8.1/jquery.min.js"></script>>

   	<style>
   		#reportViewer1
   		{
   			position: absolute;
   			inset: 5px;
   			overflow: hidden;
   			font-family: Verdana, Arial;
   		}
   	</style>
   </head>
   <body>
   	<form runat="server">
   		<telerik:ReportViewer
   			ID="reportViewer1"
   			ServiceUrl="/api/reports/"
   			Deferred="true"
   			runat="server">
   		  <ReportSource Identifier="Product Catalog.trdp" IdentifierType="UriReportSource">
   				<Parameters>
   					<telerik:Parameter Name="CultureID" Value="fr" />
   				</Parameters>
   		  </ReportSource>
   		</telerik:ReportViewer>
   		<telerik:DeferredScripts runat="server"></telerik:DeferredScripts>
   	</form>
   </body>
   </html>
   ```
