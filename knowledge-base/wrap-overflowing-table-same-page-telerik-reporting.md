---
title: Wrapping Overflowing Rotated Table on the Same Page
description: "Learn how to wrap a rotated table that overflows on the same page in Telerik Reporting."
type: how-to
page_title: How to Wrap an Overflowing Table on the Same Page in Telerik Reporting
slug: wrap-overflowing-table-same-page-telerik-reporting
tags: table, rotated, Telerik Reporting
res_type: kb
ticketid: 1636945
---

## Environment

| Product | Progress Telerik Reporting |
|---------|---------------------------|

## Description

I want to wrap a rotated table in Telerik Reporting if it doesn't fit inside the page horizontally. Additionally, I want the column headers to be visible in the wrapped content.

## Solution

To achieve this, you can use [Report Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}) in Telerik Reporting. Each group will render an instance of the rotated table with data for as many items as can fit on one page. To show the headers on each new row or table, you can use the [RowHeadersPrintOnEveryPage](/api/telerik.reporting.table#Telerik_Reporting_Table_RowHeadersPrintOnEveryPage) property of the table.

Follow these steps to wrap the overflowing table on the same page in Telerik Reporting:

1. Add an Integer [Report Parameter]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) to the report to define the count of items in each row. Let's name it `ItemsOnPage`.
1. Assign a DataSource to the Report. It should contain a zero-based indexing field. Let's name it `Index`.
1. Add a Report Group with Grouping `= Fields.Index / Parameters.ItemsOnPage.Value`. This allows you to easily split the data into sets with a proper count determined by the integer Parameter value.
1. Place the Table in the Group Header or Footer section and [Bind]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) the Table DataSource to the parent DataSource, which contains only the data for the corresponding Report Group.
1. Set the Table's `RowHeadersPrintOnEveryPage` to `True` so that the headers to be displayed on each row.
1. Run the report in `PrintPreview` mode and select a Report Parameter value that prevents the table from spilling onto the next page when you test.

That's it! Your table will now wrap and display the column headers on each new row.

## Sample Report



## Notes

Make sure to adjust the `ItemsOnPage` Parameter value based on the number of items that can fit on one page.

## See Also

* [Telerik Reporting Documentation](https://docs.telerik.com/reporting/overview)
