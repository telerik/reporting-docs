---
title: Creating Error Bar Style Graphs
description: Learn how to create error bar style graphs in Telerik Report Designer using additional LineSeries for customization.
type: how-to
page_title: How to Create Custom Error Bar Style Graphs
meta_title: Create Custom Error Bar Style Graphs in Telerik Reporting
slug: error-bar-style-graphs
tags: reporting, graphs, markers, ohlc, line, series
res_type: kb
ticketid: 1709755
---

## Environment

<table>
<tbody>
<tr>
<td> Product </td>
<td> Reporting </td>
</tr>
</tbody>
</table>

## Description

I am trying to create an error bar style graph in Telerik Report Designer using markers with a vertical bar in the middle and horizontal bars at the top and bottom. When using `MarkerStyle = candlestick`, I cannot remove the left and right vertical lines, and with `MarkerStyle = bar`, the horizontal bars extend only one way each. 

This knowledge base article also answers the following questions:
- How to customize OHLC charts for specific marker styles in Telerik Report Designer?
- How to customize LineSeries in Telerik Report Designer?

## Solution

To create an error bar style graph, customize the OHLC chart:

1. Add additional `LineSeries` to the existing OHLC Bars.
1. Use three separate `LineSeries` for the High, Low, and Middle/Average values.
1. Set the `DataPointMarker` property to `Minus` for High/Low and `Circle` for Middle.
1. Ensure only the data markers are displayed by setting `DataPointStyle.Visible` to `True` and `LineStyle.Visible` to `False`. Example:
   ![Set ColorPalette, LineStyle, and DataPointStyle in the GraphSeries Collection Editor of the Standalone Report Designer.]()
1. Optionally, set the `ColorPalette` for all Series to `Monochromatic > Black` or any other desired palette to ensure all data points are the same color.

## See Also

- [OHLC Chart Overview]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/ohlc-charts/overview%})
- [Creating and Customizing Scatter Charts]({%slug telerikreporting/designing-reports/report-structure/graph/chart-types/scatter-charts/overview%})
