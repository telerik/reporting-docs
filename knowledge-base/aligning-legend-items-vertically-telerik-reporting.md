---
title: Aligning Legend Items Vertically in Telerik Reporting
description: Learn how to arrange legend items vertically in Telerik Reporting histograms using non-breaking spaces or custom legends.
type: how-to
page_title: Making Legend Items Appear One Per Line in Telerik Reporting
meta_title: Making Legend Items Appear One Per Line in Telerik Reporting
slug: aligning-legend-items-vertically-telerik-reporting
tags: reporting, legend, histogram, custom-legend, non-breaking-space
res_type: kb
ticketid: 1699541
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

I want the legend items in my histogram report to appear vertically, with one item per line, instead of multiple items on the same line. Adding spaces did not work as the whitespace gets trimmed, and the items still align horizontally.

This knowledge base article also answers the following questions:
- How to vertically align legend items in Telerik Reporting?
- How to use non-breaking spaces in legend items for vertical arrangement?
- How to create a custom legend layout in Telerik Reporting?

## Solution

To align legend items vertically so that each item appears on a separate line, follow these solutions:

### Using Non-Breaking Spaces

1. Add non-breaking space characters to the end of the legend item value. Non-breaking spaces prevent trimming and help space out items.
2. Use a string of Narrow Non-breaking spaces (`   `) in the legend item value. Copy and paste non-breaking spaces from the [Wikipedia Non-breaking Space article](https://en.wikipedia.org/wiki/Non-breaking_space).
3. Update the legend item value with these spaces, ensuring enough spaces are added for alignment.

### Creating a Custom Legend

1. Place a `List` or `Table` report item next to the chart.
2. Bind the legend data to the custom legend element.
3. Style each item to appear on its own line to achieve a vertical layout.

### Using a User Function

1. Create a user function to pad legend item text to equal lengths. Refer to the [User Functions documentation](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions).
2. Apply the function to each legend item to adjust alignment. Note that this option does not guarantee vertical stacking but may improve the layout.

## See Also

- [Graph Overview](https://docs.telerik.com/reporting/graph-overview)
- [User Functions](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions)
- [Non-breaking Space](https://en.wikipedia.org/wiki/Non-breaking_space)

