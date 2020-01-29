---
title: Applying Conditional Formatting Rule to Expandable Area
description: How to Apply Conditional Formatting Rule to Expandable Area in a Table with Alternating Style Rows
type: how-to
page_title: How to Apply Conditional Formatting Rule to Expandable Area in a Table with Alternating Style Rows
slug: applying-conditional-formatting-rule-to-expandable-area
position: 
tags: 
ticketid: 1444473
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
This KB articles show how to achieve [alternating style rows](../how-to-display-alternating-style-rows) 
when there is a [grouping in the table](../reporting/data-items-how-to-add-groups-to-table-item-and-crosstab-item) and the group's content is expandable.

## Solution
In the [demo report](https://github.com/telerik/reporting-samples/tree/master/Applying%20Conditional%20Formatting%20Rule%20to%20Expandable%20Area) the following approach is applied:
1. Add a [CSV DataSource](../reporting/csvdatasource-component) with **Group** and **Item** columns;

2. Add a table that displays only the items and [add a row group](.reporting/data-items-how-to-add-groups-to-table-item-and-crosstab-item) based on "=Fields.Group"

3. Set the [Toggle Visibility action](.reporting/designing-reports-interactivity-how-to-add-drilldown-action) on "=Fields.Group";

4. Set [Conditional Formatting](.reporting/styling-conditional-formatting) to "=Fields.Group" cell:

**Expression**: =RowNumber()%2

**Operator**: =

**Value**: =0

5. Set Conditional Formatting to "=Fields.Item" cell:

**Expression**: = Exec("group", RowNumber())%2

**Operator**: =

**Valu**e: =0
