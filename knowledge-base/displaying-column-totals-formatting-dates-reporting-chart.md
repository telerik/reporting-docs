---
title: Displaying Column Totals and Formatting Date in Reporting Chart
description: Learn how to display monthly totals at the top of columns and format dates at the bottom of the X-axis in a Reporting Chart.
type: how-to
page_title: How to Show Monthly Totals and Format Dates in Reporting Chart
meta_title: How to Show Monthly Totals and Format Dates in Reporting Chart
slug: displaying-column-totals-formatting-dates-reporting-chart
tags: reporting, chart, totals, date-formatting, datapointstyle, category-group
res_type: kb
ticketid: 1699481
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
<td> 18.2.24.806 </td>
</tr>
</tbody>
</table>

## Description

I want to display the total for each month at the top of the column in a Reporting Chart and format the month and year at the bottom of the X-axis. I need steps to achieve this functionality.

This knowledge base article also answers the following questions:
- How can I show totals above columns in a Reporting Chart?
- How do I display formatted month and year on the X-axis?
- What is the correct property to format date labels in a Reporting Chart?

## Solution

To display the monthly totals at the top of each column and format the X-axis dates:

1. Change the `DataPointStyle` property to make it visible. This ensures that the total values appear above the columns.

2. Use the `Label` property of the category group to format the month and year display on the X-axis. Set the property to the following expression:
   ```
   = Fields.CastDate.ToString("MMMM yyyy")
   ```

These steps ensure that the monthly totals appear at the top of each column and the X-axis displays the formatted month and year.

## See Also

- [Reporting Overview](https://docs.telerik.com/reporting/introduction)
- [Formatting Date and Time in Expressions](https://docs.telerik.com/reporting/expressions-date-time)
- [Category Groups in Charts](https://docs.telerik.com/reporting/designing-reports-grouping-data) 
