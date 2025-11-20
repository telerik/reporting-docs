---
title: Rendering Layered Backgrounds in Telerik Reporting Table Cells
description: Learn how to implement layered background rendering for date ranges inside table cells in Telerik Reporting.
type: how-to
page_title: How to Render Overlapping Date Ranges in Table Cells in Telerik Reporting
meta_title: How to Render Overlapping Date Ranges in Table Cells in Telerik Reporting
slug: rendering-layered-date-range-backgrounds-telerik-reporting-table-cells
tags: reporting, table, textbox, panel, expressions, bindings, date-range, overlapping-backgrounds
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

I need to display overlapping date ranges inside a Telerik Reporting table cell. Each row represents a unit, and each monthly cell should visually depict three date ranges with distinct background colors. The ranges overlap, and their rendering should follow a layered approach, with the outermost range appearing behind the inner ones. I need guidance on calculating pixel positions dynamically and rendering layered backgrounds within each cell.

This knowledge base article also answers the following questions:
- How to dynamically render overlapping colored bars inside table cells in Telerik Reporting?
- How to use bindings for custom background rendering in Telerik Reporting?
- How to implement layered date range visualizations in Telerik Reporting?

## Solution

To achieve layered background rendering for overlapping date ranges inside table cells:

1. Use a [Crosstab](https://docs.telerik.com/reporting/report-items/table-crosstab-list/get-started) to represent the data.
2. Place a [Panel](https://docs.telerik.com/reporting/report-items/panel) inside each table cell. The panel occupies the entire cell and provides a container for overlapping elements.
3. Add multiple [TextBox](https://docs.telerik.com/reporting/report-items/textbox) items inside the panel to represent the date ranges. Each TextBox corresponds to one date range.
4. Bind the position and size of each TextBox dynamically using [Bindings](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings). This ensures the rectangles are rendered proportionally based on the date range.

### Example

Below is an example dataset and binding configuration:

**Sample Data:**
```
text,date,month,sizex,position
1,01/01/2025,1,0.5in,1.5in
1,01/01/2025,2,0.3in,0in
```

**Implementation Steps:**

1. Define the data source with fields for position (`position`) and size (`sizex`) based on the date range.
2. Place a panel inside each cell of the Crosstab.
3. Add three TextBox items inside the panel. Bind their `Style.Width` and `Style.Left` properties to the `sizex` and `position` fields respectively.

**Code Snippet:**
```xml
<Panel Name="DateRangePanel" Style="Width: 2in; Height: 0.5in;">
    <TextBox Name="DateRange1" Value="Date Range 1" Style="Width: = Fields.sizex; Left: = Fields.position; BackgroundColor: Red;" />
    <TextBox Name="DateRange2" Value="Date Range 2" Style="Width: = Fields.sizex; Left: = Fields.position; BackgroundColor: Blue;" />
    <TextBox Name="DateRange3" Value="Date Range 3" Style="Width: = Fields.sizex; Left: = Fields.position; BackgroundColor: Green;" />
</Panel>
```

### Notes:
- Adjust the `sizex` and `position` values dynamically using expressions to ensure correct rendering based on the date range.
- Ensure the layering order by setting the `ZIndex` of each TextBox appropriately.

## See Also

- [Telerik Reporting Crosstab Overview](https://docs.telerik.com/reporting/report-items/table-crosstab-list/get-started)
- [Telerik Reporting Panel Overview](https://docs.telerik.com/reporting/report-items/panel)
- [Telerik Reporting TextBox Overview](https://docs.telerik.com/reporting/report-items/textbox)
- [Using Expressions in Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions)
- [How to Display Reports with Alternating Style Rows](https://docs.telerik.com/reporting/knowledge-base/how-to-display-alternating-style-rows)
