---
title: Table Parts
page_title: Table Cells, Rows, and Columns at a Glance
description: "Learn how to control the behavior of the cells, rows, and columns when working with the Telerik Reporting Table report item."
slug: telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-table-cells,-rows-and-columns
tags: telerik, reporting, report, items, table, crosstab, list, templates, understanding, cells, rows, columns
previous_url: /table-understanding-cells-rows-columns, /report-items/table-crosstab-list/understanding-table-cells,-rows-and-columns
published: True
position: 6
reportingArea: General
---

# Table Cells, Rows, and Columns

To control the way the cells, rows, and columns of the Table report item display their report data, you need to specify rows and columns for detail data, for group data, and for labels and totals.

Usually, you can use the default Table templates of the [Table, CrossTab, or List variations]({%slug table_template_items%}) to display your data.

## Displaying Data in Rows and Columns

A Table displays detail data on detail rows and detail columns, and aggregated group data on group row headers and group column headers. When you add row/column groups, the Table automatically adds row/column header in which to display the group data. You can manually add and remove rows and columns to customize a Table and to control the way your data displays in the report.

This section elaborates on the specifics when you work with the Table rows and columns, and when you add rows to display detail and group data. Because rows have identical relations to row groups as columns have to column groups, note that the same principles apply when you add columns to display detail and grouped data:

* Each row in a Table is either inside or outside a row group. If the row is inside a row group, it repeats once for every unique value of the group (group instance). If the row is outside a row group, it repeats only once for that group. Rows outside all row groups are static and repeat only once for the data region. For example, a table header or footer row is a static row while rows that repeat with at least one group are dynamic.
* In nested groups, a row can be inside a parent group but outside a child group. The row repeats for every group value in the parent group, but displays only once for the child group. To display labels or totals for a group, add a row outside the group. To display data that changes for every group instance, add a row inside the group.
* When you have detail groups, each detail row is inside the detail group. The row repeats for every value in the data source. When the table displays detail data, the details group is the innermost child group. Rows you add to a details group repeat once per row in the result set for the query.
* To remove rows and columns associated to a group, either delete the group definition or the group and all its associated rows and columns. If you delete only the group definition, you will preserve its row and column layout. When you delete the group and its related rows and columns, you will delete all static rows and columns, including group headers and footers, and all dynamic rows and columns, including group instances that are associated with that group.

## Table Cells

Each Table cell belongs to one of the available Table areas, namely, the Body, Row Group, Column Group, or Corner areas. Although each cell can potentially display any value from the data source, the default function for each cell is determined by its location. For detailed information, refer to the article on [CrossTab areas]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-crosstab-areas%}).

Each Table area comes with the following specifics that affect the cells inside:

* Table Row and Column Group&mdash;By default, the cells in a Table Row and Column Group areas represent group members. Group members are organized into multiple tree structures in the report definition. The Row Group hierarchy expands horizontally and the Column Group hierarchy expands vertically. These cells are added automatically when you create a group, and display the unique values for a group at runtime.
* Table Corner&mdash;The cells in the Table Corner are created when there are both Row and Column Group areas. You can merge cells in the Corner area to create a label or embed another report item.
* Table Body&mdash;The cells in the Table Body area can display detail data when the cell is in a detail row or column, or aggregated group data when the cell is in a group row or column. The scope for the data in a cell is the intersection of the innermost row group and innermost column group to which the cell belongs.

## See Also

* [CrossTab Areas]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-crosstab-areas%})
* [Template Variations of the Table Report Items]({%slug table_template_items%})
* [Table Class API Reference](/api/telerik.reporting.table)
* [Demo Page for Telerik Reporting](https://demos.telerik.com/reporting)
