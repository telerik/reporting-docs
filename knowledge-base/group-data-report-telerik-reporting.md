---
title: Grouping Data Within a Single Report DataSource
description: "Learn how to group data by a column in a Telerik Reporting report using List and Crosstab items."
type: how-to
page_title: How to Group Report Data by Column
slug: group-data-report-telerik-reporting
tags: telerik, reporting, group, data, datasource, list, crosstab
res_type: kb
ticketid: 1588256
---

## Environment

<table>
  <tbody>
    <tr>
      <td>Product</td>
        <td>Progress® Telerik® Reporting</td>
          </tr>
          <tr>
        <td>Version</td>
      <td>15.1.21.616</td>
    </tr>
  </tbody>
</table>

## Description

Creating a report with grouped data according to a specific column, including conditional formatting and total calculations, is required. This knowledge-base article also answers the following questions:

- How to use a single DataSource to group data in a Telerik Report?
- How to add a Crosstab with row grouping by a specific criterion in a Telerik Report?
- How to apply conditional formatting for alternating rows in a Telerik Report?

## Solution

To achieve a report with data grouped by a specific column, including conditional formatting for alternating groups and total calculations, follow these steps:

1. Add a [List](https://docs.telerik.com/reporting/report-items/list/list-crosstab-list) item to the Detail section of the report and set its DataSource to the DataSource containing the fields to group by.

1. Add a new parent row group to the List, setting the expression of the group to the field(s) you wish to group by. Ensure the "Add Header" option is checked.

1. In the List header section, make it visible through the "Style.Visible" property. This section will display the grouped content.

1. Insert a [Panel](https://docs.telerik.com/reporting/report-items/panel) item in the header section of the List.

1. Add a TextBox item to the Panel and set its value to the field(s) the List is grouped by.

1. Add a Table item to the Panel (below the TextBox) and set its DataSource to the DataObject of the List through a Binding. 

1. For conditional formatting, select the Panel item and apply a background colour alternation between groups using the expression `= RowNumber('name-of-the-list-item') % 2`.

1. To add totals, use a Crosstab item with row grouping by the criterion (e.g., Gender) and add a Total outside the gender groups to display the Sum of both genders.

1. Apply conditional formatting to the Crosstab for alternating district backgrounds using the same modulo operation as in step 7.

This approach eliminates the need for multiple DataSource calls and allows for efficient grouping, total calculations, and conditional formatting within a single report.

## See Also

- [How to Use the ReportItem.DataObject Property in Expressions](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions#use-dataobject-as-a-datasource-for-nested-data-items-table-list-crosstab-graph)
- [Using Expressions in Telerik Reporting](https://docs.telerik.com/reporting/designing-reports/connecting-to-data/expressions/using-expressions)
- [How to Display Alternating Style Rows in Telerik Reporting](https://docs.telerik.com/reporting/knowledge-base/how-to-display-alternating-style-rows)
- [List Crosstab List Documentation](https://docs.telerik.com/reporting/report-items/list/list-crosstab-list)
- [Panel Item in Telerik Reporting](https://docs.telerik.com/reporting/report-items/panel)
