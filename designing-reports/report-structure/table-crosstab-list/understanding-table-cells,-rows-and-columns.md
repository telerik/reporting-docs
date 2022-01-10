---
title: Understanding table Cells, Rows and Columns
page_title: Understanding table Cells, Rows and Columns | for Telerik Reporting Documentation
description: Understanding table Cells, Rows and Columns
slug: telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-table-cells,-rows-and-columns
tags: understanding,table,cells,,rows,and,columns
published: True
position: 3
---

# Understanding table Cells, Rows and Columns



To control how the rows and columns of a Table display data in a report, you must understand how to specify rows and          columns for detail data, for group data, and for labels and totals. In many cases, you can use the default structures for a          Table, CrossTab or List to display your data.       

A Table displays detail data on detail rows and detail columns and grouped data on group rows and group columns. When          you add row groups and column groups to a Table, rows and columns on which to display the data are automatically added.          You can manually add and remove rows and columns to customize a Table and control the way your data displays in the report.       

## Displaying Data on Rows and Columns

Rows and row groups and columns and column groups have identical relationships. This discussion describes how to add           rows to display detail and group data on rows in a Table, however the same principles apply to adding columns to display            detail and grouped data.           

For each row in a Table, a row is either inside or outside each row group. If the row is inside a row group, it            repeats once for every unique value of the group, known as a *group instance* . If the row            is outside a row group, it repeats only once in relation to that group. Rows outside all row groups are static and repeat            only once for the data region. For example, a table header or footer row is a static row. Rows that repeat with at least            one group are dynamic.           

When you have nested groups, a row can be inside a parent group but outside a child group. The row repeats for every           group value in the parent group, but displays only once in relation to the child group. To display labels or totals for a            group, add a row outside the group. To display data that changes for every group instance, add a row inside the group.           

When you have detail groups, each detail row is inside the detail group. The row repeats for every value in the            data source.           

When detail data is displayed, the details group is the innermost child group. Rows that you add to a details group            repeat once per row in the result set for the query.

For each column in a Table, the same principles apply i.e. a column is either inside or outside each column group;            to display totals, add a column outside the group.           

To remove rows and columns associated to a group - delete the group. Doing that you have the choice between deleting            the group definition only or deleting the group and all its associated rows and columns. By deleting just the group, you            preserve the row and column layout. When you delete the group and its related rows and columns, you are deleting all static            rows and columns (including group headers and footers) and dynamic rows and columns (including group instances) that are            associated with that group.           

## Understanding Table cells

Table cells belong to one of four Table areas:  body,  row or column group areas and corner. Although each cell can            potentially display any value from the data source, the default function for each cell is determined by its location. For          detailed information about Table areas, see [Understanding CrossTab         areas]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-crosstab-areas%}).           

By default, cells in a Table row and column group areas represent group members. Group members are organized into            multiple tree structures in the report definition. The row group hierarchy expands horizontally and the column group hierarchy           expands vertically. These cells are added automatically when you create a group, and display the unique values for a group at            run time.           

Cells in the Table corner are created when there are both row and column group areas. You can merge cells in this area            to create a label or embed another report item.           

Cells in the Table body area can display detail data when the cell is in a detail row or column and aggregated group            data when the cell is in a group row or column. The scope for the data in a cell is the intersection of the innermost row            group and innermost column group to which the cell belongs.

