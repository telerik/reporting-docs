---
title: How to Use Redis storage
page_title: How to Use Redis storage | for Telerik Reporting Documentation
description: How to Use Redis storage
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-use-redis-storage
tags: how,to,use,redis,storage
published: True
position: 2
---

# How to Use Redis storage



This article will explain how to use          [Redis storage](http://redis.io/)          for report engine storage       

## Adding the necessary dependencies

Telerik Reporting uses __StackExchange.Redis__  client library to access a Redis database.           When adding a reference to __Telerik.Reporting.Cache.StackExchangeRedis__ , the version of StackExchange.Redis client must be considered,           because version 2.0+ introduces breaking changes and is not compatible with previous versions.         

* Telerik.Reporting.Cache.StackExchangeRedis assembly depends on StackExchange.Redis.StrongName version 1.0.320 up to version 1.2.7.             

* Telerik.Reporting.Cache.StackExchangeRedis.2 depends on StackExchange.Redis version 2.0.601 or greater.               It is built against .NET Standard 2.0 and it can be used in projects targeting .NET Framework 4.6.1+ or .NET Core 2.0+             

###Using the Telerik NuGet repository:

1. Add NuGet package reference to Telerik.Reporting.Cache.StackExchangeRedis or Telerik.Reporting.Cache.StackExchangeRedis.2 package from the https://nuget.telerik.com/nuget package source (Telerik credentials needed).                 

###Using the Telerik Reporting installation bin folder:

1. For projects using StackExchange.Redis.StrongName version 1.0.320 up to version 1.2.7:                 
   + In your application project add reference to the                        [StackExchange.Redis.StrongName](https://www.nuget.org/packages/StackExchange.Redis.StrongName)                        (not to be mistaken with StackExchange.Redis) NuGet package with version 1.0.320 or greater.                       This will add a dll reference to StackExchange.Redis.StrongName.dll version 1.0.316.0 or greater.                     

   >When using greater version, a  [binding redirect](https://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx)  should be added in the application configuration file to the currently referenced dll version.                       

   + Add reference to the                       __Telerik.Reporting.Cache.StackExchangeRedis__                        library located in the {Telerik Reportng installation folder}/Bin folder.                     

1. For projects using StackExchange.Redis version 2.0.601 or greater:                 
   + In your application project add reference to the                        [StackExchange.Redis](https://www.nuget.org/packages/StackExchange.Redis)                        NuGet package with version 2.0.601 or greater.                       This will add a dll reference to StackExchange.Redis.dll.                     

   >When using greater version, a  [binding redirect](https://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx)  should be added in the application configuration file to the currently referenced dll version.                       

   + Add reference to the                       __Telerik.Reporting.Cache.StackExchangeRedis.2__                        library located in the {Telerik Reportng installation folder}/Bin/netstandard2.0 folder.                     

## Using the Redis storage

Where needed in your application create an instance of the            [RedisStorage](/reporting/api/Telerik.Reporting.Cache.StackExchangeRedis.RedisStorage)            class. It takes as a parameter an __StackExchange.Redis.ConnectionMultiplexer__            object which should be reused for the application lifetime. See            [(StackExchange.Redis) Basic Usage](https://github.com/StackExchange/StackExchange.Redis/blob/master/docs/Basics.md)  for more information.         

# See Also

 * [Overview]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%})

 * [REST Report Service Configuration]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%})
