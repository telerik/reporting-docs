---
title: Align BarSeries DataPointLabel to the Graph Right Side
description: "Learn how to align the Graph BarSeries DataPointLabel to the Graph Area Right Edge in Telerik Reporting."
type: how-to
page_title: Show Data Point Labels Aligned to the Right
slug: align-barseries-datapointlabel-to-graph-right-side
position: 
tags: 
ticketid: 1570466
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

If you set the [DataPointLabelAlignment property](/api/Telerik.Reporting.BarSeries#Telerik_Reporting_BarSeries_DataPointLabelAlignment) of the BarSeries, you may align the data point labels with respect to the current datapoint base or end value. There is no option for aligning with respect to the Axis or with the Graph.

## Suggested Workarounds

The [property DataPointLabelOffset](/api/Telerik.Reporting.BarSeries#collapsible-Telerik_Reporting_BarSeries_DataPointLabelOffset) can move the label with a hard-coded value right-ward. If its value is bigger than the available width, it will place the label at the right-most possible position, i.e. as if it is right-aligned with respect to the Graph Chart Area. When you set the [DataPointLabelConnectorStyle](/api/Telerik.Reporting.BarSeries#Telerik_Reporting_BarSeries_DataPointLabelConnectorStyle) _Visible_ to _False_, the data point label should appear as if the labels are right-aligned. Here are the exact steps:

+ Set `DataPointLabelAlignment` to `OutsideEnd`;
+ Set `DataPointLabelOffset` to a very large value, for example, the width of the Graph;
+ Set `DataPointLabelConnectorStyle.Visible` to `False`.

## Example

A sample may be found in our Reporting-Samples GitHub Repository - [BarSeriesDataPointLabelAlignment.trdp](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/BarSeriesDataPointLabelAlignment.trdp)
