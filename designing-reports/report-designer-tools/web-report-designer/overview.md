---
title: Web Report Designer Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview
tags: overview
published: True
position: 0
---

# Web Report Designer Overview



Telerik Web Report Designer is an HTML5/JavaScript/CSS3 jQuery-based widget that allows developers         to integrate a report designer into their web applications. The styling is based on the Kendo UI Sass Default         theme. The Telerik Web Report Designer previews reports in an HTML5 Report Viewer.       

>important The current version of the Web Report Designer offers beyond-basics functionality, but is still under           active development. Please give it a thorough review to make sure the designer fits your scenario            before including it in a production project.         


## Web Report Designer elements

The Web Report Designer consists of the following areas:  

  ![Web Report Designer With Dashboard Report](images/Designer/web-report-designer-dashboard.png)

* __Design surface__  - shows the design layout of the report. Provides tools for selecting, moving,               resizing and editing the report items.             

* __Menu area__  - provides buttons for creating a new report and opening, saving or previewing an               already existing one. Also, allows switching between loaded reports and shows their save state.             

* __Properties area__  - displays the properties of the selected report item. In case multiple items               are selected, shows only the properties that are marked as "mergeable", in other words properties               that can be applied to all items in the current selection. The list of the properties can be               organized in categories or in alphabetical order.             

* __Components__  - lists the available report components that can be added to the report. The items are               organized in groups based on their type. The area supports two kinds of layout - grid and list.               List is the default view.             

* __Explorer__  - represents the report structure in a tree-like view. Allows the selection of the visual               and non-visual report components and configures their properties.             

## How it works

The Web Report Designer uses a dedicated ASP.NET WebAPI REST service as a backend. The service           is responsible for the storage operations like creating, opening or saving report definitions           in a specified folder, as well as handling the various requests that concern server-side processing           and rendering. The public methods of the service can be overwritten to adjust its functionality           to a specific scenario.         

## Requirements:

* The Web Report Designer can be integrated in any ASP.NET Web Application, both               under __.NET Framework 4.5.1+__  or __.NET Core 2.1+__ .             

* The following NuGet packages are required:             

   + Telerik.Reporting                 

   + Telerik.WebReportDesigner.Services                 

## Prerequisites:

* Web browser that supports                [JavaScript EcmaScript 6](https://es6.io) : Google Chrome 77.0 or higher;               Mozilla Firefox 69.0 or higher, Microsoft Edge 79 or higher.             

*  [jQuery](http://jquery.com/download/) __3.3.1__  or later.             

*  [Kendo UI](http://www.kendoui.com/)  __kendosubsetversion__  or later.             

* Telerik Report Viewer script. By default, it is requested from the service.             

* Web Report Designer script. By default, it is requested from the service.             

* All other scripts and styles will be provided by the Web Report Designer service               when the designer widget is loaded. The list of loaded resources:             

   +  [jQuery UI](https://jqueryui.com/) __1.12.1__  library.                   We recommend using the version of jQuery UI subset that is                   served by the Web Report Designer service because it includes a fix related to                   the dragging and dropping components.                 The subset includes Draggable, Droppable, Resizable and their dependencies.                 

   + webReportDesigner.min.css stylesheet.

   + webReportDesignerTheme.css stylesheet.

* The web report designer in our example is stylized using                [Roboto font](https://fonts.google.com/specimen/Roboto) . A link to a font of your               preference can be added before creating the Web Designer widget on the page.             

# See Also


 * [How to set up in .NET Core 2.1+ application]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-core-2.1+-application%})

 * [How to set up in .NET Framework application]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/how-to-set-up-in-.net-framework-application%})
