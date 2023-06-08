---
title: Alternating the Cell Background Color by Table Group
page_title: Changing the Cell Background Color Alternatively by Table Group
description: "Learn how to change the background color of the table cell in Telerik Reporting based on the table group."
type: how-to
slug: alternate-cell-background-color-by-table-group
tags: telerik, reporting, alternate, cell, background, color, based, on, table, group
ticketid: 1500747
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

What [conditional formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}) can I use to alternate the detail cell background color based on table groups?

## Cause

For alternating detail rows in a table, I use conditional formatting based on the following [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) and set different colors for odd and even rows:

`RowNumber()%2`

The `%` is the remainder after the division operator. Then, I set the `Expression` to depend on the group:

`=RowNumber('groupName')%2`

However, in the group, the row numbers increase within the group. That's why the color will alternate within the group rows, whereas my requirement is the rows of each group to have the same color and for this color to change between groups.

## Solution

To handle the issue, use the following `Expression`:

`=RunningValue("tableName", CountDistinct(Fields.groupingFieldName))%2`

The `RunningValue` [data function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions%}) assures that only the values up to the current one get respected. The `CountDistinct` [aggregate function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%}) counts the distinct grouping values, in this case, up to the current one. This approach will leave `1` for the first group, `2` for the second, and so on. Hence, the `Expression` will return `0` for the even groups within the table and `1` for the odd ones.
