---
title: Implementing Paging in Telerik Reporting
description: Learn how to implement paging in a Telerik report.
type: how-to
page_title: How to Implement Paging in a Telerik Report
slug: implementing-paging-telerik-report
tags: telerik-reporting, paging, report
res_type: kb
---

## Environment

| Key          | Value                      |
|--------------|----------------------------|
| Product      | Progress Telerik Reporting |
| Version      | 17.2.23.1010               |

## Description

I want to implement paging in my Telerik report. Currently, my report generates over 800 rows on a single page, but I want to display 100 rows per page. I don't have any applicable grouping in my dataset, so I need to add paging without grouping.

## Solution

To implement paging in a Telerik report without grouping, you can use an additional grouping field in your dataset. If you are using the SqlDataSource component, you can add a GroupId field to your query using the `row_number() over (order by ...)` function. Here's an example query:

```sql
SELECT
    (row_number() over (order by EmployeeID) -1)/10 as 'GroupId',
    [HumanResources].[vEmployee].[EmployeeID] ,
    [HumanResources].[vEmployee].[FirstName],
    [HumanResources].[vEmployee].[LastName],
    [HumanResources].[vEmployee].[JobTitle],
    [HumanResources].[vEmployee].[Phone]
FROM [HumanResources].[vEmployee]
WHERE [HumanResources].[vEmployee].[EmployeeID] <= 30
ORDER BY 1 ASC
```

In your report design, create a group based on the GroupId field. Then, use the group's PageBreak property to insert a page break after each group instance. This will result in a page break for every 10 records.

For more information on how the query works, you can refer to the [sql server 2012 - Increment value on column every N records on table - Stack Overflow](https://stackoverflow.com/questions/168409/how-can-i-increment-a-column-value-in-sql-server-base-table-and-avoid-using-a-v) thread.

I have created a sample report that demonstrates this approach. You can find the report attached to this reply. The report uses the AdventureWorksDB that is installed alongside the Telerik Reporting product. You should be able to preview the report on your machine.

I hope this helps! Let me know if you have any further questions.
