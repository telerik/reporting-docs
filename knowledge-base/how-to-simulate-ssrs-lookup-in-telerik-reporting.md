---
title: How to Simulate an SSRS Lookup in Telerik Reporting
description: "Learn how to retrieve related values from another data source in Telerik Reporting when migrating an SSRS Lookup expression."
type: how-to
page_title: Simulate an SSRS Lookup Expression in Telerik Reporting
slug: how-to-simulate-ssrs-lookup-in-telerik-reporting
tags: SSRS, Lookup, multiple data sources, SQL join, report expressions
res_type: kb
---

## Environment
| Version | Product | Author | 
| ---- | ---- | ---- | 
| 20.2.26.812 | Telerik Reporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

SQL Server Reporting Services (SSRS) provides the `Lookup` function for matching a value from the current dataset with a value in another dataset and returning a related value. Its syntax is:

```text
=Lookup(source_expression, destination_expression, result_expression, dataset)
```

Telerik Reporting does not provide a built-in `Lookup` or `LookupSet` expression. The `Fields` global object reads fields from the current data scope, and the `Exec` function evaluates an expression in a parent data scope. Neither function performs a key-based lookup against an unrelated data source.

The recommended Telerik Reporting equivalent is to combine the related data before it reaches the report. When the sources are SQL tables, use a SQL `JOIN` and bind the report item to the resulting single data source.

## Solution

### Join the data in SQL

Suppose the report currently uses these datasets:

**DatasetSales**

| ProductID | Quantity |
| --- | ---: |
| 1 | 10 |
| 2 | 5 |

**DatasetProducts**

| ProductID | ProductName |
| --- | --- |
| 1 | Laptop |
| 2 | Mouse |

Instead of using separate data sources and an SSRS-style lookup, create one query that joins the datasets:

```sql
SELECT
    s.ProductID,
    s.Quantity,
    p.ProductName
FROM dbo.Sales AS s
LEFT JOIN dbo.Products AS p
    ON p.ProductID = s.ProductID;
```

Configure the Telerik Reporting [SQL DataSource](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview) with this query. Bind the table to the resulting data source and use these expressions in the detail row:

```text
=Fields.ProductID
=Fields.Quantity
=Fields.ProductName
```

The report displays the following result:

| ProductID | Quantity | ProductName |
| --- | ---: | --- |
| 1 | 10 | Laptop |
| 2 | 5 | Mouse |

A `LEFT JOIN` preserves rows from the primary dataset when no matching product exists. Use an `INNER JOIN` when rows without a match should be excluded.

### Join tables from different databases on the same SQL Server

If the tables are in different databases on the same SQL Server instance, use three-part table names in the query:

```sql
SELECT
    s.ProductID,
    s.Quantity,
    p.ProductName
FROM DatabaseA.dbo.Sales AS s
LEFT JOIN DatabaseB.dbo.Products AS p
    ON p.ProductID = s.ProductID;
```

The SQL login or database user used by the report must have permission to read both databases.

### Combine the data in application code

If the sources cannot be joined in SQL, retrieve both sources in the application and create one collection of report rows containing the matched result. Bind the report item to that combined collection through an [ObjectDataSource](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview) or by assigning the collection directly to the data item's `DataSource` property.

For example, the application-side result should expose properties equivalent to:

```csharp
public sealed class SalesRow
{
    public int ProductID { get; set; }
    public int Quantity { get; set; }
    public string ProductName { get; set; }
}
```

The report then uses one data source and references the combined properties:

```text
=Fields.ProductID
=Fields.Quantity
=Fields.ProductName
```

Perform the matching in application code before report processing. Do not attempt to retrieve the second source with `Fields` or `Exec` from a report expression.

## See Also

* [Functions Overview](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview)
* [Data Functions](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions)
* [Expression Scope](slug:telerikreporting/designing-reports/connecting-to-data/expressions/expression-scope)
* [Bindings](slug:telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings)
* [ObjectDataSource Component](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview)
* [How to Combine Data from Multiple Web Service End Points in One Table](slug:combine-data-from-multiple-web-services-in-one-table)
