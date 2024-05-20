---
title: Swap Graph Axes in the Graph
page_title: Swap Graph Axes in the Graph Report Item
description: "Learn how to swap the axes in the Telerik Reporting Graph report item."
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-swap-graph-axes
previous_url: /report-items/graph/how-to/how-to-swap-graph-axes, /graphhowtoswapaxes
tags: telerik, reporting, graph, report, item, swap, axes
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

How can I set the graph series to be oriented towards both axes of the corresponding coordinate system?

## Solution 

Changing the orientation of all series inside of a graph will swap the X / Y values of all series and interchange the axes positions of all coordinate systems:

1. Select the graph in the designer.

1. Right-click and select **Swap Axes** from the context menu. 

Changing the orientation of the individual series will cause the selected series to swap their X/Y values. Additionally, the coordinate system referred by the series will also have its axes swapped. 

If only some of the series sharing a coordinate system are rotated, a new coordinate system will be created and assigned to them. The new coordinate system will share its axes with the original but with interchanged places (XAxis/YAxis, AngleAxis/RadiusAxis). Upon reversing the operation or changing the orientation of the rest of the series, sharing the former coordinate system, the two coordinate systems will be merged based on their axes:

1. Select desired series in the designer.

1. Right-click and select **Swap Axes** from the context menu.

