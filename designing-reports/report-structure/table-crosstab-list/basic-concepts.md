---
title: Basic Concepts
page_title: Basic Concepts | for Telerik Reporting Documentation
description: Basic Concepts
slug: telerikreporting/designing-reports/report-structure/table-crosstab-list/basic-concepts
tags: basic,concepts
published: True
position: 1
---

# Basic Concepts



The Table is a generalized layout report item that displays report data in cells that are organized into rows and         columns. Report data can be detail data as it is retrieved from the data source, or aggregated detail data organized into         groups that you specify. Each table cell can contain any report item, including a TextBox, a PictureBox, Chart or another         table item. To add multiple report items to a cell, first add a panel item, which acts as a container, and then add the         report items to the panel.       

The Table, CrossTab, and List report items are actually variations of the same thing optimized for a specific data layout.         By default, a table item displays detail data in a grid layout, a CrossTab displays group data in a grid layout, and a         list displays detail data in a free-form layout.       

By default, each cell in a table or CrossTab contains a text box. The cell in a list contains a panel. You can         replace a default report item with a different report item, for example, an image.       

As you define groups for a table, CrossTab, or list, the report designer adds rows and columns to the Table on         which to display grouped data.       

In order to understand these report items, you should first understand the following:       

1. What is the difference between detail and grouped data.           

1. Groups organized as members of group hierarchies on the horizontal axis are row groups and on the vertical axis are             column groups.           

1. What is the purpose of table cells in the four areas of a CrossTab data region: the body, the row group headers, the             column group headers, and the corner.           

1. Static and dynamic rows and columns and how they relate to groups.           

Once you understand these concepts, you can recognize the structure that the report designer adds for you and modify the         structure to suit your own needs.       

## Understanding Detail and Grouped Data

Detail data is all the data from a report data source as it comes back from the data source. Detail data is essentially           what you see in the query designer results pane when you run a database query. The actual detail data includes, and is           restricted by filters set on the data source, data region, and details group. You display detail data on a detail row by           using a simple expression such as =Fields.ProductCategory. When the report runs, the detail row repeats once for each row in           the query results at run time.         

Grouped data is detail data that is organized by a value that you specify in the group definition, for example,           =Fields.ProductCategory. You display grouped data on group rows and columns by using simple expressions that aggregate the           grouped data, for example, =Sum(Fields.Quantity).         

## Understanding Group Hierarchies

Groups are organized as members of group hierarchies. Row group and column group hierarchies are identical structures           on different axes. Think of row groups as expanding down the page and column groups as expanding across the page.         

A tree structure represents nested row and column groups that have a parent/child relationship, for example, a category           with sub categories. The parent group is the root of the tree and child groups are its branches. Groups can also have an           independent, adjacent relationship, for example, sales by territory and sales by year. Multiple unrelated tree hierarchies           are called a forest. In a Table, row groups and columns groups are each represented as an independent forest.         

## Understanding the Table item

A table has four areas for cells: corner, row group hierarchy, column group hierarchy, and table body, which always           exists. The other areas are optional. Cells in table body area display detail and group data.         

Cells in the Row Groups area are created automatically when you create a row group. These are row group header cells           and display row group instance values by default. For example, when you group by =Fields.ProductCategory, group instance values are the individual product categories that you are grouping by.         

Cells in the Column Groups area are created automatically when you create a column group. These are column group header           cells and display column group instance values by default. For example, when you group by =Fields.Year, group instance values           are the individual years that you are grouping by.         

Cells in the table corner area are created automatically when you have both row groups and column groups defined. For           more info see [Understanding Table areas]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-crosstab-areas%}).         

## Understanding Static and Dynamic Rows and Columns

A table item organizes cells in rows and columns that are associated with groups. Because group structures for row           groups and columns are identical, we would talk about row groups. You can apply the same concepts to column groups.         

A row is either static or dynamic. A static row is not associated to a group. When the report runs, a static row           renders once. Table headers and footers are static rows. Static rows display labels and totals.         

A dynamic row is associated to one or more groups. A dynamic row renders once for every unique group value for the           innermost group. Cells in a dynamic row are scoped to the innermost row group and column group to which the cell belongs.         

Dynamic detail rows are associated with the details group that is automatically created when you add a table or list           to the design surface. By definition, the details group is the innermost group for a table. Cells in detail rows display           detail data.

