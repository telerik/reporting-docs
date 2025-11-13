---
title: Removing Bar Border in Graph
description: Learn how to remove the darker border around bars in a graph within Telerik Reporting.
type: how-to
page_title: How to Remove Graph Bar Borders in Telerik Reporting
meta_title: How to Remove Graph Bar Borders in Telerik Reporting
slug: removing-bar-border-in-graph
tags: reporting, graph, series, datapointstyle, linewidth
res_type: kb
ticketid: 1702817
---

## Environment

<table>
<tbody>
<tr>
<td>Product</td>
<td>Reporting</td>
</tr>
<tr>
<td>Version</td>
<td>18.3.24.1112</td>
</tr>
</tbody>
</table>

## Description

I want to remove the darker, solid border around bars in a graph with a bar series. The border is more visible in the HTML viewer and overlaps the grid lines. The bars use a semi-transparent yellow color palette which allows grid lines to show through. The goal is to eliminate the darker border while maintaining the semi-transparent fill effect.

This knowledge base article also answers the following questions:
- How to adjust bar styles in Telerik Reporting?
- How to make graph bars transparent without borders?
- How to modify series borders in Telerik Reporting graphs?

## Solution

To remove the darker border around the bars:

1. Select the graph in the Telerik Reporting designer.
2. Expand the 'Series' property.
3. Locate and expand the 'DataPointStyle' property.
4. Set the 'LineWidth' property to `0pt`.

This removes the darker border around the bars, ensuring they appear without overlapping grid lines.

## See Also

- [Bar Chart](https://docs.telerik.com/reporting/report-items/graph/chart-types/bar)
- [Graph Styles](https://docs.telerik.com/reporting/report-items/graph/styling-overview)
- [Series Properties](https://docs.telerik.com/reporting/report-items/graph/graph-series-properties)
