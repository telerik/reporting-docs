---
title: Adding Overall Total That Doesn't Exist as a Data Field in Graph
description: "Learn how to add a Total that doesn't come from the data source in the Graph in Telerik Reporting."
type: how-to
page_title: Add Total that is not sepcified as a data field in the Graph
slug: add-total-in-graph
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

Let's assume that we have used the Graph Wizard to add a Column Chart that displays the value (for example `Counts`) ordered in categories (for example `Facilities`) and series (e.g. `Years`). The data for each category and series will be filtered by the corresponding values. In order to display the total for each year, we need to have a new barSeries, which __Category group__ is __static__ so that it includes all the data. Hence we:

* __add a new static category group__ You may set its label to what you need to be displayed on the category axis
* __add new barSeries__ It should:

	+ be with the same coordinate system
	+ be with the same series group
	+ be with category group that is the newly created static one
	+ display the same value, i.e. the sum of the counts
	+ the second barSeries we introduced result in duplicated Series labels. You may fix this by removing the legend item of the second barSeries. Select the series and set its __LegendItem > Style > Visible__ to __False__ as displayed on the [linked screenshot](https://www.screencast.com/t/yipfUZEWJW).

## Sample

* Here is a [link to a muted video](https://screencast-o-matic.com/watch/c3Vl6VVoy4h) that demonstrates the approach.
* You may download the demo report [`TotalInGraph.trdp` from our Reporting Samples repository](https://github.com/telerik/reporting-samples/blob/master/TotalInGraph.trdp).
