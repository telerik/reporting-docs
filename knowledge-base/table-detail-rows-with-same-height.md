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
Generally, the detail rows of the table may grow vertically to accommodate their content. I guess this is the reason for the different detail rows having different heights.

One way to work around the issue is to ensure the detail cell content always fits in a single row. This should guarantee the same height for all detail rows.

If the incoming data doesn't let you know whether it will fit within a single row in design time, you may use Bindings to set the height of the table detail row. Here is the Expression I used to demonstrate the approach in the attached report:

## Solution
One way to work around the issue is to ensure the detail cell content always fits in a single row. This should guarantee the same height for all detail rows.

If the incoming data doesn't let you know whether it will fit within a single row in design time, you may use Bindings to set the height of the table detail row. Here is the Expression I used to demonstrate the approach in the attached report:

````
= Ifs(Exec("table1", Max(Len(Fields.data))) <= 13, "0.2in",
      Exec("table1", Max(Len(Fields.data))) <= 26, "0.4in",
      Exec("table1", Max(Len(Fields.data))) <= 39, "0.6in", "0.8in")
````
The idea is to take the longest data field and based on its maximum length calculate the number of rows that you need to fit its content within the cell.

If the scenario is more complicated you the built-in user functions don't fit your needs, you may create a custom user function to return the detail row height.

## See Also

