---
title: Visual Studio Report Designer Overview
page_title: Overview 
description: Overview
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview
tags: overview
published: True
position: 0
---

# Visual Studio Report Designer Overview

The Visual Studio Report Designer is dedicated to editing CLR/type report definitions (i.e. CS or VB files) in the Visual Studio environment. The Visual Studio designer is available only under __.NET framework__. Due to technical limitations we do not yet provide one for *.NET Core*.

To start/open the designer, double click on an existing CS/VB file containing the report definition or right click on it and select "View Designer". If there is no such file, you may create it using the Add --> New Item --> Telerik Report *version* (from the *Reporting* menu of the wizard).

The Telerik Report Designer has the following elements:

* [Telerik Reporting Menu]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/telerik-reporting-menu%}): The menu lets you run the [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%}), [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}), [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}), [Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%}) and [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}). It is accessible through the *Telerik Menu --> Reporting* for Visual Studio versions up to 2017. For Visual Studio 2019 through the *Extensions Menu --> Telerik --> Reporting*. 

* __Design Views Buttons:__ Use these buttons to switch between __Design__, __Preview__ and __HTML__ view mode of the report. 

* __Report selector button:__ Located in the upper left hand of the report designer. Clicking this button makes the report active in the __Properties__ window. 

* __Rulers:__ on the top and left side of the designer provide a point of reference to the report layout. 

* __Report Sections__ : The high level report design consists of report sections for the report header, report footer, page header, page footer, detail, group header and group footer. Each section can be resized by dragging the sizing grips at the bottom/right of each section. Most sections except the detail can be deleted by selecting the section and hitting the delete key. To delete a group section, you have to delete the whole group from the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}). 

* __Component Tray:__ shows the [DataSource components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) that are used in this report. 

* [Context Menu]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/context-menu%}): This menu will conditionally display contents depending on the area that was right-clicked. In the figure below the menu is invoked in the area next to the report design surface. 

  ![visual-studio-report-designer-2017](images/Designer/visual-studio-report-designer-2017.png)

* All the buttons in the toolstip, placed at the lower left corner of the designer, are designed to ease you in your Report Designing experience. 

  ![report-designer-toolstrip](images/Designer/report-designer-toolstrip.png)They toggle various different options that help in aligning, snapping and stretching the report items and also adjust different designer settings.

   + __Zoom__ - the combo box enables you to easily specify the zoom percentage in which you see the design surface. You can do that by holding the Ctrl key and use the mouse wheel to zoom as well. 

  ![](images/snapGrid.png)

   + __Show/hide the snap grid__ button switches on or off the displayed __snap grid__. The snap grid provides a set of horizontal and vertical gridlines that — when you drag an object on the design surface — will *snap* or pull towards the closest vertical or horizontal gridlines. Objects can also snap to column and row dividers within a grid panel. Here is a workspace showing the snap grid turned on: 

  ![](images/snapGrid1.png)

   + __Turn on/off snapping to gridlines__ - this option allows you to drag objects on the design surface and have them snap to the grid lines shown on the designer surface. The snapping will be applied regardless of the visibility of the snap grid. 

   + __Turn on/off snapping to snaplines__ - when this option is enabled, it allows you to drag objects on the design surface and snap them to the margins or alignment lines (red dashed line) of other objects within the same container element such as a layout panel, column and row dividers in a grid panel. If a container has padding applied, it will be taken into account when snapping an object inside the container. 

  ![](images/snapGrid2.png)

   + __Show/Hide Dimensions__ - when enabled, the designer will show the distances from the currently selected object to the nearest elements. 

  ![](images/snapGrid3.png)

   + __Show/Hide watermarks__ - if enabled, the report watermarks will be shown in the designer. Note that the displayed watermarks are just for a reference and their contents may not look the same as when rendered. 

  ![](images/snapGrid3.png)

   + __Turn On/Off Pan__ - this option allows you to switch between drag and pan mode in designer. When enabled, the cursor is changed to a hand and clicking and dragging on the designer surface will move the report contents. This tool is useful when working on higher zoom levels. 

* __Show/Hide the report MiniMap__ - In the lower-right corner of the design surface, click Show MiniMap. This element is especially useful when you have zoomed the report and want to focus on a specific element. To hide the map, click on the design surface to have it closed. 

  ![](images/snapGrid4.png)

* __Change the alignment of an element__ Alignment determines how an element resizes. For example, a left aligned element stretches to the right as the parent layout container gets resized.To change the alignment of an element use the __Layout__ toolbar and do *one* of the following: 

  ![](images/layoutToolbar.png)

   + Select two report items and change their HorizontalAlignment by clicking __Left__, __Center__, __Right__, or __Stretch__. 

   + Select two report items and change their VerticalAlignment by clicking __Top__, __Center__, __Bottom__, or __Stretch__. You can also change alignment by moving an element on the design surface. 

The Visual Studio Report Designer features also *Properties Explorer*, [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%}), [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) and [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}). The first one is displayed by default in the Visual Studio. The other three can be opened from the Telerik Menu. 


# See Also

* [Visual Studio Report Designer Troubleshooting]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/visual-studio-problems%})
