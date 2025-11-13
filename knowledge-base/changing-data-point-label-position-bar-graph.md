---
title: Changing Vertical Position of Data Point Label for Bar Graph
description: Learn how to change the vertical position of a data point label in a bar graph by utilizing a workaround with a dummy series.
type: how-to
page_title: Adjusting Data Point Label Position in Bar Graphs
meta_title: Adjusting Data Point Label Position in Bar Graphs
slug: changing-data-point-label-position-bar-graph
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

I have a bar graph where the data point label is positioned in the vertical center of the horizontal bar. I want the label to align with the top edge of the bar instead of being centered. Is there a way to achieve this?

This knowledge base article also answers the following questions:
- How to position data point label at the top of horizontal bar in a graph?
- How to use a dummy series for label placement in Reporting?
- How to format and hide series labels in bar graphs?

## Solution

To achieve the desired vertical alignment of the data point label at the top edge of the horizontal bar, use a workaround with a dummy series to simulate the label position. Follow these steps:

1. Duplicate the original series to create a new series specifically for the data point label. Name this series, for example, `TextSeries`.
   
2. Apply [Conditional Formatting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting) to make the dummy series transparent:
   - Set the `BackgroundColor` property of the new series to `Transparent`.

3. Add similar Conditional Formatting to hide the label on the original series:
   - This ensures the original series does not display overlapping labels.

4. Hide the dummy series from the legend:
   - Use Conditional Formatting to exclude the dummy series from appearing in the graph's legend.

By following these steps, the dummy series will display the data point labels aligned at the top edge of the bar, while the original series will remain unaffected.

## See Also

- [Conditional Formatting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/using-expressions/conditional-formatting)
- [Designing Reports](https://docs.telerik.com/reporting/designing-reports/overview)
- [Working with Graphs](https://docs.telerik.com/reporting/designing-reports/graph-overview)
