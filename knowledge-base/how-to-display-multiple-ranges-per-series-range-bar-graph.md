---
title: How to display multiple ranges per series in a Range Bar graph
description: How to show multiple ranges per series in a Range Bar graph
type: how-to
page_title: How to render multiple ranges per series in a Range Bar graph
slug: how-to-display-multiple-ranges-per-series-range-bar-graph
position: 
tags: Graph, Range, Ranges, Range Bar
ticketid: 1579446
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

By default, the `Range Bar` graph wizard will display only the last data instance of a given `Category`.

This means that if a category has more than 1 data record associated with it, instead of creating a range bar for each, only the last one will be rendered while the rest will be omitted.

In this article, we will explain how to setup the `Graph` item so that it is able to render more than one range per category.
For the example, that we will be preparing, we have decided to use the following data:

````
Start,End,Category
0,540,A
540,600,B
600,1020,C
1020,1080,D
1080,1439,A
````

## Solution

- First, let's create a new `Range Bar` graph from the `Insert` menu on the top. The graph fields may look as follows:

![RangeBarArrangeFieldsMultipleSeriersKB](images/RangeBarArrangeFieldsMultipleSeriersKB.PNG)

- In order force the Graph to render multiple ranges per series, we will now need to create an __empty__ series group:

![EmptySeriesGroupWizard](images/EmptySeriesGroupWizard.PNG)

The multiple ranges will now be displayed, however, they will be at different positions vertically.

- Set [GraphSeries.ArrangeMode](../api/telerik.reporting.graphseriesarrangemode) to `Overlapped`. Now, the series will be at the same vertical position.

![OverlappedGraphSeries](images/OverlappedGraphSeries.PNG)

- Because of the `SeriesGroup` that we created, all ranges will now have their own colors. To fix that, we may create a new [ColorPalette]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/series%}#defining-custom-palettes) with only one color.

- Considering that we have an empty series group, we may hide the `GraphLegend` by selecting it and then from `Style` setting `Visible` to `False`.

## See Also

[Download Sample Report](resources/RangeBarGraph.zip)
