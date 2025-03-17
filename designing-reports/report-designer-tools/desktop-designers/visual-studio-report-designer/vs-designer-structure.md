---
title: Structure
page_title: Visual Studio Report Designer Structure
description: "Learn about the structure of the Visual Studio Report Designer, and how to use its main features when editing report definitions."
slug: visual-studio-report-designer-structure
tags: visual,studio,report,designer,tool,structure
published: True
position: 5
---

# Structure of the Visual Studio Report Designer

After you have opened a report in the Telerik Visual Studio Report Designer, you may use the following elements it exposes:

## Telerik Reporting Menu

The [menu]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/telerik-reporting-menu%}) lets you run the [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%}), [Data Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer%}), [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}), [Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/band-report-wizard/overview%}) and [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}). It is accessible through the __Telerik Menu --> Reporting__ for Visual Studio versions up to 2017. For Visual Studio 2019 and later through the __Extensions Menu --> Telerik --> Reporting__.

## Design Views Buttons

Use these buttons to switch between __Design__, __Preview__, and __HTML__ view mode of the report.

## Report Selector Button

Located in the upper left-hand of the report designer. Clicking this button makes the report active in the __Properties__ window.

## Rulers

They are on the top and left side of the designer and provide a point of reference to the report layout.

## Report Sections

The high-level report design consists of report sections for the report header, report footer, page header, page footer, detail, group header, and group footer. Each section can be resized by dragging the sizing grips at the bottom/right of each section. Most sections except the detail can be deleted by selecting the section and hitting the delete key. To delete a group section, you have to delete the whole group from the `Group Explorer`.

## Component Tray

Shows the [DataSource components]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/overview%}) that are used in this report.

## Context Menu

The [Context Menu]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/context-menu%}) will conditionally display contents depending on the area that was right-clicked. In the figure below the menu is invoked in the area next to the report design surface.

![Visual Studio Report Designer's main areas/functionalities.](images/Designer/visual-studio-report-designer-2017.png)

## Tooltip Buttons

All the buttons in the tooltip, placed at the lower left corner of the designer, are designed to ease you in your Report designing experience.

![Visual Studio Report Designer's toolstrip used to turn on/off functionalities.](images/Designer/report-designer-toolstrip.png)

They toggle various options that help in aligning, snapping, and stretching the report items and also adjust different designer settings.

### Zoom

The combo box enables you to easily specify the zoom percentage in which you see the design surface. You can do that by holding the `Ctrl` key and using the mouse wheel to zoom as well.

![Visual Studio Report Designer Zoom configurations.](images/snapGrid.png)

### Show/Hide the Snap Grid

The button switches on or off the displayed __snap grid__. The snap grid provides a set of horizontal and vertical gridlines that — when you drag an object on the design surface — will *snap* or pull towards the closest vertical or horizontal gridlines. Objects can also snap to column and row dividers within a grid panel. Here is a workspace showing the snap grid turned on:

![Visual Studio Report Designer when snapping to grid is turned on.](images/snapGrid1.png)

### Turn On/Off Snapping to Gridlines

This option allows you to drag objects on the design surface and have them snap to the grid lines shown on the designer's surface. The snapping will be applied regardless of the visibility of the snap grid.

### Turn On/Off Snapping to Snaplines

When this option is enabled, it allows you to drag objects on the design surface and snap them to the margins or alignment lines (red dashed line) of other objects within the same container element such as a layout panel, column, and row dividers in a grid panel. If a container has padding applied, it will be taken into account when snapping an object inside the container.

![Visual Studio Report Designer's snapping to snaplines functinality helping with the report items alignment.](images/snapGrid2.png)

### Show/Hide Dimensions

When enabled, the designer will show the distances from the currently selected object to the nearest elements.

![Report item dimension in the Visual Studio Report Designer when Show Dimensions is enabled.](images/snapGrid3.png)

### Show/Hide Watermarks

If enabled, the report watermarks will be shown in the designer. Note that the displayed watermarks are just for reference and their contents may not look the same as when rendered.

### Turn On/Off Pan

This option allows you to switch between drag and pan mode in the designer. When enabled, the cursor is changed to a hand, and clicking and dragging on the designer surface will move the report contents. This tool is useful when working on higher zoom levels.

## Show/Hide the Report MiniMap

In the lower-right corner of the design surface, click Show MiniMap. This element is especially useful when you have zoomed the report and want to focus on a specific element. To hide the map, click on the design surface to have it closed.

![Report minimap when enabled in the Visual Studio Report Designer.](images/snapGrid4.png)

## Change the Alignment of an Element

Alignment determines how an element resizes. For example, a left-aligned element stretches to the right as the parent layout container gets resized. To change the alignment of an element use the __Layout__ toolbar and do *one* of the following:

![Layout toolbar used to change the alignment of a report element in the Visual Studio Report Designer.](images/layoutToolbar.png)

* Select two report items and change their `HorizontalAlignment` by clicking __Left__, __Center__, __Right__, or __Stretch__.
* Select two report items and change their `VerticalAlignment` by clicking __Top__, __Center__, __Bottom__, or __Stretch__. You can also change alignment by moving an element on the design surface.

The Visual Studio Report Designer features also `Properties Explorer`, `Report Explorer`, `Group Explorer`, and `Data Explorer`. The first one is displayed by default in the Visual Studio. The other three can be opened from the Telerik Menu.

> If you are using **Visual Studio 2022**, ensure that the `Platform target` of your `Report Library` project is not set to `x86`, or you won't be able to preview your reports. This is because **Visual Studio 2022** is a 64-bit application and, by design, `.NET` does not allow mixing 32-bit and 64-bit assemblies in the same process.

## See Also

* [Visual Studio Report Designer Overview]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%})
* [How to use Visual Studio Report Designer to edit CS Reports in .NET Projects]({%slug how-to-use-vs-designer-in-dotnet-core%})
* [Standalone Report Designer Overview]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})
* [Web Report Designer Overview]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%})
