---
title: Removing Bar Border in Bar and Column Graphs
description: "Learn how to remove the darker border around bars in a graph within Telerik Reporting."
type: how-to
page_title: How to Remove Graph Bar Borders in Telerik Reporting
meta_title: How to Remove Graph Bar Borders in Telerik Reporting
slug: removing-bar-border-in-graph
tags: reporting, graph, series, datapointstyle, linewidth
res_type: kb
ticketid: 1702817
---

<style> img[alt$="><"] { border: 1px solid lightgrey; } </style>

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

I want to remove the darker, solid border around bars in a graph with a bar series. The border is more visible in the HTML5 Report Viewer and overlaps the grid lines. The bars use a semi-transparent yellow color palette, which allows grid lines to show through. The goal is to eliminate the darker border while maintaining the semi-transparent fill effect.

![Showing the Borders Around the Bars ><](images/BarBordersAroundBars.png)

## Solution

To remove the darker border around the bars:

1. Select the graph in the [Report Designer tool]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}) of choice.
1. Expand the **Series** property.
1. Locate and expand the [DataPointStyle](/api/telerik.reporting.graphseriesbase#Telerik_Reporting_GraphSeriesBase_DataPointStyle) property of the [GraphSeries](/api/telerik.reporting.graphseries).
1. Set the **LineWidth** property to **0pt**.

![Using LineWidth Property To Remove the Borders Around the Bars ><](images/UsingLineWidthPropertyBarGraph.png)

This removes the darker border around the bars, ensuring they appear without overlapping grid lines.

## See Also

* [Bar Chart]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/bar-charts/overview%})
* [Getting Started with the Graph Report Item]({%slug graph_item_get_started%})
* [Series of the Graph]({%slug telerikreporting/designing-reports/report-structure/graph/formatting-a-graph/series%})
