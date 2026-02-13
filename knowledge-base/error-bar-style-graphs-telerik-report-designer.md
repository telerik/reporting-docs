---
title: Creating Error Bar Style Graphs in Telerik Report Designer
description: Learn how to create error bar style graphs in Telerik Report Designer using additional LineSeries for customization and manage X-axis scaling dynamically.
type: how-to
page_title: How to Create Custom Error Bar Style Graphs in Telerik Report Designer
meta_title: Create Custom Error Bar Style Graphs in Telerik Report Designer
slug: error-bar-style-graphs-telerik-report-designer
tags: reporting, graphs, markers, ohlc, x-axis-scaling, bindings
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
<tr>
<td> Version </td>
<td> 19.2.25.924 </td>
</tr>
</tbody>
</table>

## Description

I am trying to create an error bar style graph in Telerik Report Designer using markers with a vertical bar in the middle and horizontal bars at the top and bottom. When using `MarkerStyle = candlestick`, I cannot remove the left and right vertical lines, and with `MarkerStyle = bar`, the horizontal bars extend only one way each. Additionally, there is an issue with automatic scaling of the X-axis where OHLC bar widths sometimes extend out of the graph. I need a solution to set dynamic min and max X-axis values, as the `Minimum` and `Maximum` properties do not accept expressions.

This knowledge base article also answers the following questions:
- How to customize OHLC charts for specific marker styles in Telerik Report Designer?
- How to dynamically set X-axis scale limits in Telerik Report Designer?
- How to fix graph elements extending beyond the chart area in Telerik Report Designer?

## Solution

To create an error bar style graph and customize the OHLC chart markers:

1. Add additional `LineSeries` to the existing OHLC Bars.
2. Use three separate `LineSeries` for the High, Low, and Middle values if needed.
3. Set the `DataPointMarker` property to `Minus` for High/Low and `Circle` for Middle.
4. Ensure only the data markers are displayed by setting `DataPointStyle.Visible` to `True` and `LineStyle.Visible` to `False`. Example:
   ```
   DataPointMarker: Minus (High/Low), Circle (Middle)
   DataPointStyle.Visible: True
   LineStyle.Visible: False
   ```
5. Optionally, set the `ColorPalette` to `Monochromatic > Black` or any other desired palette.

For the issue with X-axis scaling:

1. Use Bindings for the `CoordinateSystem` to set dynamic `Minimum` and `Maximum` values.
2. Follow the [Bindings documentation](https://www.telerik.com/products/reporting/documentation/designing-reports/connecting-to-data/expressions/using-expressions/bindings) to bind the properties to data expressions.

## See Also

- [Telerik Reporting Documentation](https://www.telerik.com/products/reporting/documentation/overview)
- [Using Expressions in Telerik Reporting](https://www.telerik.com/products/reporting/documentation/designing-reports/connecting-to-data/expressions/using-expressions)
- [OHLC Chart Overview](https://www.telerik.com/products/reporting/documentation/designing-reports/graph/ohlc-chart)
