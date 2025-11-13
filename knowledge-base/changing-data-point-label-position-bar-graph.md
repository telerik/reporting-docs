---
title: Changing Vertical Position of Data Point Label for Bar Graph
description: Learn how to change the vertical position of a data point label in a bar graph by utilizing a workaround with a dummy series.
type: how-to
page_title: Adjusting Data Point Label Vertical Position in Bar Graphs
meta_title: Adjusting Data Point Label Vertical Position in Bar Graphs
slug: changing-data-point-label-vertical-position-bar-graph
tags: reporting, bar graph, datapointlabel, conditional-formatting, series
res_type: kb
ticketid: 1702270
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Reporting</td>
</tr>
</tbody>
</table>

## Description

I have a bar graph where the data point label is positioned in the vertical center of the horizontal bar. I want the label to align with the top of the bar instead of being centered inside the bar. Is there a way to achieve this?

This knowledge base article also answers the following questions:
- How to position the data point label at the top of the horizontal bar in a graph?
- How to format and hide series labels in bar graphs?

Here is the desired output:

![The desired Bar Chart with DataPoint labels on top of the series.](images/Graph/bar-graph-with-datapoint-label-on-top-of-series.png)

## Solution

To achieve the desired vertical alignment of the data point label at the top of the horizontal bar, use a workaround with a dummy series to simulate the label position. Follow these steps:

1. Duplicate the original series to create a new dummy series specifically for the data point label. Name this series, for example, `TextSeries`.
1. Apply [Conditional Formatting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting%}) to make the dummy series transparent:

	- Set the `BackgroundColor` property of the dummy series to `Transparent`:

	![Set the BackgroundColor of the DataPoint of the dummy series to `Transparent` with Conditional Formatting in the Standalone Designer.](images/Graph/bar-series-datapoint-conditional-formatting-background.png)

1. Add similar Conditional Formatting to hide the label on the original series:

	- This ensures the original series does not display overlapping labels.

	![Hide the DataPointLabel of the main series with Conditional Formatting in the Standalone Designer.](images/Graph/hide-bar-series-datapoint-label-conditional-formatting.png)

1. Hide the dummy series from the legend:

	- Use Conditional Formatting to exclude the dummy series from appearing in the graph's legend.

	![Hide the Legend of the dummy series with Conditional Formatting in the Standalone Designer.](images/Graph/hide-dummy-series-legend-conditional-formatting.png)

By following these steps, the dummy series will display the data point labels aligned at the top of the bar, while the original series will remain unaffected.

Download the [demo report BarChartWithDataPointLabelAbove.trdx](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/BarChartWithDataPointLabelAbove.trdx) from the reporting-samples repo.

## See Also

- [Conditional Formatting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting%})
- [Creating and Customizing Bar Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/overview%})
- [Designing Reports]({%slug telerikreporting/designing-reports/overview%})
- [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%})
