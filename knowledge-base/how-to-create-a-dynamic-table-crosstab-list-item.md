---
title: How to Create a Dynamic Table/Crosstab/List item
description: How to Make a Table/Crosstab/List Report Item Dynamic.
type: how-to
page_title: How to Set Up a Dynamic Table/Crosstab/List item
slug: how-to-create-a-dynamic-table-crosstab-list-item
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

In different scenarios, data may not an have exact schema to be used for designing a report. In such cases, you can use the fact that the [Table/List/Crosstab item](../table-working-with-table-cross-table-list-items) can visualize 3D data.
  
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

- The attached demo report illustrates the settings. The report can be previewed in the [Standalone Report Designer](../standalone-report-designer) of Telerik Reporting R1 2017 and later.

- The scenarios, requiring you to create or modify a report at run-time, are discussed in [Modifying or Creating a report at Run-Time](./modifying-or-creating-a-report-at-run-time).

## Additional Resources

[Download the sample report](resources/reportdynamiccolumns.zip).

## See Also

[Basic Concepts](../table-understanding-table-items)

[Understanding Crosstab Areas](../table-understanding-crosstab-areas) 

[Understanding table Cells, Rows and Columns](../table-understanding-cells-rows-columns)
