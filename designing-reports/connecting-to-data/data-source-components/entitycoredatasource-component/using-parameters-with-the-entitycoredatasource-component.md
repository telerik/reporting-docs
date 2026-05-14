---
title: Using Parameters
page_title: Using Parameters with the EntityCoreDataSource Component
description: "Learn how to pass report parameters to the EntityCoreDataSource component in Telerik Reporting and run server-side filtered queries against EF Core."
slug: entitycoredatasource-using-parameters
tags: entitycoredatasource,efcore,parameters,reportparameters,filtering
tag: new
published: True
position: 2
reportingArea: General
---

# Using Parameters with the EntityCoreDataSource Component

This article explains how to pass values from [Report Parameters](slug:telerikreporting/designing-reports/connecting-to-data/report-parameters/overview) to a method on a `DbContext` through the `EntityCoreDataSource` component. Parameter binding lets the report filter data on the database server rather than fetching the entire set into memory.

> tip The `EntityCoreDataSource` wizard detects parameters declared on the data-retrieval method and prompts you to provide values for them on the **Configure Data Source Parameters** page.

## Defining a Parameterized ContextMember

Add a method on the `DbContext` that accepts the values you need to filter by and returns a materialized `IEnumerable<T>` such as a `List<T>`. The `EntityCoreDataSource` component does not support `IQueryable<T>` properties or methods as a `ContextMember`, so the method must materialize the query before returning. The names and types of the data source parameters must match the names and types of the corresponding method arguments exactly; otherwise the component throws an exception at runtime.

```CSharp
public partial class AdventureWorksDbContext : DbContext
{
    public List<Product> GetProductsByCategory(int categoryId)
    {
        return this.Products
                   .Where(p => p.CategoryId == categoryId)
                   .ToList();
    }
}
```

## Mapping Report Parameters to the Data Source

Set the `ContextMember` property to the method name and add one entry to the `Parameters` collection of the data source for every method argument. The `Parameters` collection is inherited through `ObjectDataSourceBase` and exposes the same fluent overload used by every Telerik Reporting data source: `Add(name, type, valueOrExpression)`. Bind to a [Report Parameter](slug:telerikreporting/designing-reports/connecting-to-data/report-parameters/overview) by setting the value to an expression such as `=Parameters.CategoryId.Value`:

```CSharp
var dataSource = new Telerik.Reporting.EntityCoreDataSource
{
    Context = typeof(AdventureWorksDbContext),
    ContextMember = "GetProductsByCategory"
};

dataSource.Parameters.Add("categoryId", typeof(int), "= Parameters.CategoryId.Value");
```

You can also pass literal values when the data source must execute with a fixed argument:

```CSharp
dataSource.Parameters.Add("categoryId", typeof(int), 5);
```

## Pushing Filtering to the Server

Compose the LINQ filter on the `DbSet<T>` (or the underlying `IQueryable<T>`) **before** materializing the result with `ToList()` or `ToArray()`. EF Core then translates the `Where` clause into SQL and the database returns only the matching rows, as shown in the example above. If you instead materialize the entire `DbSet<T>` first and apply `Where` to the resulting in-memory collection, the filter degrades to client-side evaluation and the entire set is loaded into memory, which negates the performance benefit of parameterized queries.

> note The `EntityCoreDataSource` component does not enumerate `IQueryable<T>` results returned from a `ContextMember`. Always materialize the query inside the `DbContext` method and return an `IEnumerable<T>` (for example, a `List<T>`).

## See Also

- [EntityCoreDataSource Component Overview](slug:entitycoredatasource-overview)
- [Connecting to a DbContext with the EntityCoreDataSource Component](slug:entitycoredatasource-connecting-to-dbcontext)
- [Using Parameters with Data Source Components](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/using-parameters-with-data-source-objects)
- [Report Parameters Overview](slug:telerikreporting/designing-reports/connecting-to-data/report-parameters/overview)
