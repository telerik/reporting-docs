---
title: Displaying a Triangle Matrix Table Design in Telerik Reporting
description: "Learn how to display a triangle matrix table design in Telerik Reporting."
type: how-to
page_title: How to Display a Triangle Matrix Table Design in Telerik Reporting
slug: display-triangle-matrix-table-design-telerik-reporting
tags: telerik-reporting, matrix-table, dynamic-table, design
res_type: kb
---

## Environment

| Product |
| ------- |
| Progress Telerik Reporting |

## Description

I want to display a triangle matrix table design in Telerik Reporting. The matrix should have left and bottom header rows with identical content that represents sie in inches as in the next image:

![The required triangle matrix layout.](/images/TriangleMatrixLayout.png "Triangle Matrix Layout")

## Solution

You can achieve the desired layout by using a proper DataSource that includes empty or Null records for the grid/matrix cells that shouldn't be displayed. The Reporting product is data-driven, so the table/crosstab layout depends on the received data.

To display a triangle matrix table design, follow these steps:

1. Use a proper DataSource that includes Null or empty values for the top-right area of the matrix. For example, you can use a CsvDataSource with columns `RowSize`, `ColumnSize`, and `Value`. The `RowSize` and `ColumnSize` fields represent the Crosstab Row and Column Headers, while the `Value` field holds the data for each cell. Set the `Value` as an empty string when the `ColumnSize` is larger than the `RowSize`.
1. Add a Crosstab to your report and configure the Row grouping by `RowSize` and Column grouping by `ColumnSize`. Make sure to set the Crosstab Border Styles to `None`.
1. Set the Border Styles of the row header cells to `Solid`. This includes the cell on the second row, first column with the value '= Fields.RowSize'.
1. Hide the Row Header of the Crosstab by setting the `Visible` property to `False`.
1. Add a Row Footer to the Crosstab to display the sizes at the bottom of the matrix. Right-click on the last Crosstab row and select 'Insert Row > Outside Group > Below'. Set the Default Border Style of the new row's right cell to `Solid`.
1. For the detail cell of the Crosstab (middle row, right column) with the value '= Fields.Value', use a Binding to set the `Style.BorderStyle.Default` property as follows. The Expression ensures borders are displayed only for the cells with content that is part of the desired triangle matrix:

	`= (Fields.Value is Null) Or (Fields.Value = "") ? "None" : "Solid"`

1. You can also use a second Binding for the same cell to set the font color (Style.Color) based on the value. For example, you can set different colors based on specific ranges of values like in the referenced sample report:

	````
= (Fields.Value is Null) Or (Fields.Value = "") ? "white" : Ifs(
		Fields.Value < 150, "green", 
		Fields.Value < 250, "red", 
		Fields.Value < 350, "yellow",
		Fields.Value < 450, "blue",
		Fields.Value < 550, "brown",
		Fields.Value < 650, "pink",
		Fields.Value < 750, "black",
		Fields.Value < 850, "light green",
		Fields.Value < 950, "violet",
		"gray")
````


## Sample Reporting

* [TriangleMatrix.trdx]()
