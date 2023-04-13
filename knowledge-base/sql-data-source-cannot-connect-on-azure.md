---
title: SqlDataSource Connects to the Database when Running Locally but Fails on Azure
description: The SqlDataSource Successfully Connects to the Database when Running Locally with Named ConnectionString but Fails when Deployed on Azure as the Connection Strings Defined in Azure Portal Override Those in the Web.config files
type: troubleshooting
page_title: SqlDataSource with named connectionstring connects successfully on locally environment but fails when deployed on Azure
slug: sql-data-source-cannot-connect-on-azure
position: 
tags: Azure,connection string,sqldatasource,data provider
ticketid: 1601143
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Environment</td>
			<td>Azure</td>
		</tr>
	</tbody>
</table>


## Description

I have an ASP.NET Web application with embedded Html5 Report Viewer and Reporting REST Service. The reports use [SqlDataSource]({slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview}) with [named/shared connectionstring](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/connection-strings-and-configuration-files) with system managed identity for passwordless connections defined in the `web.config` file of the application. Here is how the connectionstring looks like:

`Server=tcp:MyAzureServer,1433; Database=MyDB; Authentication=Active Directory Default; TrustServerCertificate=True; Encrypt=true;`

The Web application uses [Microsoft.Data.SqlClient](https://learn.microsoft.com/en-us/sql/connect/ado-net/introduction-microsoft-data-sqlclient-namespace?view=sql-server-ver16) and the Reporting project configuration file specifically sets the `providerName="Microsoft.Data.SqlClient";` and registers the provider as explained in the KB [Registering SqlDataSource Data Providers Without Installing Driver]({slug how-to-register-sqldatasource-data-providers-without-driver-installation}).

The whole application works locally as expected.

The problem is with Azure deployment, where it works without issue for general data connectivity, and its only Reporting that fails to connect to the database.

### Error

* Red Error Message in the Report

	````
Unable to establish a connection to the database. Please verify that your connection string is valid. In case you use a 
	named connection string from the application configuration file, make sure the name is correct and the connection string 
	settings are present in the configuration file of your application.
	------------- InnerException -------------
	Invalid value for key 'authentication'
````


* Full Stack Trace of the Error

	See [how to attach a trace listener to the .NET Framework application](https://learn.microsoft.com/en-us/dotnet/framework/debug-trace-profile/how-to-create-and-initialize-trace-listeners) to get the below log:

	````
	Telerik.Reporting.Processing.Data.SqlDataSourceException: Unable to establish a connection to the database. Please verify that your connection string is valid. In case you use a named connection string from the application configuration file, make sure the name is correct and the connection string settings are present in the configuration file of your application. ---> System.ArgumentException: Invalid value for key 'authentication'.

		at System.Data.Common.DbConnectionStringBuilderUtil.ConvertToAuthenticationType(String keyword, Object value)
		at System.Data.SqlClient.SqlConnectionString.ConvertValueToAuthenticationType()
		at System.Data.SqlClient.SqlConnectionString..ctor(String connectionString)
		at System.Data.SqlClient.SqlConnectionFactory.CreateConnectionOptions(String connectionString, DbConnectionOptions previous)
		at System.Data.ProviderBase.DbConnectionFactory.GetConnectionPoolGroup(DbConnectionPoolKey key, DbConnectionPoolGroupOptions poolOptions, DbConnectionOptions& userConnectionOptions)
		at System.Data.SqlClient.SqlConnection.ConnectionString_Set(DbConnectionPoolKey key)
		at System.Data.SqlClient.SqlConnection.set_ConnectionString(String value)
		at Telerik.Reporting.Processing.Data.SqlCommandProvider.CreateConnection(String connectionString)
		at Telerik.Reporting.Processing.Data.SqlQueryProvider.CreateConnection()
		--- End of inner exception stack trace ---
		at Telerik.Reporting.Processing.Data.SqlQueryProvider.CreateConnection()
		at Telerik.Reporting.Processing.Data.SqlDataEnumerable.<GetEnumerator>d__2.MoveNext()
		at Telerik.Reporting.Processing.Data.LazyList`1.LazyListEnumerator.MoveNext()
		at Telerik.Reporting.Processing.Data.SeedDataAdapter.GroupData(IEnumerable`1 rawData)
		at Telerik.Reporting.Processing.Data.SeedDataAdapter.Execute(IEnumerable`1 data)
		at Telerik.Reporting.Processing.Data.ResultSetAdapter.Execute(IEnumerable`1 data)
		at Telerik.Reporting.Processing.Data.MultidimentionalDataProvider.Execute(MultidimensionalQuery query)
		at Telerik.Reporting.Processing.DataItemResolveDataAlgorithm.GetDataCore(IDataSource dataSource, MultidimensionalQuery query, IServiceProvider serviceProvider, EvalObject expressionContext, IProcessingContext processingContext)
		at Telerik.Reporting.Processing.DataItem.GetDataCore(IDataSource dataSource, MultidimensionalQuery query)
		at Telerik.Reporting.Processing.DataItem.<>c__DisplayClass42_0.<ResolveData>b__0()
		at Telerik.Reporting.Processing.DataItemResolveDataAlgorithm.ResolveData(String processingId, InMemoryState inMemoryState, MultidimensionalQuery query, Func`1 getDataCore, EvalObject expressionContext)
		at Telerik.Reporting.Processing.DataItem.ResolveData()
		at Telerik.Reporting.Processing.DataItem.ProcessItem()
		at Telerik.Reporting.Processing.Table.ProcessItem()
		at Telerik.Reporting.Processing.ReportItemBase.ProcessElement()
		at Telerik.Reporting.Processing.DataItem.ProcessElement()
		at Telerik.Reporting.Processing.ProcessingElement.Process(IDataMember dataContext)
````


The stack trace of the error suggests that the SqlDataSource uses the old data provider `System.Data.SqlClient`. This means that it is referenced somewhere else, for example in Azure portal as explained in the Stack Overflow thread [EF6 with AAD auth works locally, but not on deployed app in Azure](https://stackoverflow.com/questions/75243421/ef6-with-aad-auth-works-locally-but-not-on-deployed-app-in-azure). In the last update from the author in that thread, he mentions that in Azure, his connection string was being configured in the Azure portal which was resulting in the old data provider being used.

The issue occurs as the Azure portal connectionstring overrids the `web.config` one.

## Suggested Workarounds

* Configure the connectionstring in the `web.config` instead of Azure portal
* Change the Azure Web App Settings 'Connection strings' `Type` to `Custom`

	Azure Web App Settings hold the connectionstrings as environmental variables based on the `Type` chosen with the connection string app setting as explained in [Configure an App Service app - Configure connection strings](https://learn.microsoft.com/en-gb/azure/app-service/configure-common?tabs=portal#configure-connection-strings). Set the `Type` to `Custom`.

* Use Telerik.Reporting .NET Standard 2.0 version

	In Telerik.Reporting .NET Standard version, the configuration is provided as an [IConfiguration](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-7.0) implementation. By default, the code reads from the `appsettings.json`. However, you may provide it with a custom `IConfiguration` implementation. See the KB article [How to pass configuration settings to ReportProcessor in ASP.NET Core application that does not use REST Service]({%slug pass-configuration-to-report-processor-in-asp-dot-net-core-without-rest-service%}) for hints.

	.NET Framework versions 4.6.2 and higher support .NET Standard 2.0 - see [.NET Standard versions](https://learn.microsoft.com/en-us/dotnet/standard/net-standard?tabs=net-standard-2-0#net-implementation-support)

## See Also

* [EF6 with AAD auth works locally, but not on deployed app in Azure](https://stackoverflow.com/questions/75243421/ef6-with-aad-auth-works-locally-but-not-on-deployed-app-in-azure)
* [Configure an App Service app - Configure connection strings](https://learn.microsoft.com/en-gb/azure/app-service/configure-common?tabs=portal#configure-connection-strings)
* [Named/Shared connectionstring](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/connection-strings-and-configuration-files)
* [IConfiguration](https://learn.microsoft.com/en-us/dotnet/api/microsoft.extensions.configuration.iconfiguration?view=dotnet-plat-ext-7.0)
* [How to pass configuration settings to ReportProcessor in ASP.NET Core application that does not use REST Service]({%slug pass-configuration-to-report-processor-in-asp-dot-net-core-without-rest-service%})
* [Registering SqlDataSource Data Providers Without Installing Driver]({slug how-to-register-sqldatasource-data-providers-without-driver-installation})
