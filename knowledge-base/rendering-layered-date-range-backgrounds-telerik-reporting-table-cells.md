---
title: Rendering Layered Backgrounds in Telerik Reporting Crosstab Cells
description: Learn how to implement layered background rendering for date ranges inside crosstab cells.
type: how-to
page_title: How to Render Overlapping Date Ranges in Crosstab Cells in Telerik Reporting
meta_title: How to Render Overlapping Date Ranges in Crosstab Cells in Telerik Reporting
slug: rendering-layered-date-range-backgrounds-telerik-reporting-crosstab-cells
tags: reporting, crosstab, textbox, panel, expressions, bindings, date-range, overlapping-backgrounds
res_type: kb
ticketid: 1703676
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
            <td> Current </td>
        </tr>
    </tbody>
</table>

## Description

I need to display overlapping date ranges inside a Telerik Reporting crosstab cell. Each row represents a unit, and each monthly cell should visually depict three date ranges with distinct background colors. The ranges overlap, and their rendering should follow a layered approach, with the outermost range appearing behind the inner ones. I need guidance on calculating pixel positions dynamically and rendering layered backgrounds within each cell.

## Solution

To achieve layered background rendering for overlapping date ranges:

1. Use a [Crosstab]({%slug crosstab_item_get_started%}) to represent the data.
1. Place a [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}) nside the crosstab cells where you need overlapping elements. The panel will occupy the entire cell and act as a container for other elements, such as textboxes. This approach allows you to configure the textboxes as needed, since a single textbox alone would otherwise fill the entire cell.
1. Add multiple [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}) items inside the panel to represent the date ranges. Each TextBox corresponds to one date range.
1. Bind the position and size of each TextBox dynamically using [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}). This ensures the rectangles are rendered proportionally based on the date range.

### Example

Below is an example dataset and binding configuration:

**Sample Data:**

```

text,date,month,sizex,position
1,01/01/2025,1,0.5in,1.5in
1,01/01/2025,2,0.3in,0in

```
Ensure that your data includes the X and Y position and size values. These values determine the length of the colored textbox. Below are the two bindings applied to the textbox:

![Layered Background Rendering for Overlapping Date Ranges](images/rendering-layered-date-range-backgrounds.png)

## Sample Report

* [rendering-layered-date-range-backgrounds.trdp](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/RenderingLayeredDateRangeBackgrounds/rendering-layered-date-range-backgrounds.trdp)

## See Also

* [Telerik Reporting Crosstab Overview]({%slug crosstab_item_get_started%})
* [Telerik Reporting Panel Overview]({%slug telerikreporting/designing-reports/report-structure/panel%})
* [Telerik Reporting TextBox Overview]({%slug telerikreporting/designing-reports/report-structure/textbox%})
* [Using Expressions in Telerik Reporting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%})
* [How to Display Reports with Alternating Style Rows]({%slug how-to-display-alternating-style-rows%})
