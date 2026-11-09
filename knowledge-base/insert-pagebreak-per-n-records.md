---
title: Insert PageBreak per N Records
description: "Learn how to insert page breaks after a fixed number of records in Telerik Reporting by creating a grouping field with SQL ROW_NUMBER."
type: how-to
page_title: Start a New Page After N Amount of Rows
slug: insert-pagebreak-per-n-records
tags: pagebreak, paging, grouping
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

I want to insert a page break in the report after a fixed number of records. The report generates more than 800 rows on a single page, but I want to display 100 rows per page. The dataset does not contain a suitable grouping field.

## Solution

Use the [`SqlDataSource` component](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview) to query the report data. Many databases provide functions that number rows in a result set, such as the [ROW_NUMBER function](https://learn.microsoft.com/en-us/sql/t-sql/functions/row-number-transact-sql) in `SQL Server`.

Use the `ROW_NUMBER` function to add a `GroupIdx` field to the result set. The following query returns 30 records and assigns the same `GroupIdx` value to each group of 10 records:

````SQL
SELECT
    (row_number() over (order by EmployeeID) -1)/10 as 'GroupIdx',
    [HumanResources].[vEmployee].[EmployeeID],
    [HumanResources].[vEmployee].[FirstName],
    [HumanResources].[vEmployee].[LastName],
    [HumanResources].[vEmployee].[JobTitle],
    [HumanResources].[vEmployee].[Phone]
FROM [HumanResources].[vEmployee]
WHERE [HumanResources].[vEmployee].[EmployeeID] <= 30
ORDER BY 1 ASC
````

Create a [report group](slug:telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report) or [table group](slug:telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report) based on the `GroupIdx` field. Set the group's [PageBreak](/api/telerik.reporting.tablegroup#Telerik_Reporting_TableGroup_PageBreak) property to `After` so that a new page starts after each group of 10 records.

## Additional Resources

Download the [PageBreakPerNRecords sample report](https://github.com/telerik/reporting-samples/blob/master/PageBreakPerNRecords.trdx).

## See Also

* [sql server 2012 - Increment value on column every N records on table - Stack Overflow](https://stackoverflow.com/questions/168409/how-can-i-increment-a-column-value-in-sql-server-base-table-and-avoid-using-a-v)
* [Report Groups](slug:telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report)
* [Table and Crosstab Groups](slug:telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item)
