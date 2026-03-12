---
title: MSSQL Database Storage
page_title: Configuring an MSSQL Database Storage
description: "Learn how to configure an MSSQL Database Storage for the Telerik Reporting REST Service in this Tutorial."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-configure-an-mssql-database-storage
tags: how, configure, mssql, database, storage, tutorial
published: True
reportingArea: RESTService, RESTServiceCore
position: 1
previous_url: /telerik-reporting-rest-howto-use-mssql-storage,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-configure-an-mssql-database-storage
---

# Configuring an MSSQL Database Storage for the Reporting REST Service

This article explains how to configure an MSSQL Database for the Reporting REST Service storage.

## Storage Setup

Before an MSSQL Server database can be used by the Reporting REST Service, the service-related tables and stored procedures must be added to it.

You may use a dedicated database or a shared database for both application data and Reporting REST Service Storage.

The following steps will walk you through the process of preparing the database for the Reporting REST Service:

1. Start the **Telerik Database Cache Configurator** tool located in the _{Telerik Reporting installation folder}/Tools_ folder.
1. In the _Choose database usage_ combo-box, select the "Configure REST service storage database" option.
1. In the _Choose target backend_ combo-box, select the "Microsoft SQL Server" option.
1. In the _Specify connection string_ text box, enter the connection string that references the target database. You can also click the _Build_ button and create the connection string using the _Connection properties_ form.
1. Click on the _Create schema_ button to start the database schema creation.
1. A message box should be displayed, confirming that the storage tables are successfully created. Use the connection string specified above when initializing an instance of [MsSqlServerStorage](/api/Telerik.Reporting.Cache.MsSqlServerStorage) in your application.
1. In case you want to clean up the storage tables in an existing database, use the button _Clear cache data_.

## Project Setup

The Reporting REST Service can be set up to use the database storage by using one of the following approaches:

- Setting up the connection when instantiating the [ReportServiceConfiguration](/api/Telerik.Reporting.Services.ReportServiceConfiguration) at runtime.
- Providing the connection string from the configuration file of the project via the [restReportService Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%}).

Here are samples for both scenarios when targeting `.NET Framework` or `.NET`:

### Option 1 - Runtime via the ReportServiceConfiguration

The connection string that the service will use to connect to the database can be provided through code when passing a [ReportServiceConfiguration](/api/Telerik.Reporting.Services.ReportServiceConfiguration) instance to the Reporting REST Service.

The **ReportSourceResolver** and **Storage** configuration settings are required. See the [IReportServiceConfiguration](/api/Telerik.Reporting.Services.IReportServiceConfiguration) interface for more details.

* .NET Framework 4.6.2+

	{{source=CodeSnippets\MvcCS\Controllers\ReportsController.cs region=MSSqlReportsControllerImplementation}}
	{{source=CodeSnippets\MvcVB\Controllers\ReportsController.vb region=MSSqlReportsControllerImplementation}}

* .NET 8+

	{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=ReportsControllerRestConfigImplementation}}

### Option 2 - Runtime via the Configuration

Pass a [ConfigSectionReportServiceConfiguration](/api/Telerik.Reporting.Services.ConfigSectionReportServiceConfiguration) instance to the Reporting REST Service:

* .NET Framework 4.6.2+

	{{source=CodeSnippets\MvcCS\Controllers\ReportsControllerConfigSection.cs region=ReportsControllerConfigSectionImplementation}}
	{{source=CodeSnippets\MvcVB\Controllers\ReportsControllerConfigSection.vb region=ReportsControllerConfigSectionImplementation}}

* .NET 8+

	{{source=CodeSnippets\Blazor\Docs\ProgramWithConfigSection.cs region=ReportsControllerConfigSectionImplementation}}

>important The properties from the `ConfigSectionReportServiceConfiguration` initialization block would override the values obtained from the configuration files below.

### Option 3 - Configuration File

Set the corresponding property values in the REST Service configuration file:

* .NET Framework 4.6.2+

	XML configuration (_web.config_):
	
	{{source=CodeSnippets\MvcCS\Controllers\ReportsControllerConfig.xml region=ReportsControllerConfigSection}}

* .NET 8+

	JSON configuration file (_appsettings.json_):
	
	{{source=CodeSnippets\Blazor\Docs\ReportsControllerConfig.json region=ReportsControllerConfigSection}}

> Since the [2025 Q1 (19.0.25.211) release](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2025-q1-19-0-25-211), the MSSQL storage relies on `System.Data.SqlClient` to connect to the provided database in .NET Framework applications, and on `Microsoft.Data.SqlClient` in .NET applications. In previous versions, the `System.Data.SqlClient` data provider was used for each target framework.

## See Also

- [Overview]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%})
