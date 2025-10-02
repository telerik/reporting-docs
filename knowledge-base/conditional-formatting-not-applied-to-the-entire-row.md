---
title: Conditional Formatting Not Applied to the Entire Row
description: Some cells of the Crosstab row are not formatted according to the Conditional Formatting
type: how-to
page_title: Crosstab Conditional Formatting is not applied to the entire row
slug: conditional-formatting-not-applied-to-the-entire-row
position:
tags:
ticketid: 1462106
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

When the Crosstab contains both dynamic row groups and dynamic column groups, the
[Conditional Formatting]({% slug telerikreporting/designing-reports/styling-reports/conditional-formatting %}) set to an entire Crosstab row with an [Expressioin]({% slug telerikreporting/designing-reports/connecting-to-data/expressions/overview %})
like:

```
= Fields.DataFieldName  =   SomeValue
```

may not be applied to particular cells. These cells are in column groups that do not contain data for the specific row.

## Solution

The observed behavior is expected. The Conditional Formatting is applied to report items like TextBoxes and not to table cells or rows.
The Reporting engine determines the data for the report item in the cell by the intersection between the row group and the column group
it belongs to. When one of the groups has no data, the intersection is also empty. For that reason, all the data fields in the
[Expression Scope]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope%}) will be _null_ and the Conditional Formatting rule will return _false_.

The solution is in the formatting rule to take the data field value in the scope only of the group that contains data. For example,
when this is the row group :

```
= Exec('rowGroupName', Fields.DataFieldName)  =   SomeValue
```
