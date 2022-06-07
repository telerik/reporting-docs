---
title: How to Create a Dynamic Table, Crosstab, or List Item
page_title: How to Set Up a Dynamic Table, Crosstab, or List Item
description: "Learn how to make a Table, Crosstab, or List report item dynamic when working with Telerik Reporting."
slug: how-to-create-a-dynamic-table-crosstab-list-item
tags: telerik, reporting, how, to, create, make, set, up, dynamic, table, list, crosstab, item
type: how-to
published: True
res_type: kb
---

## Environment

<table>
    <tbody>
	    <tr>
	    	<td>Product Version</td>
	    	<td>R1 2017 and later</td>
	    </tr>
	    <tr>
	    	<td>Product</td>
	    	<td>Progress® Telerik® Reporting</td>
	    </tr>
      <tr>
	    	<td>Report Item</td>
	    	<td>Table, Crosstab, List</td>
	    </tr>
    </tbody>
</table>

## Description

In different scenarios, data may not an have exact schema to be used for designing a report. In such cases, you can use the fact that the [Table/List/Crosstab item]({% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview %}) can visualize 3D data.

## Solution

The idea is to create a data source describing the data in terms of columns, rows and content, which should result in a flattened tabular representation of data like:

```
columnName,rowIndex,cellContent
column1,1,11
column2,1,21
column3,1,31
column1,2,12
column2,2,22
column3,2,32
```

Then, you can add a Table/List/Crosstab item with dynamic row and column groups based on the *columnName* and *rowIndex* fields.  

## Notes

- The attached demo report illustrates the settings. The report can be previewed in the [Standalone Report Designer]({% slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview %}) of Telerik Reporting R1 2017 and later.

- The scenarios, requiring you to create or modify a report at run-time, are discussed in [Modifying or Creating a report at Run-Time]({% slug modifying-or-creating-a-report-at-run-time %}).

## Additional Resources

[Download the sample report](resources/reportdynamiccolumns.zip).

### See Also

[Basic Concepts]({% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/basic-concepts %})

[Understanding Crosstab Areas]({% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-crosstab-areas %})

[Understanding table Cells, Rows and Columns]({% slug telerikreporting/designing-reports/report-structure/table-crosstab-list/understanding-table-cells,-rows-and-columns %})
