---
title: Overview
page_title: REST Service Storage at a Glance
description: "Learn more about the Telerik Reporting REST Service Storage, what built-in implementations are available and what are the scenarios they fit in."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview
tags: overview,rest,storage,scenario,implementation,service,reporting
published: True
position: 0
previous_url: /telerik-reporting-rest-service-storage,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview, /embedding-reports/host-the-report-engine-remotely/rest-service-storage/
---

# REST Service Storage Overview

When implementing the REST Report service you need to provide an [IStorage](/api/Telerik.Reporting.Cache.Interfaces.IStorage) interface implementation. An instance of the provided implementation will be used from the service to store its internal state (like active clients, interactivity state, and rendered reports).

The interface also exposes a method called [AcquireLock](/api/Telerik.Reporting.Cache.Interfaces.IStorage#Telerik_Reporting_Cache_Interfaces_IStorage_AcquireLock_System_String_) which is used from the service to enforce serialized access to all stored resources from each thread of the application and between the instances of the application in case of multi-instance environment (i.e., Web Farm). This requires that a suitable interface implementation should be selected when implementing the Reporting REST Service within your application.

## IStorage implementation suitable for deploying both on single instance application hosting and in Web Farms

The following implementations of the IStorage interface allow service multiple instances support. They also have better overall performance.

* [MsSqlServerStorage](/api/Telerik.Reporting.Cache.MsSqlServerStorage) object - See [How to Configure an MSSQL Database Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-configure-an-mssql-database-storage%}). It supports storage server side locks to achieve inter-machine resources serialized access by its Sql Server transactions feature.
* [RedisStorage](/api/Telerik.Reporting.Cache.StackExchangeRedis.RedisStorage) object - See [How to Use Redis storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-use-redis-storage%}). It supports storage server side locks to achieve inter-machine resources serialized access by its distributed locks feature.

## IStorage implementation suitable for deploying on a single instance application only

The following implementations of the IStorage interface support the service to be deployed as a single instance only. For the locking mechanism, they use OS-specific synchronization primitives which only enable inter-thread serialized resources access in the boundaries of a single machine.

* [FileStorage](/api/Telerik.Reporting.Cache.File.FileStorage) - Use the [FileStorage constructor](/api/Telerik.Reporting.Cache.File.FileStorage#Telerik_Reporting_Cache_File_FileStorage_#ctor) to create a storage instance. All Visual Studio item templates for adding the Reporting REST service use the default __FileStorage__ constructor. The second overload of the FileStorage constructor allows you to specify a folder, and it is recommended for usage in a production environment.
* [DatabaseStorage](/api/Telerik.Reporting.Cache.Database.DatabaseStorage) - Use the [DatabaseStorage constructor](/api/Telerik.Reporting.Cache.Database.DatabaseStorage#Telerik_Reporting_Cache_Database_DatabaseStorage_#ctor) to create a storage instance. This storage option requires reference to __Telerik.Reporting.Cache.Database.dll__ that has dependencies on Telerik Data Access which can be checked in the version corresponding [Upgrade article]({%slug telerikreporting/upgrade/overview%}).

## See Also

* [How to implement the ReportsController in an application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application%})
* [How to Add Telerik Reporting REST ServiceStack to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/how-to-add-telerik-reporting-rest-servicestack-to-web-application%})
