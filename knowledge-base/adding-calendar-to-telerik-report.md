---
title: Create a Calendar with Telerik Report Designer
description: Learn how to add a calendar to Telerik Report and display multiple calendars for different positions using List items.
type: how-to
page_title: Creating Calendars in Telerik Report
meta_title: Creating Calendars in Telerik Report
slug: adding-calendar-to-telerik-report
tags: reporting, list, calendar, multicolumn
res_type: kb
ticketid: 1695126
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

I need to create a calendar within a Telerik Report that visually represents data for specific positions. I want to display a calendar per position, showing only the days relevant to that position. Currently, I convert a CSS-based calendar into an image and pass it into the report, but this approach is insufficient for handling multiple calendars. I need a more dynamic solution that allows the report to generate the calendar directly.

This knowledge base article also answers the following questions:
- How to create a calendar in Telerik Report using Crosstab or List?
- How to display multiple calendars dynamically in a report?
- How to generate a calendar for each position in a Telerik Report?

## Solution

To generate a calendar layout in Telerik Report, use a **Crosstab**, **Table**, or **List** item. Each cell represents a day, with weeks laid out as rows and days as columns.

### Using Crosstab or Table

1. Add a [Table or Crosstab item](https://docs.telerik.com/reporting/table-working-with-table-cross-table-list-items) to your report.
2. Set the column headers as weekdays (e.g., Sun, Mon, Tue).
3. Bind each cell to the specific date data.
4. Style cells to visually differentiate selected days using **Bindings**.

### Using List for Multi-Column Layout

1. Use a [List item](https://docs.telerik.com/reporting/knowledge-base/how-to-create-multi-column-report---across-the-page-and-then-down) to create a calendar layout.
2. Set the number of columns to 7 (days in a week).
3. Use an expression to set weekday headers. For example:
   ```
   = Switch(Fields.Index % 7, 0, "Sun", 1, "Mon", 2, "Tue", 3, "Wed", 4, "Thu", 5, "Fri", 6, "Sat")
   ```
4. Place the calendar list inside an outer list to repeat multiple calendars across and down the page.

### Highlighting Selected Days

1. Use the **Bindings** feature to dynamically change the text and background color for selected days.
2. Bind the List or Crosstab DataSource to its parent data to display multiple calendars dynamically.

### Resources

Refer to the following resources for detailed examples:
- [Creating a Calendar Report with Telerik Reporting](https://www.telerik.com/blogs/creating-a-calendar-report-with-telerik-reporting)
- [Designing a Calendar/Schedule Report](https://www.telerik.com/forums/designing-a-calendar-schedule-report)
- [Multi-Column Report - Across the Page and Then Down](https://docs.telerik.com/reporting/knowledge-base/how-to-create-multi-column-report---across-the-page-and-then-down)
- [Using Expressions and Bindings](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings)

## See Also

- [Table and Crosstab Overview](https://docs.telerik.com/reporting/table-working-with-table-cross-table-list-items)
- [Multi-Column Report Example](https://docs.telerik.com/reporting/knowledge-base/how-to-create-multi-column-report---across-the-page-and-then-down)
- [Expressions and Bindings](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings)
