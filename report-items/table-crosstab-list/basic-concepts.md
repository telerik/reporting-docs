---
title: Basic Concepts
page_title: Basic Concepts of the Table, Crosstab, and List Report Items
description: "Learn more about the basic ideas of the Telerik Reporting Table report item implementation and understand the detail and group data, group hierarchies, table items, and static and dynamic table rows and columns."
slug: telerikreporting/designing-reports/report-structure/table-crosstab-list/basic-concepts
tags: telerik, reporting, report, items, table, crosstab, list, templates, basic, concepts, detail, group, data, hierarchies, static, dynamic, rows, columns
previous_url: /table-understanding-table-items
published: True
position: 2
---

# Basic Concepts

The Table is a powerful report item that enables you to display detail and grouped data. The detail report data is retrieved from the data source and you can also organize aggregated detail data into groups. 

The Table report item supports the Table, CrossTab, and List template variations, which are actually optimized alternatives of the same concept for a specific data layout. By default, a Table item displays detail data in a grid layout, a CrossTab displays grouped data in a grid layout, and a List displays detail data in a free-form layout. 

By design, each Table or CrossTab cell contains a text box. You can add multiple report items to a Table cell by first adding a Panel item as a container and, then, the report items to the Panel. Each List cell contains a Panel. You can replace a default report item with another report item, for example, an image. 

As you define groups for a Table, CrossTab, or List, the Report Designer adds rows and columns to the Table in which to display grouped data. 

## Detail vs. Grouped Data

Detail data is all the data from a report data source as it comes back from the data source. Detail data is essentially what you see in the query designer results pane when you run a database query. 

The actual detail data includes, and is restricted by, filters that are set on the data source, data region, and details group. To display detail data on a detail row, use a simple expression such as `=Fields.ProductCategory`. When the report runs, the detail row repeats once for each row in the query results at runtime. 

Grouped data is detail data that is organized by a value that you specify in the group definition, for example, `=Fields.ProductCategory`. To display grouped data in group rows and columns, use a simple expressions that aggregates the grouped data such as `=Sum(Fields.Quantity)`. 

## Group Hierarchies

Groups are organized as members of group hierarchies. Row group and column group hierarchies are identical structures on different axes. Think of row groups as expanding down the page and column groups as expanding across the page. 

A tree structure represents nested row and column groups that have a parent/child relationship, for example, a category with sub categories. The parent group is the root of the tree and child groups are its branches. Groups can also have an independent, adjacent relationship, for example, sales by territory and sales by year. Multiple unrelated tree hierarchies are called a forest. In a Table, row groups and columns groups are each represented as an independent forest. 

## The Table item

A table has four areas for cells: corner, row group hierarchy, column group hierarchy, and table body, which always exists. The other areas are optional. Cells in table body area display detail and group data. 

Cells in the Row Groups area are created automatically when you create a row group. These are row group header cells and display row group instance values by default. For example, when you group by "=Fields.ProductCategory", group instance values are the individual product categories that you are grouping by. 

Cells in the Column Groups area are created automatically when you create a column group. These are column group header cells and display column group instance values by default. For example, when you group by "=Fields.Year", group instance values are the individual years that you are grouping by. 

Cells in the table corner area are created automatically when you have both row groups and column groups defined. For more info see [Understanding Table areas]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-crosstab-areas%}). 

## Static and Dynamic Rows and Columns

A table item organizes cells in rows and columns that are associated with groups. Because group structures for row groups and columns are identical, we would talk about row groups. You can apply the same concepts to column groups. 

A row is either static or dynamic. A static row is not associated to a group. When the report runs, a static row renders once. Table headers and footers are static rows. Static rows display labels and totals. 

A dynamic row is associated to one or more groups. A dynamic row renders once for every unique group value for the innermost group. Cells in a dynamic row are scoped to the innermost row group and column group to which the cell belongs. 

Dynamic detail rows are associated with the details group that is automatically created when you add a table or list to the design surface. By definition, the details group is the innermost group for a table. Cells in detail rows display detail data.
