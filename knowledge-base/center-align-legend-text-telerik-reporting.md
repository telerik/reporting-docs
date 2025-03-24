---
title: Center Aligning Legend Text in Telerik Reporting Graph
description: Learn how to center align the legend text for a graph component in Telerik Reporting.
type: how-to
page_title: How to Center Align Legend Text in Graphs with Telerik Reporting
slug: center-align-legend-text-telerik-reporting
tags: reporting, graph, legend, text alignment, center align
res_type: kb
ticketid: 1682367
---

## Description
When designing reports, aligning chart legends and text correctly is crucial for readability and aesthetics. This knowledge-based article explains how to adjust the legend text alignment in a graph within Telerik Reporting. Also answers the following questions:
- How do I center align legend text in Telerik Reporting?
- What property adjusts the legend text alignment in a graph?
- How can I ensure my graph's legend text is properly centered?

## Environment
<table>
  <tbody>
      <tr>
        <td>Product</td>
        <td>Progress® Telerik® Reporting</td>
      </tr>
      <tr>
        <td>Version</td>
        <td>18.1.24.709</td>
      </tr>
    </tbody>
</table>

## Solution
To center align the legend text in a graph component, follow these steps:

1. Select the graph in your report.
2. Navigate to the `Series` collection of the graph.
3. Choose the series for which you want to adjust the legend text alignment.
4. From the `LegendItem` dropdown, select the `MarkStyle` property.
5. Adjust the `VerticalAlign` property within `MarkStyle` to set the alignment box to the middle, aligning the legend text center with respect to the legend box.

This approach ensures that the legend text is centered, improving the visual appeal and legibility of your reports.

![](images/)

## See Also
* [Graph Product Documentation]({%slug telerikreporting/designing-reports/report-structure/graph/overview%})
* [Styling the Graph]({%slug add-pattern-styles-graph-column-stack-bars-telerik-reporting%})
* [Report Items Overview]({%slug telerikreporting/designing-reports/report-structure/overview%})
