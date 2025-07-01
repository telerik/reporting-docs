---
title: Creating a Timeline in Progress® Telerik® Reporting Designer
description: Learn how to create a timeline graphic in Progress® Telerik® Reporting Designer using PictureBox and List items.
type: how-to
page_title: How to Create Timeline Graphics in Telerik Reporting Designer
meta_title: How to Create Timeline Graphics in Telerik Reporting Designer
slug: create-timeline-telerik-reporting
tags: telerik, reporting, timeline, linear-gauge, picturebox, list, bar-chart, ohlc-chart
res_type: kb
ticketid: 1691259
---

## Environment
<table>
<tbody>
<tr>
<td> Product </td>
<td> Progress® Telerik® Reporting </td>
</tr>
<tr>
<td> Version </td>
<td> 19.1.25.521 </td>
</tr>
</tbody>
</table>

## Description

I need to create a timeline graphic in Progress® Telerik® Reporting Designer that displays time detail and attendance. The timeline should visually showcase mismatches between entered attendance and hours clocked by employees. It needs to include a scale from 12 am to 12 am and use visual elements to represent time, attendance, and mismatches with distinct colors.

This knowledge base article also answers the following questions:
- How to replicate a timeline design in Telerik Reporting?
- How to use PictureBox and List items to build a timeline in Telerik Reporting?
- How to visualize mismatches between time and attendance in Telerik Reporting?

## Solution

To create a timeline graphic, use either the [Linear Gauge](https://docs.telerik.com/reporting/report-items/gauge/linear-gauge) or a combination of [PictureBox](https://docs.telerik.com/reporting/report-items/picturebox) and List items. Below are the steps to achieve the desired result:

### Using PictureBox and List Items

1. **Prepare Data Source**:
   Convert the existing data source to include numerical representation for mismatches. Use a structure like this:
   ```json
   [{
       "Details":[
           {
               "Index": 0,
               "Color": "Blue",
               "Length": 6
           },
           {
               "Index": 1,
               "Color": "Green",
               "Length": 4
           },
           {
               "Index": 2,
               "Color": "Red",
               "Length": 2
           }
       ],
       "Attendance":[
           {
               "Index": 0,
               "Color": "Blue",
               "Length": 4
           },
           {
               "Index": 1,
               "Color": "Green",
               "Length": 6
           },
           {
               "Index": 2,
               "Color": "Red",
               "Length": 2
           }
       ]
   }]
   ```
   Ensure the `Index` field is unique for each array item.

2. **Create PictureBox for Scale**:
   Add a PictureBox to the report to display the fixed time scale from 12 am to 12 am.

3. **Configure List for Bars**:
   - Add two Lists—one for "Time Detail" and one for "Attendance".
   - Bind each List to its respective field (`Details` and `Attendance`) from the data source.
   - Set the List's `RowGrouping` to a constant value (e.g., `1`) to ensure a single row.
   - Configure `ColumnGrouping` to the `Index` field for dynamic column generation based on the data.

4. **Style Panels in List**:
   - Set the background color of each panel dynamically using binding: `= Fields.Color`.
   - Adjust the width of each panel dynamically using binding: `= Fields.Length * 0.25 + "in"`. Modify the multiplier `0.25` to match the scale length.

5. **Align Lists to Scale**:
   Position the Lists below the PictureBox to ensure alignment with the time scale.

### Alternative Using Charts

You can use [Bar Charts](https://docs.telerik.com/reporting/report-items/graph/chart-types/bar) or [OHLC Charts](https://docs.telerik.com/reporting/report-items/graph/chart-types/ohlc):
- Remove unnecessary elements like legends, X-axis, and labels.
- Adjust the chart width to match the fixed scale in the PictureBox.
- Use multiple series to represent mismatches, attendance, and time.

## See Also
- [Linear Gauge Documentation](https://docs.telerik.com/reporting/report-items/gauge/linear-gauge)
- [PictureBox Documentation](https://docs.telerik.com/reporting/report-items/picturebox)
- [List Item Documentation](https://docs.telerik.com/reporting/report-items/list)
- [Bar Chart Documentation](https://docs.telerik.com/reporting/report-items/graph/chart-types/bar)
- [OHLC Chart Documentation](https://docs.telerik.com/reporting/report-items/graph/chart-types/ohlc)
