---
title: Alternate Cell Background Color by Table Group
description: How to change the cell background color based on table group
type: how-to
page_title: Alternate cell background color by table group
slug: alternate-cell-background-color-by-table-group
position: 
tags: 
ticketid: 1500747
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product Version</td>
			<td>14.2 20.1118</td>
		</tr>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
What [Conditional Formatting](../styling-conditional-formatting) may be used to alternate the detail cell background color based on table groups?  

For alternating detail rows in a table, you may use __Conditional Formatting__ based on the following [Expression](../report-expressions) and set different colors for 
odd and even rows:
```
RowNumber()%2
```  
The '%' is the remainder after division operator.
The straight-forward idea based on the above solution is to set the _Expression_ to depend on the group:
```
=RowNumber('groupName')%2
```
However, in the group, the row numbers will increase within the group. That's why the color will alternate within the group rows, whereas the requirement is the rows 
of each group to have the same color, and this color to change between groups.

## Solution
You may use the following _Expression_:
```
=RunningValue("tableName", CountDistinct(Fields.groupingFieldName))%2
```
The _RunningValue_ [data function](../expressions-data-functions) assures that only the values up to the current one get respected. The _CountDistinct_ 
[aggregate function](../expressions-aggregate-functions) counts the distinct grouping values, in this case, up to the current one. This would remain 1 for the first 
group, 2 for the second, and so on. Hence, the Expression will return 0 for the even groups within the table and 1 for the odd ones.
