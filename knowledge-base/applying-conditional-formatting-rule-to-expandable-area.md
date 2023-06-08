---
title: Apply Conditional Formatting Rules to Expandable Areas
page_title: Apply Conditional Formatting in a Table with Alternating Style Rows
description: "Learn how to apply a conditional formatting rule to an expandable area in a table with alternating style rows."
type: how-to
slug: applying-conditional-formatting-rule-to-expandable-area
tags: telerik, reporting, apply, conditional, formatting, rules, to, expandable, areas, with, alternating, style, rows
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

How can I [alternate the row style]({%slug how-to-display-alternating-style-rows%}) when I have [grouping in the table]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item%}) and the group content is expandable?

## Solution

To solve this issue, refer to the [demo report](https://github.com/telerik/reporting-samples/tree/master/Applying%20Conditional%20Formatting%20Rule%20to%20Expandable%20Area) and use the following approach:

1. Add a [CSV DataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/csvdatasource-component/overview%}) with **Group** and **Item** columns.
1. Add a table that displays only the items and [add a row group]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item%}) based on `"= Fields.Group"`.
1. Set the [Toggle Visibility action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drilldown-report-action%}#how-to-add-a-drilldowntoggle-visibility-action) on `"= Fields.Group"`.
1. Set [conditional formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}) to the `"= Fields.Group"` cell as follows:

		**Expression** `= RowNumber()%2`

		**Operator** `=`

		**Value** `= 0`

5. Set the conditional formatting to the `"= Fields.Item"` cell:

		**Expression** `= Exec("group", RowNumber())%2`

		**Operator** `=`

		**Value** `= 0`

