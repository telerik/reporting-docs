---
title: Overview
page_title: REST Service Storage at a Glance
description: "Learn more about the Telerik Reporting REST Service Storage, what built-in implementations are available, and what scenarios they fit in."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview
tags: overview,rest,storage,scenario,implementation,service,reporting
published: True
reporting_area: RESTService, RESTServiceCore
position: 0
previous_url: /telerik-reporting-rest-service-storage,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview, /embedding-reports/host-the-report-engine-remotely/rest-service-storage/
---

# REST Service Storage Overview

When configuring the REST Reporting Service you must provide an [IStorage](/api/Telerik.Reporting.Cache.Interfaces.IStorage) interface implementation. An instance of the provided implementation will be used from the service to store its internal state (like active clients, interactivity state, and rendered reports).

The interface also exposes a method called [AcquireLock](/api/Telerik.Reporting.Cache.Interfaces.IStorage#Telerik_Reporting_Cache_Interfaces_IStorage_AcquireLock_System_String_) which is used from the service to enforce serialized access to all stored resources from each thread of the application and between the instances of the application in case of multi-instance environment (i.e., Web Farm). This requires selecting a suitable interface implementation when embedding the Reporting REST Service within your application.

## IStorage implementation suitable for deploying both on single instance application hosting and in Web Farms

The following implementations of the IStorage interface allow service multiple instances support. They also have better overall performance.

* [MsSqlServerStorage](/api/Telerik.Reporting.Cache.MsSqlServerStorage) object - See [How to Configure an MSSQL Database Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-configure-an-mssql-database-storage%}). It supports storage server side locks to achieve inter-machine resources serialized access by its Sql Server transactions feature.
* [RedisStorage](/api/Telerik.Reporting.Cache.StackExchangeRedis.RedisStorage) object - See [How to Use Redis storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-use-redis-storage%}). It supports storage server side locks to achieve inter-machine resources serialized access by its distributed locks feature.

## IStorage implementation suitable for deploying on a single instance application only

The following implementations of the IStorage interface support the service to be deployed as a single instance only. For the locking mechanism, they use OS-specific synchronization primitives which only enable inter-thread serialized resources access in the boundaries of a single machine.

* [FileStorage](/api/Telerik.Reporting.Cache.File.FileStorage) - Use the [FileStorage constructor](/api/Telerik.Reporting.Cache.File.FileStorage#Telerik_Reporting_Cache_File_FileStorage_#ctor) to create a storage instance. All Visual Studio item templates for adding the Reporting REST service use the default __FileStorage__ constructor. The second overload of the FileStorage constructor allows you to specify a folder, and it is recommended for usage in a production environment.
* [DatabaseStorage](/api/Telerik.Reporting.Cache.Database.DatabaseStorage) - Use the [DatabaseStorage constructor](/api/Telerik.Reporting.Cache.Database.DatabaseStorage#Telerik_Reporting_Cache_Database_DatabaseStorage_#ctor) to create a storage instance. This storage option requires reference to __Telerik.Reporting.Cache.Database.dll__ that has dependencies on Telerik Data Access which can be checked in the version corresponding [Upgrade article]({%slug telerikreporting/upgrade/overview%}).

>note If one of those storages is used in a multi-instance(e.g. multiple [PODs](https://kubernetes.io/docs/concepts/workloads/pods/)) environments, make sure that connections from a particular client are passed to the same Pod each time by configuring [Session affinity](https://kubernetes.io/docs/reference/networking/virtual-ips/#session-affinity)(in other words - **Sticky Sessions**) based on the client's IP address.

## Cleaning the Reporting REST Service Storage

The REST Service Storage keeps all the information about the registered clients/viewers. For example, the generated report documents, the images embedded in the reports, etc. Therefore, with each generated report the occupied storage space increases. To prevent the storage from growing unnecessarily, when a client expires, the Reporting Service triggers a cleanup routine deleting its assets.

You may control the assets’ expiration using the [ClientSessionTimeout](/api/telerik.reporting.services.reportserviceconfiguration#Telerik_Reporting_Services_ReportServiceConfiguration_ClientSessionTimeout) and [ReportSharingTimeout](/api/telerik.reporting.services.reportserviceconfiguration#Telerik_Reporting_Services_ReportServiceConfiguration_ReportSharingTimeout) properties of the service configuration.

When a viewer gets closed, there is no notification, and the service does not know about that. Therefore, periodically (every 5 minutes), the REST Service performs cleaning of the expired data. You may prevent the expiration of an active viewer by setting the viewer's option `keepClientAlive` to `true` (default). The service triggers this logic only when awakened by a request from an active client/viewer.

The assets cached when a report gets rendered are generated in hierarchical manner with each resource holding reference to its parent resource. To release a particular resource, the system counts the child resources that depend on this resource and if there are none, it is considered as expired and gets released. Here are the resources from child to parent:

* __client session__ - Kept for `ClientSessionTimeout` minutes (15 by default) after the last request from the originating client. The client session keeps the requested _document refreshes_ alive.
* __document refresh__ - A representation of report document rendered at particular moment in time. Contains the actual rendering assets like pages, images, docs (for the export format). Keeps the originating _report instance_ alive
* __report instance__ - this is the report definition with particular report parameter values, i.e., the report address.

You may reuse _document refreshes_ by assigning the `ReportSharingTimeout` a positive value (the default is _0_). For example, when two clients request the same report with the same parameter values and states of its actions within `ReportSharingTimeout` minutes, the second client will reuse the _document refresh_ created upon the first client's request. Thus, there will be two clients holding reference to this _document refresh_, and the latter will remain even if one of these clients expires.

## See Also

* [How to implement the ReportsController in an application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application%})
* [How to Add Telerik Reporting REST ServiceStack to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/how-to-add-telerik-reporting-rest-servicestack-to-web-application%})
