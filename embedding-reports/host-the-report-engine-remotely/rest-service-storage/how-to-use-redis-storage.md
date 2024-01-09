---
title: Redis Storage
page_title: Configuring a Redis Storage
description: "Learn how to Configure and Use a Redis Storage for the Telerik Reporting REST Service in this step-by-step Tutorial."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-use-redis-storage
tags: how,to,use,redis,storage,tutorial
published: True
position: 2
previous_url: /telerik-reporting-rest-howto-use-redis-storage,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-use-redis-storage
---

# Using Redis Storage for the Reporting REST Service

This article explains how to use [Redis Storage](https://redis.io/) for the Reporting REST Service storage.

## Adding the necessary dependencies

Telerik Reporting uses __StackExchange.Redis__ client library to access a Redis database. When adding a reference to `Telerik.Reporting.Cache.StackExchangeRedis`, the version of StackExchange.Redis client must be considered, because version 2.0+ introduces breaking changes and is not compatible with previous versions.

* `Telerik.Reporting.Cache.StackExchangeRedis` assembly depends on StackExchange.Redis.StrongName version 1.0.320 up to version 1.2.7.
* `Telerik.Reporting.Cache.StackExchangeRedis.2` depends on StackExchange.Redis version 2.6.122 or greater. It is built against.NET Standard 2.0 and it can be used in projects targeting.NET Framework 4.6.1+ or.NET Core 2.0+

### Using the Telerik NuGet repository:

Add NuGet package reference to `Telerik.Reporting.Cache.StackExchangeRedis` or `Telerik.Reporting.Cache.StackExchangeRedis.2` package from the https://nuget.telerik.com/v3/index.json package source (Telerik credentials, or [Telerik NuGet key](https://www.telerik.com/blogs/announcing-nuget-keys), needed). For details, check [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).

### Using the Telerik Reporting installation bin folder:

1. For projects using StackExchange.Redis.StrongName version 1.0.320 up to version 1.2.7:

	+ In your application project add reference to the [StackExchange.Redis.StrongName](https://www.nuget.org/packages/StackExchange.Redis.StrongName) (not to be mistaken with StackExchange.Redis) NuGet package with version 1.0.320 or greater. This will add a dll reference to StackExchange.Redis.StrongName.dll version 1.0.316.0 or greater.

		>When using greater version, a [binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element) should be added in the application configuration file to the currently referenced dll version.

	+ Add reference to the `Telerik.Reporting.Cache.StackExchangeRedis` library located in the {Telerik Reportng installation folder}/Bin folder.

1. For projects using StackExchange.Redis version 2.6.122 or greater:

	+ In your application project add reference to the [StackExchange.Redis](https://www.nuget.org/packages/StackExchange.Redis) NuGet package with version 2.6.122 or greater. This will add a dll reference to StackExchange.Redis.dll.

		>When using greater version, a [binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element) should be added in the application configuration file to the currently referenced dll version.

	+ Add reference to the `Telerik.Reporting.Cache.StackExchangeRedis.2` library located in the {Telerik Reportng installation folder}/Bin/netstandard2.0 folder.

## Using the Redis storage

Where needed in your application create an instance of the [RedisStorage](/reporting/api/Telerik.Reporting.Cache.StackExchangeRedis.RedisStorage) class. It takes as a parameter an __StackExchange.Redis.ConnectionMultiplexer__ object which should be reused for the application lifetime. See [(StackExchange.Redis) Basic Usage](https://github.com/StackExchange/StackExchange.Redis/blob/master/docs/Basics.md) for more information.

## See Also

* [Overview]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%})
* [REST Report Service Configuration]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%})
* [Binding Redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element)
