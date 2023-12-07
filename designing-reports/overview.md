---
title: Overview
page_title: Creating Reports at a Glance
description: "Learn more about the report creation process and the report definition types when working with Telerik Reporting."
slug: telerikreporting/designing-reports/overview
tags: telerik, reporting, creating, designing, reports, overview
published: True
position: 0
previous_url: /designing-reports, /creating-the-report, /designing-reports/
---

# Creating Reports Overview

To help you in creating effective reports, the __Telerik Reporting__ package provides three different implementations of a [complete graphical report designer]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}). Depending on your requirements, you can choose between a [standalone desktop application]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}), a [web report designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}), or a [report designer that runs in Visual Studio]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}).

This document presents some general report designing tips that you can apply regardless of which report designer you use.

## Report Definition Types

Telerik Reporting supports declarative and programmatic report definition types.

### Declarative Types

The declarative report definitions can be in plain text format or compressed in a ZIP archive.

Telerik Reporting supports the following declarative report definitions:

* Telerik Report Definition XML (`.TRDX`) is a plain text file with XML content. It's easier to review the report definition with simple text editors but all embedded resources like images are encoded with Base64 encoding and don't support localization.
* Telerik Report Definition Package (`.TRDP`) is compressed in a ZIP archive which contains the XML report definition and its resources. It's smaller in size, optimized for resource handling, and supports [report localization]({%slug telerikreporting/designing-reports/localizing-reports%}).
* Telerik Report Book Package (`.TRBP`) is compressed in a ZIP archive report book XML definition.

### Programmatic Types

Telerik Reporting supports the following programmatic report definitions:

* CS/VB Report is a custom class that inherits from [`Telerik.Reporting.Report`](/api/Telerik.Reporting.Report).
* CS/VB Report Book is a custom class that inherits from [`Telerik.Reporting.ReportBook`](/api/Telerik.Reporting.ReportBook).

## Basic Tips for Working with Data

* As a first step, get all the data that you want to work with. As you refine the questions that the report is designed to answer, think about how to limit the data in the report data source to just what is needed.
* In general, only include the data that you will display in a report. Use query variables in your queries to enable the user to choose which data they want to see in the report. If you are sharing the data source component, provide filters based on report parameters to provide the same functionality.
* If you are an experienced query writer, understand that for intermediate amounts of data, you might want to group data in the report, and not in the query. If you do all your grouping in the query, then the report tends to be a presentation of the query result set. On the other hand, to display aggregated values for large amounts of data on a [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}) or [Map]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%}), there is no need to include detail data.
* Depending on your requirements, you can display names and locations of report data sources, dataset query command text, and parameter values in the report. The first question many new users have is about where the data comes from. To reduce clutter in the report, you can conditionally hide text boxes with this type of information and let users choose whether to see it. Try adding this information on the last page of the report. Set the text box visibility based on a parameter that the user can change.

## Report Layout Tips

* A well-designed report conveys information that leads to action. Identify the questions that the report helps to answer. Keep those questions in mind as you design the report.
* To design effective data visualizations, think about how to display information that is easy for the report user to understand. Choose a [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}) that is a good match for the data that you want to visualize. For example, a [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}) effectively conveys summary and aggregated information better than a table that spans many pages of detailed information. You can visualize data from a dataset in any data item, which includes [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}), [Map]({%slug telerikreporting/designing-reports/report-structure/map/structure/overview%}), and tabular data in various grid layouts based on a [Table/Crosstab/List]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}).
* If you plan to deliver the report in a specific export format, test the export format early in your design. Feature support and performance vary based on the renderer (rendering extension) that you choose.
* To reduce clutter in a report, consider using [Drilldown Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drilldown-report-action%}) for specific report items and let the user choose whether to show the items. You can set visibility based on a parameter or a report item toggle. You can add conditionally hidden text boxes to show interim expression results. When a report displays unexpected data, you can show these interim results to help debug expressions.
* When you work with nested items, you can set different background colors for the container and contained items. By default, the background color is Transparent. Items with a specific background color show through items with a background color set to Transparent. This technique can help you select the right item to set display properties. Additionally setting background color to report items will help you to debug unexpected layout/paging behavior such as blank pages.
* When you build complex layouts, build the layout in stages. You can use [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}) as containers to organize report items. You can build data items directly on the design surface to maximize your working area, and then, as you complete each one, drag it to the rectangle container. By using rectangles as containers, you can position all its contents in one step. [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}) also helps control the way report items render on each page.

## Interacting with the Report Design Surface

* When you place report items on the design surface, their relative location affects the way that the items appear on the rendered report page. White space is preserved.
* Use snap-grid and layout buttons to align and arrange items on the report design surface. For example, you can align the tops or edges of selected items, expand an item to match the size of another item or adjust the spacing between items.
* Use arrow keys to adjust the position and size of selected items on the design surface. For example, the following key combinations are very useful:

	+ `Arrow keys` Move the selected report item.
	+ `Shift + Arrow keys` Increase or decrease the size of the selected report item.

* To add multiple items to a Table cell, first add a [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}), and then add the items. By default, each Table cell contains a [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}). When you add a [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}) to a cell, the [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}) replaces the [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}).
* Use the Zoom control to adjust your view of the design surface. You can work with the whole page or smaller sections of the page.
* The Properties grid displays properties for the current selection.
* To work with Table row groups and column groups, select the group from the [Group Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}).
* In the report designers, you can select report items/groups from the hierarchical view of report items in the [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%}) window. You can select items in this window and see which item is selected on the design surface.

## Working with Report Parameters

* The primary purpose of [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) is to filter data at the data source, and retrieve just what is needed for the purpose of the report.
* For report parameters, find a balance between enabling interactivity and helping a user get the results they want. For example, you can set default values for a parameter to values that you know are popular.

## Working with Expressions

* Understand simple and complex expression formats. You can type simple expression format directly into text boxes, properties in the Property grid, or in locations in dialog boxes that accept an expression. For more information, see [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})
* When you create an expression, it helps to create each part independently and verify its value. You can then combine all the parts into a final expression.

## Naming Conventions

* Data sources - use a name that indicates which data source it is based on.
* Data items - indicate the type of data item and what data it displays.

Useful item names will help you when browsing the report object tree in [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%}) and when selecting target for [Drilldown Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drilldown-report-action%}).

## See Also

* [Automatic Layout (Dock and Anchor)]({%slug telerikreporting/designing-reports/report-structure/automatic-layout-(dock-and-anchor)%})
* [Performance Considerations]({%slug telerikreporting/designing-reports/performance-considerations%})
* [Understanding Pagination]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%})
* [Expression Reference]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/overview%})
* [Extending Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/overview%})
