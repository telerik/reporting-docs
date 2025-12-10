---
title: Displaying Column Totals and Formatting Dates in Column Chart
description: Learn how to display monthly totals at the top of columns and format dates at the bottom of the X-axis in a Column Chart.
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
   </tbody>
</table>

## Description

I want to display the total for each month at the top of the column in a Column Chart and format the month and year at the bottom of the X-axis. I need steps to achieve this functionality.

## Solution

To display the monthly totals at the top of each column and format the X-axis dates:

1. Change the `DataPointStyle` property to make it visible. This ensures that the total values appear above the columns.

   ![Setting the DataPointStyle property to True.](images/DataPointStyleVisible.png)

1. Use the `Label` property of the category group to format the month and year display on the X-axis. Set the property to the following expression:

   `= Fields.CastDate.ToString("MMMM yyyy")`

   ![To display the dates at the bottom use the Label property.](images/LabelPropertyCategoryGroups.png)

These steps ensure that the monthly totals appear at the top of each column and the X-axis displays the formatted month and year.

## See Also

* [Reporting Overview]({%slug telerikreporting/welcome-to-telerik-reporting!%})
* [Date and Time Functions Overview]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/date-and-time-functions%})
* [Group Explorer of the Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/group-explorer%}) 
