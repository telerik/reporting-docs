---
title: Center Aligning Legend Mark in the Graph
description: "Learn how to vertically align the legend mark for the graph component in Telerik Reporting."
type: how-to
page_title: How to Control the Vertical Alignment of the Legend Mark
slug: center-align-legend-text-telerik-reporting
tags: reporting, graph, legend, text alignment, center align
res_type: kb
ticketid: 1682367
---

## Description
When designing reports, aligning the [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}) legend's mark and text correctly is crucial for readability and aesthetics. This knowledge-based article explains how to adjust the legend text alignment in a graph within Telerik Reporting. Also answers the following questions:

- How do I center align the legend mark in Telerik Reporting?
- What property adjusts the legend mark alignment in a graph?
- How can I ensure my graph's legend mark is properly centered?

## Environment
<table>
  <tbody>
      <tr>
        <td>Product</td>
        <td>Progress® Telerik® Reporting</td>
      </tr>
      <tr>
        <td>Report Item</td>
        <td>Graph</td>
      </tr>
    </tbody>
</table>

## Solution

To center align the legend text in a graph component, follow these steps:

1. Select the [Graph]({%slug telerikreporting/designing-reports/report-structure/graph/overview%}) item in the report.
1. Expand to the [Series](/api/telerik.reporting.graphseries) collection proeprty of the graph.
1. Choose the series for which you want to adjust the Legend mark alignment.
1. From the [LegendItem](/api/telerik.reporting.graphseriesbase#Telerik_Reporting_GraphSeriesBase_LegendItem) dropdown, select the [MarkStyle](/api/telerik.reporting.legenditem#Telerik_Reporting_LegendItem_MarkStyle) property.
1. Adjust the [VerticalAlign](/api/telerik.reporting.drawing.style#Telerik_Reporting_Drawing_Style_VerticalAlign) property within [MarkStyle](/api/telerik.reporting.legenditem#Telerik_Reporting_LegendItem_MarkStyle) to set the alignment box to the middle, vertically aligning the legend mark in the center within the legend box.

![How to center align a Graph's Legend Mark](images/centerAlignLegendText.png)

## See Also
* [Graph Product Documentation]({%slug telerikreporting/designing-reports/report-structure/graph/overview%})
* [Styling the Graph]({%slug add-pattern-styles-graph-column-stack-bars-telerik-reporting%})
* [Report Items Overview]({%slug telerikreporting/designing-reports/report-structure/overview%})
