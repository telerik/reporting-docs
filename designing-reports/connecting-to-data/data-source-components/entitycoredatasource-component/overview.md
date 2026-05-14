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

The `EntityCoreDataSource` component was introduced with [2026 Q2 (20.1.26.520)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q2-(20-1-26-520)). It connects report data items to an [Entity Framework Core](https://learn.microsoft.com/en-us/ef/core/) `DbContext`. It exposes business objects defined in EF Core models to report authors directly, without intermediate object data sources or hand-written code in code-behind. The toolbox label for the component is **Entity Framework Core Data Source**, and it is available in the [Standalone Report Designer (.NET)](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview) and the [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview).

The `EntityCoreDataSource` component derives from `EntityDataSourceBase`, which it shares with its .NET Framework 4.6.2 equivallent, the [EntityDataSource](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview). Both components expose the same `Context`, `ContextMember`, `ConnectionString`, and `Parameters` surface; the EF Core variant targets `Microsoft.EntityFrameworkCore.DbContext` derivatives, whereas the old variant targets the .NET Framework `ObjectContext` and EF6 `DbContext`.

## Key Capabilities

- **Dedicated design-time support:** the component has its own toolbox item, design-time editor, and a configuration wizard that is shared with the [EntityDataSource Wizard](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/entitydatasource-wizard). It populates the [Data Explorer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer) with the schema of the selected entity and supports live data preview.
- **`DbContext` binding:** assign a `DbContext` type or instance to the `Context` property and the name of a `DbSet<T>` property or a method that returns an `IEnumerable<T>` to the `ContextMember` property; the component retrieves the data automatically when the report is processed.
- **Connection-string injection:** assign a connection string to the `ConnectionString` property of the data source, or pass it through one of the constructor overloads. The configured value is forwarded to a `DbContext` constructor that accepts a `string`.
- **Parameter passing:** add entries to the `Parameters` collection to invoke parameterized methods on the `DbContext`.
- **Shared Data Source reuse:** promote an `EntityCoreDataSource` instance to a [Shared Data Source](slug:telerikreporting/designing-reports/connecting-to-data/data-source-components/shareddatasource-component) and reuse the same configuration across multiple reports.

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
        public string ContextMember { get; set; }      // DbSet<T> or method name
    }
}
```

The `Parameters` collection is inherited through `ObjectDataSourceBase` and accepts the standard fluent `Add(name, type, valueOrExpression)` overload used by every Telerik Reporting data source.

## DbContext Requirements

To consume a `DbContext` with the `EntityCoreDataSource` component, the type must satisfy the following requirements:

- Your Entity Framework Core (EFCore) assembly should be allowed and accessible by the Report Designer along with all its dependencies. For the custom EFCore assembly, you need to [Extend the Report Designer to Recognize Custom Assemblies](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer). Its dependencies, though, must be copied manually to the report designer's folder. You may take them from the `bin` folder of the corresponding project after building it.
	> note It is a work in progress from our side to improve this behavior.
- The `DbContext` is defined in a class library that is referenced by the report project so that the report designer can load the type.
- The `DbContext` exposes the entity sets you want to report on as `DbSet<T>` properties. Custom projections must be returned from a method as a materialized `IEnumerable<T>` (for example, a `List<T>`); `IQueryable<T>` properties and methods are not supported as a `ContextMember`.
- The `DbContext` exposes a **parameterless constructor** and either a **constructor that accepts a connection string** (typical for the Code First approach) or a **constructor that accepts a `DbContextOptions<TContext>`** (typical for the Database First approach). A constructor that accepts a `string` is required when the design-time and runtime connection strings differ, because the component invokes it after assigning the value of `ConnectionString`.

The following snippets show the minimal `DbContext` shape that the component can consume in:

* Code First scenario:

	```CSharp
	public class AdventureWorksDbContext : DbContext
	{
		public AdventureWorksDbContext()
		{
		}

		public AdventureWorksDbContext(string connectionString)
			: base(BuildOptions(connectionString))
		{
		}
		
		public DbSet<Customer> Customers => Set<Customer>();
		public DbSet<Order> Orders => Set<Order>();

		private static DbContextOptions<AdventureWorksDbContext> BuildOptions(string connectionString)
		{
			return new DbContextOptionsBuilder<AdventureWorksDbContext>()
				.UseSqlServer(connectionString)
				.Options;
		}
	}
	```

* Database First scenario:

	```CSharp
	public class AdventureWorksDbContext : DbContext
	{
		public AdventureWorksDbContext()
		{
		}

		public AdventureWorksDbContext(DbContextOptions<AdventureWorksDbContext> options)
			: base(options)
		{
		}

		public DbSet<Customer> Customers => Set<Customer>();
		public DbSet<Order> Orders => Set<Order>();

		protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
		{
			if (!optionsBuilder.IsConfigured)
			{
				// Replace the literal below with your own connection string or
				// resolve it from configuration before calling UseSqlServer.
				optionsBuilder.UseSqlServer("<your connection string>");
			}
		}
	}
	```


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
