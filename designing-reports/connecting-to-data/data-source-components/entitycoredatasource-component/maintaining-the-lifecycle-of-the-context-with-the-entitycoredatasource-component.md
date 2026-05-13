---
title: Maintaining the Lifecycle of the Context
page_title: Maintaining the Lifecycle of the Context with the EntityCoreDataSource Component
description: "Learn how the EntityCoreDataSource component in Telerik Reporting manages the DbContext lifetime and keeps lazy-loaded navigation properties available."
slug: entitycoredatasource-context-lifecycle
tags: entitycoredatasource,efcore,lifecycle,dbcontext,lazyloading,dispose
tag: new
published: True
position: 4
reportingArea: General
---

# Maintaining the Lifecycle of the Context with the EntityCoreDataSource Component

This article explains how the `EntityCoreDataSource` component manages the lifetime of the `DbContext` it consumes, why this matters for [lazy loading](https://learn.microsoft.com/en-us/ef/core/querying/related-data/lazy), and how to choose between letting the component own the context and supplying your own instance.

## Why the Lifecycle Matters

EF Core navigation properties are loaded lazily through a proxy that captures a reference to the originating `DbContext`. If the context is disposed before the report data items finish iterating the result set, every access to a navigation property throws an `ObjectDisposedException` similar to the following:

`System.ObjectDisposedException: Cannot access a disposed context instance.`

To avoid this, the `EntityCoreDataSource` keeps the context alive until the report engine completes processing the data items that depend on it.

## Letting the Component Own the Context (Recommended)

When you assign a `Type` to the `Context` property (or pass one to the constructor), the component takes full ownership of the lifetime:

1. The component instantiates the `DbContext` using either the parameterless constructor or the constructor that accepts the configured `ConnectionString`.
1. The instance is held for the duration of report processing so that lazy-loaded navigation properties remain available.
1. The component disposes the instance when rendering completes.

```CSharp
var dataSource = new Telerik.Reporting.EntityCoreDataSource
{
    Context = typeof(AdventureWorksDbContext),
    ContextMember = "Products"
};
```

## Supplying Your Own Instance

When you assign a live `DbContext` instance to the `Context` property, the application is responsible for disposing it. The component does not call `Dispose` on a context it did not create. Use this pattern when the context is wired into your application's dependency-injection container and must follow the container's scope.

```CSharp
var context = serviceProvider.GetRequiredService<AdventureWorksDbContext>();

var dataSource = new Telerik.Reporting.EntityCoreDataSource
{
    Context = context,
    ContextMember = "Products"
};

// Use the data source while the context is alive, then dispose
// the context explicitly when you no longer need the report:
context.Dispose();
```

> warning Disposing the supplied `DbContext` before the report engine finishes processing the report breaks lazy loading and causes runtime exceptions. Coordinate the dispose call with the end of the report-processing pipeline.

## Avoiding the ObjectDataSource Workaround

Before the `EntityCoreDataSource` component was available, a common workaround was to wrap the EF Core query in a method on a business object and consume it through the [ObjectDataSource](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview). That approach disposes the context as soon as the method returns, which prevents the report from following navigation properties. Migrate any such code to the `EntityCoreDataSource` component to take advantage of the managed lifetime.

## See Also

- [EntityCoreDataSource Component Overview](slug:entitycoredatasource-overview)
- [Connecting to a DbContext with the EntityCoreDataSource Component](slug:entitycoredatasource-connecting-to-dbcontext)
- [ObjectDataSource Component Overview](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview)
- [EF Core Lazy Loading](https://learn.microsoft.com/en-us/ef/core/querying/related-data/lazy)
