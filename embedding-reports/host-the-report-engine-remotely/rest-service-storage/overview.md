---
title: Overview
page_title: REST Service Storage at a Glance
description: "Learn more about the Telerik Reporting REST Service Storage, what built-in implementations are available, and what scenarios they fit in."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview
tags: overview,rest,storage,scenario,implementation,service,reporting
published: True
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

## Cleaning the Reporting REST Service Storage

The REST Service Storage keeps all the information about the registered clients/viewers. For example, the generated report documents, the images embedded in the reports, etc. Therefore, with each generated report the occupied storage space increases. To prevent the storage from growing unnecessarily, when a client expires, the Reporting Service triggers a cleanup routine deleting its assets.

You may control the assets’ expiration using the [ClientSessionTimeout](/api/telerik.reporting.services.reportserviceconfiguration#Telerik_Reporting_Services_ReportServiceConfiguration_ClientSessionTimeout) and [ReportSharingTimeout](/api/telerik.reporting.services.reportserviceconfiguration#Telerik_Reporting_Services_ReportServiceConfiguration_ReportSharingTimeout) properties of the service configuration.

When a viewer gets closed, there is no notification, and the service does not know about that. Therefore, when a viewer is inactive for a certain period determined by the `ClientSessionTimeout`, its resources are considered expired. Periodically (every 5 minutes), the REST Service performs cleaning of the expired data. The service triggers this logic only when awakened by a request from an active client/viewer. Hence, all inactive sessions will be deleted after some time determined by the ClientSessionTimeout and the time it takes to delete the expired data, provided the service is awake. You may prevent the expiration of an active viewer by setting the viewer's option `keepClientAlive` to `true` (default).

Let's overview the relation between the clients' assets. Each client holds 'refreshes' to particular report 'documents'. These are the rendered report documents when previewing, exporting, or printing reports with particular parameter values and action states. Each report 'document' holds a reference to a report 'instance', which is the report definition instance. When the client expires, all storage key-value pairs associated with its ID are cleared along with all 'refreshes' that they hold. When there are no 'refreshes' to a 'document', it is considered expired and gets deleted along with the reference to the corresponding report 'instance'. The 'instance' gets removed when no 'documents' refer to it. Therefore, when a client expires, the 'instances' and 'documents' it references may remain.

The report 'instance' will remain when the client that requested it expires if a second viewer has requested a report document based on the same report instance.

The report 'document' may remain although its requester has expired if the `ReportSharingTimeout` has a positive value (the default is 0). For example, when two clients request the same report with the same parameter values and states of its actions, the second client will reuse (in the time frame determined by the ReportSharingTimeout) the document created upon the first client request even if the latter has expired. Therefore, the corresponding 'document' remains referenced by the second client and doesn't expire with the first one. The corresponding 'instance' also remains as the unexpired 'document' references it.

## See Also

* [How to implement the ReportsController in an application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application%})
* [How to Add Telerik Reporting REST ServiceStack to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/how-to-add-telerik-reporting-rest-servicestack-to-web-application%})
