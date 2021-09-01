---
title: Modifing Graph Axis Labels Based on the Scale Type
description: Customize the Axis label of a Graph in a report
type: how-to
page_title: How to Modify Graph Axis Labels Based on the Scale Type
slug: how-to-modify-graph-axis-labels
position: 
tags: graph
ticketid: 
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report element</td>
			<td>Graph</td>
		</tr>
	</tbody>
</table>


## Description
This article explains how to customize the Axis labels when using a Graph item. For example, if you want to use a special expression for the category sccale or apply special formatting for other scale types.

## Solution For Category Scale
For Category Scale, using [CategoryGroup.Label](./p-telerik-reporting-graphgroup-label) property would be most useful to modify the labels.
You can set the value of this property to an [expression](./report-expressions) that will be evaluated at runtime.

## Solution For Other Scales
Other types of Scale, such as **Numerical**, **DateTime** and **Logarithmic** Scales, calculate their range based on the data minimum and maximum values and show ticks and labels according to the determined base/major/minor units.

Labels of those scale types can be formatted using [GraphAxis.LabelFormat](./p-telerik-reporting-graphaxis-labelformat) property. This property accepts a formatting string.
To set this property, you can use the [Format Builder](./ui-format-builder) dialog which can be invoked from the Axis's Properties grid or from its context menu by selecting the Format menu item.

## See Also
- [CategoryGroup.Label](./p-telerik-reporting-graphgroup-label)
- [GraphAxis.LabelFormat](./p-telerik-reporting-graphaxis-labelformat)
- [Format Builder](./ui-format-builder)
