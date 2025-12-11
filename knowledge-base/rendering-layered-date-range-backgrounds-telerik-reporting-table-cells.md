---
title: Rendering Layered Backgrounds in Telerik Reporting
description: "Learn how to implement layered background rendering for date ranges inside crosstab/table/list cells."
type: how-to
page_title: How to Render Overlapping Date Ranges inside Crosstabs in Telerik Reporting
meta_title: How to Render Overlapping Date Ranges inside Crosstabs in Telerik Reporting
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
    </tbody>
</table>

## Description

I need to display overlapping date ranges inside a [Crosstab/Table/List]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) report item. Each row represents a unit, and each monthly cell should visually depict three date ranges with distinct background colors. 

The ranges overlap, and their rendering should follow a layered approach, with the outermost range appearing behind the inner ones. I need guidance on calculating pixel positions dynamically and rendering layered backgrounds within each cell.

## Solution

To achieve layered background rendering for overlapping date ranges:

1. Use a [Crosstab]({%slug crosstab_item_get_started%}) item to represent the data in a tabular format.
1. Place a [Panel]({%slug telerikreporting/designing-reports/report-structure/panel%}) inside the crosstab cells where you need to display the date ranges. The panel will occupy the entire cell and act as a *container* for other elements, such as **TextBox** items. This approach allows you to configure the textboxes as needed, since a single textbox alone would otherwise fill the entire cell.
1. Add multiple [TextBox]({%slug telerikreporting/designing-reports/report-structure/textbox%}) items inside the panel to represent the date ranges. Each TextBox should correspond to a single date range color.
1. Bind the [Location](/api/telerik.reporting.reportitem#Telerik_Reporting_ReportItem_Location) and [Width](/api/telerik.reporting.reportitem#Telerik_Reporting_ReportItem_Width) of each TextBox dynamically using [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}). This ensures the rectangles are rendered proportionally based on the date range extracted from the data.

### Example

Below is an example dataset and binding configuration:

**Sample Data:**

```csv
text,date,month,sizex,position
1,01/01/2025,1,0.5in,1.5in
1,01/01/2025,2,0.3in,0in
```

>note Ensure that the data includes the X and Y positions, and the sizes of the range bars. These values determine the length of the colored textbox that is being used to represent the range bar.

![Layered Background Rendering for Overlapping Date Ranges](images/rendering-layered-date-range-backgrounds.png)

## Sample Report

Download the [rendering-layered-date-range-backgrounds.trdp](https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/RenderingLayeredDateRangeBackgrounds/rendering-layered-date-range-backgrounds.trdp) report definition.

## See Also

* [Telerik Reporting Crosstab Overview]({%slug crosstab_item_get_started%})
* [Telerik Reporting Panel Overview]({%slug telerikreporting/designing-reports/report-structure/panel%})
* [Telerik Reporting TextBox Overview]({%slug telerikreporting/designing-reports/report-structure/textbox%})
* [Using Expressions in Telerik Reporting]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/overview%})
* [How to Display Reports with Alternating Style Rows]({%slug how-to-display-alternating-style-rows%})
