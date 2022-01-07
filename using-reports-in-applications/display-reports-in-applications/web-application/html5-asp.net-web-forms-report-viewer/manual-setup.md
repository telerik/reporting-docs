---
title: Manual Setup
page_title: Manual Setup | for Telerik Reporting Documentation
description: Manual Setup
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/manual-setup
tags: manual,setup
published: True
position: 3
---

# Manual Setup



This tutorial shows how to use HTML5 ASP.NET Web Forms Report Viewer in ASP.NET 4 Web Forms applications.       

## Prerequisites

* Review the HTML5 Report Viewer [System Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}).             

* Copy of the "Product Catalog.trdx" report file from __[TelerikReporting_InstallDir]\ReportDesigner\Examples__                in the folder used by the  [ReportFileResolver](/reporting/api/Telerik.Reporting.Services.WebApi.ReportFileResolver)                in the Reporting REST service implementation.             

* Entry with the default connection string used by Telerik Reporting sample reports in the __web.config__  file               of the project hosting the Reporting REST service:             

    
      ````xml
<connectionStrings>
     <add name="Telerik.Reporting.Examples.CSharp.Properties.Settings.TelerikConnectionString"
                connectionString="Data Source=(local);Initial Catalog=AdventureWorks;Integrated Security=SSPI"
                providerName="System.Data.SqlClient" />
</connectionStrings>
````

* (Optional) Telerik Kendo UI custom distribution for Telerik Reporting (located in {Telerik Reporting installation path}\Html5\ReportViewer\js) or Kendo UI mainstream distribution downloaded locally or via  [Kendo UI CDN service](http://docs.telerik.com/kendo-ui/install/cdn) . You must load only one version of Telerik Kendo UI styles and scripts on the page.               For more information see [](143e5c03-e69d-416f-9ac0-85c397b22b8e#KendoWidgetsRequirements)If Kendo UI is not provided HTTPHandler will provide the required Kendo UI styles and scripts.             

## Using HTML5 ASP.NET Web Forms Report Viewer in a web application

The following steps produce a view with settings similar to these of the local WebFormsDemo project,           installed by default under __[TelerikReporting_InstallDir]\Examples__ .           The structure used in this tutorial is a WebForm that does not use a Master page.         

>tip All path references in the described steps should be adapted according             to your project setup. For more information please refer to the MSDN article              [ASP.NET Web Project Paths](http://msdn.microsoft.com/en-us/library/ms178116.aspx) 

1. Create new ASP.NET Web Forms Application.

1. Add new WebForm that does not use a Master page.

1. Add references to:
   + __Telerik.Reporting__ 

   + __Telerik.ReportViewer.Html5.WebForms__ 

   + __Newtonsoft.Json, Version 9.0.0.0 or higher__ 
    assemblies and set their __Copy Local__  properties to true in Visual Studio.                   The Telerik Reporting assemblies may be found by default in the folder __[TelerikReporting_InstallDir]\Bin__ .                 

    >Without setting Telerik Reporting references' Copy Local to true the assemblies may not be loaded correctly on running the application.

1. To ensure that the browser will start in the latest rendering mode verify the page is using the following DOCTYPE directive:                 

    
    ````html
<!DOCTYPE html>
````

    >The above DOCTYPE directive should be considered with your custom requirements. More details about the used in the tutorial settings for the page can be found in the                      [Defining document compatibility](http://msdn.microsoft.com/en-us/library/cc288325(v=vs.85).aspx)  MSDN article.                   

1. Initialize the browser’s viewport in the ```<head>``` element:

    
    ````html
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
````

    The viewport META tag is used to control layout on mobile browsers.    

1. (Optional) The default viewer implementation depends externally on __jQuery__ .                   Add link to jQuery in the ```<head>``` element:                 

    
    ````html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
````

    >jQuery must be loaded only once on the page. Before adding jQuery, verify that it is not already loaded.                   

1. (Optional) Add references to Telerik Kendo UI scripts and styles in the ```<head>``` element:

    
    ````html
<!-- the required Kendo styles -->
<link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.common.min.css" rel="stylesheet" />
<link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.blueopal.min.css" rel="stylesheet" />
<!--If Kendo CDN is prefered here are the required Kendo widgets and bundles
The minimum required widgets:
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
Widgets bundles:
kendo.all.min.js can be used as well instead of kendo.web.min.js and kendo.mobile.min.js
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.web.min.js"></script>
kendo.mobile.min.js - optional, if gestures/touch support is required
<script src="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /js/kendo.mobile.min.js"></script>
-->
````

1. Switch to the Design view of the Web Form and drag the viewer from Visual Studio Toolbox onto the designer surface.                   The ReportsController will be automatically added to your project,                   along with references to the required Telerik Reporting assemblies.                 

1. Configure the HTML5 ASP.NET Web Forms Report Viewer ReportSource using Visual Studio Property Grid.                  For this you can use the  "Product Catalog.trdp" report file (Prerequisites).

    >If you use a UriReportSource, the Identifier must point to a TRDP/TRDX file's path that will be mapped to the                         folder used by the  [ReportFileResolver](/reporting/api/Telerik.Reporting.Services.WebApi.ReportFileResolver)                          in the Reporting REST service implementation.                       

    >Verify the modified settings are written in the markup. If not, the viewer will use the default settings visible in Visual Studio                     Property Grid                   

1. Set the viewer width and height.                 

1. (Optional) If you set the viewer's __Deferred__  to __true__ , render the deferred initialization                   statement for the Report Viewer (remember that they must be rendered after jQuery):                 

    
    ````xml
<telerik:DeferredScripts runat="server"></telerik:DeferredScripts>
````

1. Finally the WebForm should look like this (note that the Report Parameter 'CultureID' value will be modified as passed from the viewer) :

    
    ````html
<%@ Register TagPrefix="telerik" Assembly="Telerik.ReportViewer.Html5.WebForms" Namespace="Telerik.ReportViewer.Html5.WebForms" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Telerik HTML5 Web Forms Report Viewer Demo</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.common.min.css" rel="stylesheet" />
    <link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.blueopal.min.css" rel="stylesheet" />
    <style>
        #reportViewer1
        {
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
````

