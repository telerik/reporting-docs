---
title: MSSQL Database Storage
page_title: Configuring an MSSQL Database Storage
description: "Learn how to Configure an MSSQL Database Storage for the Telerik Reporting REST Service in this Tutorial."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-configure-an-mssql-database-storage
tags: how,to,configure,an,mssql,database,storage,tutorial
published: True
reporting_area: RESTService, RESTServiceCore
position: 1
previous_url: /telerik-reporting-rest-howto-use-mssql-storage,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/how-to-configure-an-mssql-database-storage
---

# Configuring an MSSQL Database Storage for the Reporting REST Service

This article explains how to configure an MSSQL Database for the Reporting REST Service storage.

1. Ensure a database instance is available for Reporting REST Service storage. This may be a dedicated database or a shared database for both app data and Reporting REST Service storage.

   1. Start the **Telerik Database Cache Configurator** tool located in the _{Telerik Reporting installation folder}/Tools_ folder.
   1. In _Choose database usage_ combo-box select the "Configure REST service storage database" option.
   1. In _Choose target backend_ combo-box select the "Microsoft SQL Server" option.
   1. In _Specify connection string_ text box enter the connection string that references the target database. You can also click the _Build_ button and create the connection string using the _Connection properties_ form.
   1. Click on the _Create schema_ button to start the database schema creation.
   1. A message box should be displayed, confirming that the storage tables are successfully created. Use the connection string specified above when initializing an instance of [MsSqlServerStorage](/api/Telerik.Reporting.Cache.MsSqlServerStorage) in your application.
   1. In case you want to cleanup the storage tables in an existing database, use the button _Clear cache data_.

1. Configure your Telerik Reporting REST Service to use the database storage we just prepared. You may do this in the configuration file of the project as elaborated in the article [restReportService Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%}), or when instantiating the [ReportServiceConfiguration](/api/Telerik.Reporting.Services.ReportServiceConfiguration). Here are samples for both scenarios:

   - Through code when passing [ReportServiceConfiguration](/api/Telerik.Reporting.Services.ReportServiceConfiguration) instance to the REST Service.

     The **ReportSourceResolver** and **Storage** configuration settings are required. See the [IReportServiceConfiguration](/api/Telerik.Reporting.Services.IReportServiceConfiguration) interface for more details.

     {{source=CodeSnippets\MvcCS\Controllers\ReportsController.cs region=MSSqlReportsControllerImplementation}}
     {{source=CodeSnippets\MvcVB\Controllers\ReportsController.vb region=MSSqlReportsControllerImplementation}}

   - Through a configuration file:

     1. You need to pass a [ConfigSectionReportServiceConfiguration](/api/Telerik.Reporting.Services.ConfigSectionReportServiceConfiguration) instance to the REST Service:

        {{source=CodeSnippets\MvcCS\Controllers\ReportsControllerConfigSection.cs region=ReportsControllerConfigSectionImplementation}}
        {{source=CodeSnippets\MvcVB\Controllers\ReportsControllerConfigSection.vb region=ReportsControllerConfigSectionImplementation}}

        The properties from the initialization block would override the values obtained from the configuration file.

     1. Set the corresponding properties values in the REST Service configuration file:

        - XML-based configuration file:

          ```XML
          <configuration>
          	<configSections>
          		<section name="Telerik.Reporting" type="Telerik.Reporting.Configuration.ReportingConfigurationSection, Telerik.Reporting" allowLocation="true" allowDefinition="Everywhere" />
          	</configSections>
          	<Telerik.Reporting>
          		<restReportService hostAppId="Application1" workerCount="4" reportSharingTimeout="10" clientSessionTimeout="10" exceptionsVerbosity="detailed">
          			<reportResolver provider="type" />
          			<storage provider="MSSQLServer">
          			<parameters>
          				<parameter name="connectionString" value="Data Source=(local)\SQLEXPRESS;Initial Catalog=RestServiceStorage;Integrated Security=SSPI" />
          				<parameter name="commandTimeout" value="60" />
          			</parameters>
          			</storage>
          		</restReportService>
          	</Telerik.Reporting>
          </configuration>
          ```

        - JSON-based configuration file:

          ```JSON
          "telerikReporting": {
          	"restReportService": {
          		"hostAppId": "Application1",
          		"reportResolver": {
          			"provider": "type"
          		},
          		"storage": {
          			"provider": "MSSQLServer",
          			"parameters": [
          				{
          					"name": "connectionString",
          					"value": "Data Source=(local)\SQLEXPRESS;Initial Catalog=RestServiceStorage;Integrated Security=SSPI"
          				},
          				{
          					"name": "commandTimeout",
          					"value": 60
          				}
          			]
          		}
          	}
          }
          ```

> Since the **Telerik Reporting Q1 2025** release, the MSSQL storage relies on `System.Data.SqlClient` to connect to the provided database in .NET Framework applications, and on `Microsoft.Data.SqlClient` in .NET applications. In previous versions, the `System.Data.SqlClient` data provider was used for each target framework.

## See Also

- [Overview]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%})
