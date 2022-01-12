---
title: Standalone Report Designer Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview
tags: overview
published: True
position: 0
---

# Standalone Report Designer Overview



This document explains how end users can utilize the Standalone Report Designer. We briefly describe how to start the Standalone Report Designer         and what are its basic UI elements.       

## Standalone Report Designer Overview

The Standalone Report Designer empowers report authors with creating, editing and sharing ad-hoc reports. It is a standalone           Windows tool powered by the Telerik Reporting engine, which uses the latest UI standards to assist power users with the process           of creating reports, analyzing data on their machines, and exporting and sharing report documents.         

The Standalone Report Designer is part of the Telerik Reporting package. It is a single EXE file, which simplifies its distribution,           and does not require installation. Visual Studio is not required to create reports with the Standalone Report Designer. Reports are processed on the client machine.         

## Starting the Standalone Report Designer

* __From the Windows Start menu:__ 

   1. Open the Start menu, click __All Programs__, then click  __Telerik__ and then                   click __Reporting__.                 

   1. Click __Report Designer__.                 

   1. The Standalone Report Designer opens, and you can create or open a report.                 

* __From another desktop application:__ Developers can enable users to start the Standalone Report Designer from another.NET desktop application. This is possible with the.NET Framework                [                Process.Start              ](                http://msdn.microsoft.com/en-us/library/vstudio/system.diagnostics.process.start              )  Method.               Optionally, the Standalone Report Designer accepts an argument path to a report document, which will be opened with the report designer.                To provide a report definition for editing in the report designer, developers can use the                [                Process.Start (String, String)              ](                http://msdn.microsoft.com/en-us/library/vstudio/h6ak8zt5              )  Method.             

## Major UI Elements in the Standalone Report Designer  

  ![standalone-report-designer-overview](images/Designer/standalone-report-designer-overview.png)

The image above shows the major UI elements in the Standalone Report Designer:         

* __View tab:__             Lets you open the               [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%}),               [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}),               [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}),               __Property Browser__             or navigate to __Startup Page__ 

* __Report selector button:__ Clicking this button makes the report active in the __Properties__ window.             

* __Rulers:__ Located on the top and left side of the designer, they provide a point of reference for the report layout.             

* __Report Sections__ : The high-level report               design consists of report sections for the report header, report footer, page               header, page footer, detail, group header and group footer. Each section can be               resized by dragging the sizing grips at the bottom/right of each section. Most               sections except the detail can be deleted by selecting the section and hitting               the delete key. To delete a group section, you have to delete the whole group from               the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%})

* __Component Tray:__ Shows the [              DataSource components            ]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) that are used in this report.             

* __View Mode Buttons:__ Use these buttons to switch               between the __Design__, __Preview__ view.             

* [Context Menu]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/context-menu%}) (not shown on the image above):               Appears on right click and conditionally displays content depending on the area that was right-clicked.             

## Additional UI Elements

Additionally, the Standalone Report Designer includes the following helpful elements:         

* __Tooltip__ : This is a UI element that includes various buttons that are designed to ease you while you design reports.               The __Tooltip__, which is shown on the image below, is placed in the lower-left corner of the design surface.               

  ![report-designer-toolstrip](images/Designer/report-designer-toolstrip.png)You will find the following buttons in the __Tooltip__ :

   + __Zoom__ - the combo box enables you to easily specify the zoom percentage in which you see the design surface. You can do that by holding the Ctrl key and use the mouse wheel to zoom as well.                   

  ![](images/snapGrid.png)

   + __Show/hide the snap grid__ button switches on or off the displayed __snap grid__.                   The snap grid provides a set of horizontal and vertical gridlines that — when you drag an object on the design surface — will *snap*                    or pull towards the closest vertical or horizontal gridlines. Objects can also snap to column and row dividers within a grid panel.                   Here is a workspace showing the snap grid turned on:                   

  ![](images/snapGrid1.png)

   + __Turn on/off snapping to gridlines__ - this option allows you to drag objects on the design surface and have them snap to the grid lines shown on the designer surface.                   The snapping will be applied regardless of the visibility of the snap grid.                 

   + __Turn on/off snapping to snaplines__ - when this option is enabled, it allows you to drag objects on the design surface and snap them                   to the margins or alignment lines (red dashed line) of other objects within the same container element such as a layout panel, column and row dividers                   in a grid panel. If a container has padding applied, it will be taken into account when snapping an object inside the container.                   

  ![](images/snapGrid2.png)

   + __Show/Hide Dimensions__ - when enabled, the designer will show the distances from the currently selected object to the nearest elements.                   

  ![](images/snapGrid3.png)

   + __Show/Hide watermarks__ - if enabled, the report watermarks will be shown in the designer. Note that the displayed watermarks are just for a reference                   and their contents may not look the same as when rendered.                   

  ![](images/snapGrid3.png)

   + __Turn On/Off Pan__ - this option allows you to switch between drag and pan mode in designer.                   When enabled, the cursor is changed to a hand and clicking and dragging on the designer surface will move the report contents. This tool is useful when working on higher zoom levels.                 

* __Show/Hide the Report Map__ - In the lower-right corner of the design surface, click on the magnifying glass to show or hide               the __Report Map__. This element is especially useful when you have zoomed the report and want to focus on a specific element. To hide the map, click on the design surface to have it closed.               

  ![](images/snapGrid4.png)

* __Change the alignment of an element__ Alignment determines how an element resizes. For example, a left aligned element stretches to the right as the parent layout container gets resized.To change the alignment of an element use the __Layout__ toolbar and do *one*  of the following:               

  ![standalone-designer-align-controls](images/Designer/standalone-designer-align-controls.png)

   + Select two report items and change their HorizontalAlignment by clicking __Left__, __Center__, __Right__, or __Stretch__.                 

   + Select two report items and change their VerticalAlignment by clicking __Top__, __Center__, __Bottom__, or __Stretch__.                 You can also change alignment by moving an element on the design surface.

