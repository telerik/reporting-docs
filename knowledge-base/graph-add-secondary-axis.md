---
title: Add a Secondary Axis to the Graph
page_title: Add a Secondary Axis to the Graph Report Item
description: "Learn how to add a secondary axis to the Telerik Reporting Graph report item."
slug: telerikreporting/designing-reports/report-structure/graph/how-to/how-to-add-secondary-axis
previous_url: /report-items/graph/how-to/how-to-add-secondary-axis, /graphhowtoaddsecondaryaxis
tags: telerik, reporting, graph, report, item, add, secondary, axis
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

When the values in my graph vary widely from series to series, or when I have a price and a volume, how can I plot one or more series on a secondary vertical or horizontal axis?

## Solution 

The scale of the secondary axis reflects the values for the associated series. To help distinguish the data that is plotted along the secondary axis, you can change the chart type for just one of the series. For example, you can change one series to a line type. 

To accomplish the suggested solution, you need to have an existing graph and follow the steps:

1. Select the Graph item and locate the __CoordinateSystems__ property in the property grid. Click the ellipsis button to open the __CoordinateSystems__ collection editor. 

1. Click the __Add__ button arrow and add a second coordinate system. 

1. For the axis you want to reuse, open the drop-down list and choose the axis created previously for the primary coordinate system. 

1. For the new __Axis__, choose **New** and the type of the scale from the drop-down list. 

The secondary axis can also appear on the right or top of the graph. This behavior is controlled by defining where the secondary axis crosses the shared axis. 

For the following example assume that X is the shared axis and there are two Y axes. 

1. For the __Scale__ of the shared __X axis__, add two __CrossAxisPositions__. The first will be applied to the first Y axis. Leave its position to the default `Auto` value. 

1. For the second __CrossAxisPositions__ applied to the second Y axis, set the position to `AtMaximum` which will force it to cross the X axis at its maximum value on the right end of the axis scale. 
