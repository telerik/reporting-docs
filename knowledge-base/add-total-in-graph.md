---
title: Adding Overall Total That Doesn't Exist as a Data Field in Graph
description: How to add a Total that doesn't come from the data source in the Graph
type: how-to
page_title: Add Total in Graph
slug: add-total-in-graph
position: 
tags: graph, total
ticketid: 1549075
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

I need to add a separate category for the overall total in my Graph. This total doesn't come from the data source. The data is structured in groups, and I need the total for all the groups in a separate category.

## Solution

Let's assume that we have used the Graph Wizard to add a Column Chart that displays the value (for example Counts) ordered in categories (for example Facilities) and series (e.g. Years). The data for each category and series will be filtered by the corresponding values. In order to display the total for each year, we need to have a new barSeries, which __Category group__ is __static__ so that it includes all the data. Hence we:

* add a new static category group. You may set its label to what you need to be displayed on the category axis

* add new barSeries with the same coordinate system, the same series group, and the category group that is the newly created static one. It should display the same value, i.e. the sum of the counts

Here is also a [link to a muted video](https://screencast-o-matic.com/watch/c3Vl6VVoy4h) that demonstrates the approach.

The second barSeries we introduced result in duplicated Series labels. You may fix this by removing the legend item of the second barSeries. Select the series and set its __LegendItem > Style > Visible__ to __False__ as displayed on the [linked screenshot](https://www.screencast.com/t/yipfUZEWJW).

You may find the demo report [TotalInGraph.trdp in our Reporting Samples](https://github.com/telerik/reporting-samples/blob/master/TotalInGraph.trdp)
