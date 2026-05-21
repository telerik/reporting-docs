---
title: Overview
page_title: EntityCoreDataSource Component at a Glance
description: "Learn how the EntityCoreDataSource component in Telerik Reporting binds reports to an Entity Framework Core DbContext at design time and runtime."
slug: entitycoredatasource-overview
tags: entitycoredatasource,efcore,entityframeworkcore,datasource,dbcontext,overview
tag: new
published: True
position: 0
reportingArea: General
---

# EntityCoreDataSource Component Overview

> The EntityCoreDataSource component was introduced with [2026 Q2 (20.1.26.520)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q2-(20-1-26-520)).

The **EntityCoreDataSource** component allows you to connect report data items to an [Entity Framework Core](https://learn.microsoft.com/en-us/ef/core/) `DbContext`. It exposes business objects defined in EF Core models directly, without intermediate object data sources or hand-written code in code-behind.

The component is available both in the [Standalone Report Designer (.NET)](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview) and the [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview) under the toolbox label **Entity Framework Core Data Source**.

> If your project targets .NET Framework, use the [EntityDataSource](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview) component instead. If you are migrating from EntityDataSource, the two components expose the same `Context`, `ContextMember`, `ConnectionString`, and `Parameters` properties, so your existing configuration carries over.

## Key Capabilities

- **Dedicated design-time support:** the component includes a dedicated toolbox item and a wizard in both the [Standalone Report Designer (.NET)](slug:desktop-entitycoredatasource-wizard) and the [Web Report Designer](slug:wrd-entitycoredatasource-wizard). The wizard guides you through selecting a `DbContext`, choosing the entity member to expose as the data source, and configuring the parameters. After the wizard completes, the [Data Explorer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer) shows the entity schema so you can drag fields directly onto report items. The last wizard step lets you preview live data before finishing.
- **`DbContext` binding:** set the data source to a `DbContext` and specify which entity set, property, or method provides the report data. The wizard handles this through a selection UI; in code, set `Context` and `ContextMember` directly or use the relevant constructor.
- **Connection-string injection:** configure which database connection the data source uses. Set it through the wizard, via the `ConnectionString` property in code, or as the first argument of the `EntityCoreDataSource(connectionString, context, contextMember)` constructor.
- **Parameter passing:** add entries to the `Parameters` collection to invoke parameterized methods or queryable projections on the `DbContext`.
- **Shared Data Source reuse:** in the Web Report Designer, extract the created `EntityCoreDataSource` component to a [Shared Data Source](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component) and reuse the same configuration across multiple reports.

## Public API

The component exposes three constructor overloads and three serializable properties:

```CSharp
namespace Telerik.Reporting
{
    public class EntityCoreDataSource : EntityDataSourceBase
    {
        public EntityCoreDataSource();
        public EntityCoreDataSource(object context, string contextMember);
        public EntityCoreDataSource(string connectionString, object context, string contextMember);

        // Inherited from EntityDataSourceBase:
        public string ConnectionString { get; set; }
        public object Context { get; set; }            // DbContext type or instance
        public string ContextMember { get; set; }      // DbSet<T> or method/property name
    }
}
```

The `Parameters` collection is available through the inherited `ObjectDataSourceBase` class. Use `Add(name, type, valueOrExpression)` to add entries.

## DbContext Requirements

To consume a `DbContext` with the `EntityCoreDataSource` component, the type must satisfy the following requirements:

- **Assembly accessibility**: the assembly that contains your `DbContext` must be accessible wherever the report runs:
	+ Your application (runtime): add the `DbContext` class library as a project reference and register it under `telerikReporting.assemblyReferences` in `appsettings.json`.
	+ Standalone Report Designer (.NET): [extend the designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer) to recognize the assembly. The EF Core runtime and database provider assemblies must be copied manually to the designer folder. You can take them from the `bin` folder of the project after building it.
	+ Web Report Designer: add the assembly to the host application and register it under `telerikReporting.assemblyReferences` in `appsettings.json`.

	> note Automatic resolution of transitive dependencies in the report designer is planned for a future release. Until then, copy the required assemblies manually.
- The `DbContext` is defined in a class library that is referenced by the report project so that the report designer can load the type.
- The `DbContext` exposes the entity sets you want to report on as `DbSet<T>` properties, or projects them through `IQueryable<T>` properties.
- The `DbContext` exposes a **parameterless constructor** and either a **constructor that accepts a connection string** (typical for the Code First approach) or a **constructor that accepts a `DbContextOptions<TContext>`** (typical for the Database First approach). A constructor that accepts a `string` is required when the design-time and runtime connection strings differ, because the component invokes it after assigning the value of `ConnectionString`.

The following snippets show the minimal `DbContext` shape that the component can consume:

* Code First scenario:

	{{source=CodeSnippets\Blazor\Docs\DataSources\AppDbContextCodeFirst.cs region=CodeFirstAppDbContext}}

* Database First scenario:

	{{source=CodeSnippets\Blazor\Docs\DataSources\AppDbContextDbFirst.cs region=DbFirstAppDbContext}}


## Supported Developer Platforms

- .NET 8 and later

## Next Steps

- [Connecting to a DbContext with the EntityCoreDataSource Component](slug:entitycoredatasource-connecting-to-dbcontext)
- [Using Parameters with the EntityCoreDataSource Component](slug:entitycoredatasource-using-parameters)
- [Configuring the Database Connectivity with the EntityCoreDataSource Component](slug:entitycoredatasource-configuring-database-connectivity)
- [Maintaining the Lifecycle of the Context with the EntityCoreDataSource Component](slug:entitycoredatasource-context-lifecycle)

## See Also

- [Data Source Components Overview](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/overview)
- [EntityDataSource Component Overview](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview)
- [SharedDataSource Component](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component)
- [Entity Framework Core Documentation](https://learn.microsoft.com/en-us/ef/core/)
- [API Reference: EntityCoreDataSource](/api/telerik.reporting.entitycoredatasource)
