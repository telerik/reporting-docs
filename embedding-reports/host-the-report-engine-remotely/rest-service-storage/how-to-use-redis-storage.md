---
title: Redis Storage
page_title: Configuring a Redis Storage
description: "Learn how to configure and use a Redis Storage for the Telerik Reporting REST Service in this step-by-step Tutorial."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-use-redis-storage
tags: how, use,redis, storage, tutorial
published: True
reportingArea: RESTService, RESTServiceCore
position: 2
previous_url: /telerik-reporting-rest-howto-use-redis-storage,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-use-redis-storage
---

# Using Redis Storage for the Reporting REST Service

This article explains how to use our [Redis Storage](https://redis.io/) for the Reporting REST Service storage.

### Adding the necessary dependencies

The `Telerik.Reporting.Cache.StackExchangeRedis` assembly is required for Telerik Reporting to access a Redis database. This assembly uses the **StackExchange.Redis** client library.

#### (Recommended) Using the Telerik NuGet repository:

Add a NuGet package reference to the `Telerik.Reporting.Cache.StackExchangeRedis` package from the https://nuget.telerik.com/v3/index.json package source, which requires a [Telerik NuGet key](https://www.telerik.com/blogs/announcing-nuget-keys).

For instructions on how to set up and use the Telerik NuGet feed, please check [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).

#### Using the Telerik Reporting installation bin folder:

1. In your application project, add a reference to the [StackExchange.Redis](https://www.nuget.org/packages/StackExchange.Redis) NuGet package with version **2.8.16 or greater**. This will add an assembly reference to `StackExchange.Redis.dll`.

   > When using a greater version, a [binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element) should be added in the application configuration file to the currently referenced DLL version.

1. Add a reference to the `Telerik.Reporting.Cache.StackExchangeRedis` assembly, which you can get from the following location:
   - .NET Framework projects - `{Telerik Reporting installation folder}/Bin`.
   - .NET/.NET Standard projects - `{Telerik Reporting installation folder}/Bin/netstandard2.0`.

### Using the RedisStorage

Provide an instance of the [RedisStorage](/reporting/api/Telerik.Reporting.Cache.StackExchangeRedis.RedisStorage) to the **Storage** property of the [ReportServiceConfiguration](/api/telerik.reporting.services.reportserviceconfiguration).

The [RedisStorage](/reporting/api/Telerik.Reporting.Cache.StackExchangeRedis.RedisStorage) constructor accepts as a parameter a `StackExchange.Redis.ConnectionMultiplexer` object, which should be reused for the application lifetime:

* .NET Framework 4.6.2+

	In ASP.NET Framework projects, the [ReportServiceConfiguration](/api/telerik.reporting.services.reportserviceconfiguration) can be provided in the `ReportsController` class that implements [ReportsControllerBase](/api/telerik.reporting.services.webapi.reportscontrollerbase):

	{{source=CodeSnippets\MvcCS\Controllers\ReportsController.cs region=RedisReportsControllerImplementation}}
	{{source=CodeSnippets\MvcVB\Controllers\ReportsController.vb region=RedisReportsControllerImplementation}}

* .NET 8+

	{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=ReportsControllerRestRedisStorage}}

## See Also

- [(StackExchange.Redis) Basic Usage](https://github.com/StackExchange/StackExchange.Redis/blob/master/docs/Basics.md)
- [REST Report Service Overview](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview)
- [REST Report Service Configuration](slug:telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element)
