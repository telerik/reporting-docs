---
title: Aligning Legend Items Vertically in Telerik Reporting
description: Learn how to arrange legend items vertically in Telerik Reporting Graph items using non-breaking spaces or custom legends.
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

I want the legend items in my chart to appear vertically, with one item per line, instead of multiple items on the same line. Adding spaces did not work as the whitespace gets trimmed, and the items still align horizontally.

This knowledge base article also answers the following questions:
- How to vertically align legend items in Telerik Reporting?
- How to use non-breaking spaces in legend items for vertical arrangement?
- How to create a custom legend layout in Telerik Reporting?

## Solution

To align legend items vertically so that each item appears on a separate line, follow these solutions:

### Using Non-Breaking Spaces

* Use a string of Narrow Non-breaking spaces (`   `) in the legend item value. You may copy and paste other non-breaking spaces from the [Wikipedia Non-breaking Space article](https://en.wikipedia.org/wiki/Non-breaking_space) or other sources.
* Update the legend item value with these spaces, ensuring enough spaces are added to the end for alignment. Non-breaking spaces prevent trimming and help space out items.

Here is the Graph layout with the default legend:

![BarChart Graph with its default legend with multiple items on the same line.](images\graph-legend-default-alignment.png)

And the steps and the layout after applying the non-breaking spaces:

![BarChart Graph with legend items tailed with non-breaking spaces, having a single item per line.](images\graph-legend-nnbsp-alignment.png)

### Creating a Custom Legend

1. Place a `List` or `Table` report item next to the chart.
1. Bind the `List` or `Table` representing the legend to the corresponding data.
1. Configure the Table/List cells to display the required marks and text. For the former, you may use [PictureBox]({%slug telerikreporting/designing-reports/report-structure/picturebox%}) or [Shape]({%slug telerikreporting/designing-reports/report-structure/shape%}). Consider also [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}) and [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) for the styles.

### Using a User Function

1. Create a user function to pad legend item text to equal lengths. Refer to the [User Functions documentation]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%}).
1. Apply the function to each legend item to adjust alignment. Note that this option does not guarantee vertical stacking but may improve the layout.

## See Also

- [Graph Overview]({%slug telerikreporting/designing-reports/report-structure/graph/overview%})
- [User Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/extending-expressions/user-functions%})
- [Non-breaking Space](https://en.wikipedia.org/wiki/Non-breaking_space)

