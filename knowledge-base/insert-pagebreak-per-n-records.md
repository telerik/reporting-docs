---
title: Insert PageBreak per N Records
description: "Learn how to insert a new page after N number of records in Telerik Reporting via grouping."
type: how-to
page_title: Start a New Page After N Amount of Rows
slug: insert-pagebreak-per-n-records
tags: pagebreak, paging, grouping
res_type: kb
---

## Environment

| Key          | Value                      |
|--------------|----------------------------|
| Product      | Progress Telerik Reporting |

## Description

I want to insert a page break in the report after N amount of records. Currently, my report generates over 800 rows on a single page, but I want to display 100 rows per page. I don't have any applicable grouping field in my dataset, how can I achieve this?

## Solution

The most commonly used data source component in reports is the [`SqlDataSource` component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}). Many databases offer functions for counting the sequential number of a row within a partition of a result set such as the [ROW_NUMBER](https://learn.microsoft.com/en-us/sql/t-sql/functions/row-number-transact-sql) function in `SQL Server`.

The `ROW_NUMBER` function can be used to add a custom field to the result set - `GroupIdx` that is increased for each N number of records that we need to insert a page break after, for example, the following SQL query returns 30 records and the grouping field is increased per 10 records. 

````SQL
SELECT
    (row_number() over (order by EmployeeID) -1)/10 as 'GroupIdx',
    [HumanResources].[vEmployee].[EmployeeID] ,
    [HumanResources].[vEmployee].[FirstName],
    [HumanResources].[vEmployee].[LastName],
    [HumanResources].[vEmployee].[JobTitle],
    [HumanResources].[vEmployee].[Phone]
FROM [HumanResources].[vEmployee]
WHERE [HumanResources].[vEmployee].[EmployeeID] <= 30
ORDER BY 1 ASC
````

Then, we can create a [report]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%})/[table]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%}) group based on the `GroupIdx` field and set the group's [PageBreak](/api/telerik.reporting.tablegroup#Telerik_Reporting_TableGroup_PageBreak) property to `After` so that a new page starts after each 10 records.

![image]()

## Additional Resources

Download the sample report from the [reporting-samples repo]().

## See Also

* [sql server 2012 - Increment value on column every N records on table - Stack Overflow](https://stackoverflow.com/questions/168409/how-can-i-increment-a-column-value-in-sql-server-base-table-and-avoid-using-a-v)
* [Report Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-report%})
* [Table and Crosstab Groups]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/grouping-data/how-to-add-groups-to-table-item-and-crosstab-item%})