---
title: Switch Rows and Columns in the Graph
page_title: Switch Rows and Columns in the Graph Report Item
description: "Learn how to switch rows and columns in the Telerik Reporting Graph report item."
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-switch-row---column
previous_url: /report-items/graph/how-to/how-to-switch-row---column, /graphhowtoswitchrowcolumn
tags: telerik, reporting, graph, report, item, switch, rows, columns
type: how-to
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting Graph Report Item</td>
		</tr>
	</tbody>
</table>


## Description

How can I switch rows and columns in the Graph?

## Solution 

Each series data-representation is formed by both the Category and Series groups. The CategoryGroups hierarchy defines the data points and the SeriesGroups hierarchy defines the runtime instances. 

Switching the SeriesGroups and CategoryGroups of a Graph will interchange the CategoryGroups and SeriesGroups hierarchies of the selected graph:

1. Select the graph in the designer.

1. Right-click and select **Switch Row/Column** from the context menu.
