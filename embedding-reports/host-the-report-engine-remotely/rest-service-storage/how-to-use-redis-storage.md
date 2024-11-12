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

The `Telerik.Reporting.Cache.StackExchangeRedis` assembly is required for Telerik Reporting to access a Redis database. This assembly uses the __StackExchange.Redis__ client library.

### Using the Telerik NuGet repository:

Add a NuGet package reference to the `Telerik.Reporting.Cache.StackExchangeRedis` package from the https://nuget.telerik.com/v3/index.json package source (Telerik credentials, or [Telerik NuGet key](https://www.telerik.com/blogs/announcing-nuget-keys), needed). For details, check [How to add the Telerik private NuGet feed to Visual Studio]({%slug telerikreporting/using-reports-in-applications/how-to-add-the-telerik-private-nuget-feed-to-visual-studio%}).

### Using the Telerik Reporting installation bin folder:

1. In your application project add reference to the [StackExchange.Redis](https://www.nuget.org/packages/StackExchange.Redis) NuGet package with version 2.8.16 or greater. This will add a dll reference to StackExchange.Redis.dll.

	>When using greater version, a [binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element) should be added in the application configuration file to the currently referenced dll version.

1. Add а reference to the `Telerik.Reporting.Cache.StackExchangeRedis` library located in the `{Telerik Reportng installation folder}/Bin` or `{Telerik Reportng installation folder}/Bin/netstandard2.0` folder, depending on whether you have a .NET Framework or a .NET project respectively.

## Using the Redis storage

Where needed in your application create an instance of the [RedisStorage](/reporting/api/Telerik.Reporting.Cache.StackExchangeRedis.RedisStorage) class. It takes as a parameter an __StackExchange.Redis.ConnectionMultiplexer__ object which should be reused for the application lifetime. See [(StackExchange.Redis) Basic Usage](https://github.com/StackExchange/StackExchange.Redis/blob/master/docs/Basics.md) for more information.

## See Also

* [Overview]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%})
* [REST Report Service Configuration]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%})
* [Binding Redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element)
