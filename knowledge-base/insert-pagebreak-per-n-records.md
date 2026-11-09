---
title: Insert PageBreak per N Records
description: "Learn how to insert a page break after a set number of records in Telerik Reporting by adding a row-number group to the report data."
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

I want to insert a page break in the report after a set number of records. My report generates more than 800 rows on a single page, but I want to display 100 rows per page. I do not have a grouping field in my dataset. How can I achieve this?

## Solution

The most commonly used data source component in reports is the [`SqlDataSource` component](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview). Many databases offer functions for counting the sequential number of a row within a partition of a result set such as the [ROW_NUMBER](https://learn.microsoft.com/en-us/sql/t-sql/functions/row-number-transact-sql) function in `SQL Server`.

Use the `ROW_NUMBER` function to add a `GroupIdx` field to the result set. The following SQL query returns 30 records and assigns the same group index to each set of 10 records:

```sql
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
```

Create a [report](slug:telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report) or [table](slug:telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report) group based on the `GroupIdx` field. Set the group's [PageBreak](/api/telerik.reporting.tablegroup#Telerik_Reporting_TableGroup_PageBreak) property to `After`. The report starts a new page after each group of 10 records.

## Additional Resources

Download the sample report from the [reporting-samples repo](https://github.com/telerik/reporting-samples/blob/master/PageBreakPerNRecords.trdx).

## See Also

* [sql server 2012 - Increment value on column every N records on table - Stack Overflow](https://stackoverflow.com/questions/168409/how-can-i-increment-a-column-value-in-sql-server-base-table-and-avoid-using-a-v)
* [Report Groups](slug:telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report)
* [Table and Crosstab Groups](slug:telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item)
