---
title: Configuring the Database Connectivity
page_title: Configuring the Database Connectivity with the EntityCoreDataSource Component
description: "Learn how to configure the database connection used by the EntityCoreDataSource component in Telerik Reporting at design time and runtime."
slug: entitycoredatasource-configuring-database-connectivity
tags: entitycoredatasource,efcore,connectionstring,configuration,appsettings,designtime
tag: new
published: True
position: 3
reportingArea: General
---

# Configuring the Database Connectivity with the EntityCoreDataSource Component

This article explains how to specify the database connection used by the `EntityCoreDataSource` component so that the same `DbContext` works both at design time inside the report designer and at runtime in production.

## Why a Separate Connection String Is Often Required

A typical EF Core `DbContext` reads its connection string from `appsettings.json` of the host application through `IConfiguration`. When the host is your own application, that file is loaded during report processing and the `DbContext` works as expected. When the host is the report designer (for example, the [Standalone Report Designer (.NET)](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview)) the application's `appsettings.json` is not loaded and the connection string is no longer available.

To overcome this, the `EntityCoreDataSource` component exposes a `ConnectionString` property. The configured value is forwarded to the `DbContext` constructor that accepts a `string` argument at processing time. The `DbContext` must therefore expose such a constructor, as shown in the following Code First sample:

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

    private static DbContextOptions<AdventureWorksDbContext> BuildOptions(string connectionString)
    {
        return new DbContextOptionsBuilder<AdventureWorksDbContext>()
            .UseSqlServer(connectionString)
            .Options;
    }
}
```

## Setting the ConnectionString Property

Assign the connection string in code through either the property setter or the three-argument constructor:

```CSharp
var dataSource = new Telerik.Reporting.EntityCoreDataSource
{
    Context = typeof(AdventureWorksDbContext),
    ContextMember = "Products",
    ConnectionString = "Server=.;Database=AdventureWorks;Integrated Security=True;TrustServerCertificate=True"
};
```

```CSharp
var dataSource = new Telerik.Reporting.EntityCoreDataSource(
    "Server=.;Database=AdventureWorks;Integrated Security=True;TrustServerCertificate=True",
    typeof(AdventureWorksDbContext),
    "Products");
```

The wizard writes the value as an attribute on the `EntityCoreDataSource` element of the `.trdp` or `.trdx` definition. To centralize the value, store it in the configuration file of the report-hosting process and read it at startup before assigning it to the `ConnectionString` property.

> note Unlike the .NET Framework-era `EntityDataSource`, EF Core does not resolve named connection strings through `ConfigurationManager`. Always pass a fully-qualified connection string to the `ConnectionString` property.

## Configuring the Designer Connection String

For the [Data Explorer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-explorer) and report preview to work in the desktop designers, store the design-time connection string with the report definition. For the Standalone Report Designer (.NET) this is typically a literal value set on the `EntityCoreDataSource` itself or a value loaded from the host application's `appsettings.json`. For the Web Report Designer the connection string is read from the host service that exposes the [Reporting REST Service](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview).

## See Also

- [EntityCoreDataSource Component Overview](slug:entitycoredatasource-overview)
- [Connecting to a DbContext with the EntityCoreDataSource Component](slug:entitycoredatasource-connecting-to-dbcontext)
- [Maintaining the Lifecycle of the Context with the EntityCoreDataSource Component](slug:entitycoredatasource-context-lifecycle)
