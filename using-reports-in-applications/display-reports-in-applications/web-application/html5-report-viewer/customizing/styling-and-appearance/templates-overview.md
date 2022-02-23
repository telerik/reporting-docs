---
title: Templates Overview
page_title: Templates Overview 
description: Templates Overview
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/customizing/styling-and-appearance/templates-overview
tags: templates,overview
published: True
position: 1
---

# Templates Overview

The article elaborates on the structure of the HTML template file of the HTML5 Report Viewer. The mentioned Report Viewer Template files are provided with your Telerik Reporting Installation - [Installation Directories]({%slug telerikreporting/installation%}#directories-and-asemblies). 

The default viewer's template is divided into 3 areas:

* the Pages Area that is responsible for displaying the report pages, viewer’s status and error messages;

* the Parameters Area that is responsible for displaying the editor UI for the visible report parameters;

* the Document Map Area that displays the report’s document map and allows navigation in its content;

Besides these three areas the viewer template contains top and side menus that provide the basic tools for navigating into the reports when the viewer is rendered on desktop or mobile devices. 

All these elements of the HTML5 Report Viewer are provided through the __trv-report-viewer__ template and are loaded dynamically during the initialization of the __telerik_ReportViewer__ widget. 

While loading the template content, the widget looks for elements marked with the data-role attribute and maps its value to a jQuery plugin function that provides the element behavior. For example: 
    
````html
<div class="trv-parameters-area k-widget hidden" data-role="telerik_ReportViewer_ParametersArea"> … </div>
````

is mapped to:
    
````js
jQuery.fn.telerik_ReportViewer_ParametersArea(options)
````

If such function exists, it is invoked onto the HTML element (that owns the data-role attribute) passing an options object with the following properties: 

* __controller__ - a telerikReportViewer.ReportViewerController object that is responsible for the basic viewer operations; 

* __commands__ - a telerikReportViewer.CommandSet object that contains all commands; 

* __templates__ - an object that contains all templates loaded for the current report viewer instance. The id of the template is used as a property’s name, and the value is the template HTML content. 

Using this completely declarative approach of describing the viewer’s layout and behavior allows users to easily tweak any parts of it by simply modifying the templates. Following the above pattern, one can create its own data-role and extend the default viewer behavior.
