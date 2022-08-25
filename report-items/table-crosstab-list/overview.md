---
title: Overview
page_title: Table, Crosstab, and List Overview 
description: "Learn more about the Telerik Reporting Table report item and how to use its supported table, crosstab, and list template variations."
slug: telerikreporting/designing-reports/report-structure/table-crosstab-list/overview
previous_url: /table-working-with-table-cross-table-list-items
tags: telerik, reporting, report, items, table, crosstab, list, templates, overview
published: True
position: 0
---

# Table Overview

The Table report item is a generalized layout report item which displays report data in cells that are organized into rows and columns. 

The Table report item is an individual data region which utilizes its own [`Telerik.Reporting.DataItem.DataSource`](/reporting/api/Telerik.Reporting.DataItem#Telerik_Reporting_DataItem_DataSource) to populate the fields with data. The dataset fields are displayed either as detail or grouped data in a grid or in a free-form layout. Each table cell can contain any report item, such as a TextBox, PictureBox, Chart, or another Table template variation. 

// add an image here 

## Key Features  

* [Basic concepts]({% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/basic-concepts %})&mdash;Get to know the logic behind the implementation of the Table report item and learn more about the detail and group data, group hierarchies, table items, and static and dynamic table rows and columns.
* [Template items]({% slug table_template_items %})&mdash;The Table report item supports the Table, CrossTab, and List templates which are actually optimized variations of the same concept for a specific data layout.
* [Crosstab areas]({% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-crosstab-areas %})&mdash;The CrossTab comes with the corner, row group, column group, and body areas that contain table cells.
* [Table fields]({% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-table-cells,-rows-and-columns %})&mdash;The Table report item provides a number of settings for controlling the behavior of its cells, rows, and columns.
* [Context menu]({% slug table_context_menu %})&mdash;Besides the available TextBox item attributes, the Table template variations provide a context menu with additional settings.
* [Group editor]({% slug table_group_editor %})&mdash;You can use the Table context menu which allows you to modify the properties of the selected group data. 

## See Also  

* [(Demo) Product Sales Report with a CrossTab Summary](https://demos.telerik.com/reporting/product-sales)
* [(Demo) List-Bound Report](https://demos.telerik.com/reporting/list-bound-report)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting) 
* [Getting Started with the Table Report Item]({% slug table_item_get_started %})
* [(API) Table Report Item](https://docs.telerik.com/reporting/api/telerik.reporting.table)
* [Product Page for Telerik Reporting](https://www.telerik.com/products/reporting)
