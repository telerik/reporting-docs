---
title: Align BarSeries DataPointLabel to the Graph Right Side
description: Learn how to align the Graph BarSeries DataPointLabel to the Graph Area Right Edge
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

If you set the DataPointLabelAlignment property of the BarSeries, you may align with respect to the current datapoint base or end value. There is no option for aligning with respect to the Axis or with the Graph.

## Suggested Workarounds

The property DataPointLabelOffset can move the label with a hard-coded value right-ward. If its value is bigger than the available width, it will place the label at the right-most possible position, i.e. as if it is right-aligned with respect to the Graph Chart Area. When you set the DataPointLabelConnectorStyle > _Visible_ to _False_, the data point label should appear as the labels are right-aligned. Here are the exact steps:

 + Set __DataPointLabelAlignment__ to __OutsideEnd__;

 + Set __DataPointLabelOffset__ to a very large value, for example, the width of the Graph;

 + Set __DataPointLabelConnectorStyle.Visible__ to __False__.

A sample may be found in our GitHub Repository - [BarSeriesDataPointLabelAlignment.trdp](/resources/BarSeriesDataPointLabelAlignment.trdp)
