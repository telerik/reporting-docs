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

This article explains how to pass values from [report parameters](slug:telerikreporting/designing-reports/connecting-to-data/report-parameters/overview) to a method or queryable property of a `DbContext` through the `EntityCoreDataSource` component. Parameter binding lets the report filter data on the database server rather than fetching the entire set into memory.

> The `EntityCoreDataSource` wizard detects parameters declared on the data-retrieval method and prompts you to provide values for them on the **Configure Data Source Parameters** page. The wizard is shared with the legacy [EntityDataSource Wizard](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/entitydatasource-wizard).

## Defining a Parameterized ContextMember

Add a method or queryable property on the `DbContext` that accepts the values you need to filter by. The names and types of the data source parameters must match the names and types of the corresponding method arguments exactly; otherwise the component throws an exception at runtime.

```CSharp
public partial class AdventureWorksDbContext : DbContext
{
    public IQueryable<Product> GetProductsByCategory(int categoryId)
    {
        return this.Products.Where(p => p.CategoryId == categoryId);
    }
}
```

## Mapping Report Parameters to the Data Source

Set the `ContextMember` property to the method name and add one entry to the `Parameters` collection of the data source for every method argument. The `Parameters` collection is inherited through `ObjectDataSourceBase` and exposes the same fluent overload used by every Telerik Reporting data source: `Add(name, type, valueOrExpression)`. Bind to a [report parameter](slug:telerikreporting/designing-reports/connecting-to-data/report-parameters/overview) by setting the value to an expression such as `=Parameters.CategoryId.Value`:

```CSharp
var dataSource = new Telerik.Reporting.EntityCoreDataSource
{
    Context = typeof(AdventureWorksDbContext),
    ContextMember = "GetProductsByCategory"
};

dataSource.Parameters.Add("categoryId", typeof(int), "=Parameters.CategoryId.Value");
```

You can also pass literal values when the data source must execute with a fixed argument:

```CSharp
dataSource.Parameters.Add("categoryId", typeof(int), 5);
```

## Pushing Filtering to the Server

When the `ContextMember` returns an `IQueryable<T>`, EF Core translates the filter into SQL and executes it on the database. Avoid materializing the result with `ToList()` or `ToArray()` inside the `DbContext` method, because the entire set is then loaded into memory and the filter degrades to client-side evaluation, which negates the performance benefit of parameterized queries.

## See Also

- [EntityCoreDataSource Component Overview](slug:entitycoredatasource-overview)
- [Connecting to a DbContext with the EntityCoreDataSource Component](slug:entitycoredatasource-connecting-to-dbcontext)
- [Using Parameters with Data Source Components](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/using-parameters-with-data-source-objects)
- [Report Parameters Overview](slug:telerikreporting/designing-reports/connecting-to-data/report-parameters/overview)
