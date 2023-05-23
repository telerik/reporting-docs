---
title: Modifying Graph Axis Labels Based on the Scale Type
description: "Learn how to Customize the Axis label of a Graph in a Telerik Reporting report depending on the axis type."
type: how-to
page_title: Modify Graph Axis Labels
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
For Category Scale, using [CategoryGroup.Label](/api/telerik.reporting.graphgroup#Telerik_Reporting_GraphGroup_Label) property would be most useful to modify the labels.
You can set the value of this property to an [expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) that will be evaluated at runtime.

## Solution For Other Scales
Other types of Scale, such as **Numerical**, **DateTime** and **Logarithmic** Scales, calculate their range based on the data minimum and maximum values and show ticks and labels according to the determined base/major/minor units.

Labels of those scale types can be formatted using [GraphAxis.LabelFormat](/api/telerik.reporting.graphaxis#Telerik_Reporting_GraphAxis_LabelFormat) property. This property accepts a formatting string.
To set this property, you can use the [Format Builder]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/format-builder-dialog%}) dialog which can be invoked from the Axis's Properties grid or from its context menu by selecting the Format menu item.

## See Also

* [CategoryGroup.Label](/api/telerik.reporting.graphgroup#Telerik_Reporting_GraphGroup_Label)
* [GraphAxis.LabelFormat](/api/telerik.reporting.graphaxis#Telerik_Reporting_GraphAxis_LabelFormat)
* [Format Builder]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/format-builder-dialog%})
