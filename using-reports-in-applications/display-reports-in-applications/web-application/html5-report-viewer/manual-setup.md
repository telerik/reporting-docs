---
title: Manual Setup
page_title: Manual Setup | for Telerik Reporting Documentation
description: Manual Setup
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/manual-setup
tags: manual,setup
published: True
position: 4
---

# Manual Setup



In this topic, we demonstrate how to manually add the HTML5 Report Viewer to an HTML page and to display a report. The approach that we use here allows for full control over         the configuration. If you are looking for a less complicated approach,          consider using the [Visual Studio item templates]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/how-to-use-html5-report-viewer-with-rest-service%}).       

## Prerequisites

Before you continue, make sure that the following prerequisites are met:         

1. Familiarity with the HTML5 Report Viewer [System Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}).             

1. A running application that hosts a Reporting REST service at address */api/reports* . For more information, see               [Telerik Reporting REST Services]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}).             

1. A reference from the project that hosts the Reporting REST service to the Reports Library located in the               __[TelerikReporting_InstallDir]\Examples\CSharp|VB\ReportLibrary\Bin__  folder.              

1. A script with the custom Telerik Kendo UI distribution for Telerik Reporting               (located in the __[TelerikReporting_InstallDir]\Html5\ReportViewer\js__  folder)               or with the mainstream Kendo UI distribution downloaded locally or via the                [Kendo UI CDN service](http://docs.telerik.com/kendo-ui/install/cdn) .             

   >note You must load only one version of Telerik Kendo UI styles and scripts on the page.                 For more information see [](143e5c03-e69d-416f-9ac0-85c397b22b8e#KendoWidgetsRequirements).               

## Utilizing the HTML5 Report Viewer in an HTML page

The following steps produce an HTML page with settings similar to these of the local Html5Demo project           installed by default under __[TelerikReporting_InstallDir]\Examples__ :         

>note You must adapt all path references in the steps below              to your project setup. For more information, refer to the               [ASP.NET Web Project Paths](http://msdn.microsoft.com/en-us/library/ms178116.aspx)              MSDN article.           


1. Create an HTML5 page:

	
    ````html
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>    
    <title>Telerik HTML5 Report Viewer</title>  
</head>
<body>    
</body>
</html>
````



    >tip The above DOCTYPE directive must reflect your custom requirements.                     You can find more details about the page settings used in this tutorial in the                      [Defining document compatibility](http://msdn.microsoft.com/en-us/library/cc288325(v=vs.85).aspx)  MSDN article.                   



1. Initialize the browser’s viewport in the ```<head>``` element:

	
    ````html
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
````

    The viewport META tag is used to control the layout on mobile browsers.    

1. Add a reference to jQuery in the ```<head>``` element:

	
    ````html
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
````



    >tip jQuery must be loaded before creating the viewer object.jQuery must be loaded only once on the page.



1. Add references to the Telerik Kendo UI styles in the ```<head>``` element:

	
    ````html
<!-- the required Kendo styles -->                  
<link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.common.min.css" rel="stylesheet" />
<link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.blueopal.min.css" rel="stylesheet" />
````



1. Add references to the HTML5 Report Viewer JavaScript file in the ```<head>``` element:

	
    ````html
<script src="/api/reports/resources/js/telerikReportViewer"></script>
````



    >tip The report viewer JavaScript must be referenced after any other Kendo widgets or bundles.                   

    If no Kendo widgets are utilized in the page, the report viewer will register a custom Kendo                     subset to enable the required Kendo widgets. The subset is served from the report service.                     If Kendo is used on the page or the CDN is preferred, make sure the following widgets are referenced:                 

	
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



1. Add a ```<div>``` element to the ```<body>``` element that will serve as a placeholder for the viewer’s widget.                   The ```<div>``` element's ID attribute serves as a key(Id) for the viewer object.                   Its content (*loading...* ) will be displayed while the viewer’s content is being loaded (from the template). :                 

	
    ````html
<div id="reportViewer1" class="k-widget">
    loading...
</div>
````



1. Add the following script element at the bottom of the ```<body>``` element and create the HTML5 Report Viewer widget for the reportViewer1 ```<div>```                  element that we just added:

	
    ````js
<script type="text/javascript">
        $("#reportViewer1")
            .telerik_ReportViewer({
                serviceUrl: "/api/reports/",
                //templateUrl: /ReportViewer/templates/telerikReportViewerTemplate-FA-x.x.x.x.html
                reportSource: { 
					report: "Telerik.Reporting.Examples.CSharp.ProductCatalog, CSharp.ReportLibrary",
					parameters: {
						CultureID: "en"
					}
				}
            });
</script>
````

    where x.x.x.x is the HTML5 ReportViewer/Telerik Reporting version (e.g. {{site.buildversion}}).                   The relative paths that you use must reflect the project's structure.                     The default template is using TelerikWebUI icons. If you prefer a template with *FontAwesome*  icons, you have to set the                    templateUrl option to /ReportViewer/templates/telerikReportViewerTemplate-FA-x.x.x.x.html                 

    >tip The viewer's  __reportSource__  consists of report and parameters attributes,                     where  __report__  is the string description of the report that will be displayed, and                      __parameters__  is a collection of parameter keys and values that will be sent to the report.                     The report's string description is handled on the server by the                     [report source resolver used in the Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}).                       The above example uses the  [assembly qualified name](http://msdn.microsoft.com/en-us/library/30wyt9tk)  of a report's type (report created in Visual Studio Report Designer).                     This string description will be handled automatically by the   [ReportTypeResolver](/reporting/api/Telerik.Reporting.Services.WebApi.ReportTypeResolver) .                   



1. Make the viewer fill the entire browser window. Add the following style to the ```<head>``` element:

	
    ````html
<style>
        #reportViewer1 {
            position: absolute;
            left: 5px;
            right: 5px;
            top: 5px;
            bottom: 5px;
            font-family: 'segoe ui', 'ms sans serif';
            overflow: hidden;
        }
</style>
````



    >tip The above CSS rule will be applied on the ```<div>``` element holding the viewer object.                     The HTML elements building the viewer object will be sized based on the size of this container ```<div>``` element.                     To make the viewer fit in other container, use  *position:relative*  and provide width and height values.                   



1. The HTML page that we have just created should look like this:

	
    ````html
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Telerik HTML5 Report Viewer</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.common.min.css" rel="stylesheet" />
    <link href="https://kendo.cdn.telerik.com/ {{site.kendosubsetversion}} /styles/kendo.blueopal.min.css" rel="stylesheet" />
    <script src="/api/reports/resources/js/telerikReportViewer"></script>
    <style>
        #reportViewer1 {
            position: absolute;
            left: 5px;
            right: 5px;
            top: 5px;
            bottom: 5px;
            font-family: 'segoe ui', 'ms sans serif';
            overflow: hidden;
        }
    </style>
</head>
<body>
    <div id="reportViewer1" class="k-widget">
        loading...
    </div>
    <script type="text/javascript">
        $("#reportViewer1")
            .telerik_ReportViewer({
                serviceUrl: "/api/reports/",
                reportSource: { 
					report: "Telerik.Reporting.Examples.CSharp.ProductCatalog, CSharp.ReportLibrary",
					parameters: {
						CultureID: "en"
					}
				}
            });
    </script>
</body>
</html>
````



1. Run the project and navigate to the page with the HTML5 Report Viewer that we have just created.
