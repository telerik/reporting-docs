---
title: Displaying a Triangle Matrix Table Design in Telerik Reporting
description: Learn how to display a triangle matrix table design in Telerik Reporting, including dynamically created tables based on SQL results.
type: how-to
page_title: How to Display a Triangle Matrix Table Design in Telerik Reporting
slug: display-triangle-matrix-table-design-telerik-reporting
tags: telerik-reporting, matrix-table, dynamic-table, design
res_type: kb
---

## Environment

| Product | Progress Telerik Reporting |
| ------- | ------------------------- |
| Version | 17.2.23.1114              |

## Description

I want to display a triangle matrix table design in Telerik Reporting. The table is dynamically created based on the SQL result. Is this possible? If yes, how can I achieve this?

## Solution

You can achieve the desired layout by using a proper DataSource that includes empty or Null records for the grid/matrix cells that shouldn't be displayed. The Reporting product is data-driven, so the table/crosstab layout depends on the received data.

To display a triangle matrix table design in Telerik Reporting, follow these steps:

1. Use a proper DataSource that includes Null or empty values for the top-right area of the matrix. For example, you can use a CsvDataSource with columns RowSize, ColumnSize, and Value. The RowSize and ColumnSize fields represent the Crosstab Row and Column Headers, while the Value field holds the data for each cell. Set the Value as an empty string when the ColumnSize is larger than the RowSize.
2. Add a Crosstab to your report and configure the Row grouping by RowSize and Column grouping by ColumnSize. Make sure to set the Crosstab Border Styles to None.
3. Set the Border Styles of the row header cells to Solid. This includes the cell on the second row, first column with the value '= Fields.RowSize'.
4. Hide the Row Header of the Crosstab by setting the Visible property to False.
5. Add a Row Footer to the Crosstab to display the header with the sizes at the bottom of the matrix. Right-click on the last Crosstab row and select 'Insert Row > Outside Group > Below'. Set the Default Border Style of the new row's right cell to Solid.
6. For the detail cell of the Crosstab (middle row, right column) with the value '= Fields.Value', use a Binding to set the Style.BorderStyle.Default property as follows:
   - If the value is Null or an empty string, set the border style to "None".
   - If the value has a specific condition, set the border style to "Solid".
7. You can also use a second Binding for the same cell to set the font color (Style.Color) based on the value. For example, you can set different colors based on specific ranges of values.

Note that the legend cannot be placed as shown in the image you provided, as it is part of the rendered crosstab.

I hope these instructions help you achieve the desired triangle matrix table design in Telerik Reporting. Let us know if you have any further questions or concerns.
