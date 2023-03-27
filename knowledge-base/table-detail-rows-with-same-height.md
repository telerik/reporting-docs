---
title: Make Table Detail Rows of the Same Height
description: "Learn how to make all rendered detail rows of a Reporting Table have the same height in the final document."
type: how-to
page_title: Making the Table Detail Rows Have the Same Height in the Rendered Document
slug: table-detail-rows-with-same-height
position: 
tags: report,table,data,row,render,bindings,height
ticketid: 1602880
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description

The detail rows of the table may grow vertically to accommodate their content. This may lead to detail rows having different heights in the final report document.

## Solution

One way to work around the issue is to ensure the detail cell content always fits in a single row. This should guarantee the same height for all detail rows.

If the incoming data doesn't let predicting whether it will fit within a single row in design time, you may use [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to set the height of the table detail row. Here is the [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%}) that is used to demonstrate the approach in the demo report you may find in the [Reporting Samples GitHub repository](https://github.com/telerik/reporting-samples/blob/master/TableEqualRowHeight.trdp):

````
= Ifs(Exec("table1", Max(Len(Fields.data))) <= 13, "0.2in",
		Exec("table1", Max(Len(Fields.data))) <= 26, "0.4in",
		Exec("table1", Max(Len(Fields.data))) <= 39, "0.6in", "0.8in")
````
The idea is to take the longest data field and based on its maximum length calculate the number of rows that are needed to fit its content within the cell.

If the scenario is more complicated and the [built-in user functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%}) doesn't fit your needs, you may create a [custom user function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}) to return the detail row height.

## See Also

* [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%})
* [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%})
* [User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%})
* [Creating a Custom User Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%})
