---
title: How to register a DbProviderFactory in a .NET Core project
description: "Learn how to extend the list of supported data providers in a .NET project."
type: how-to
page_title: How to register a new DbProviderFactory instance in a .NET project
slug: how-to-register-db-provider-factory-in-net-core-project
tags: .NET Core, Configuration
ticketid: 1385458
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product Version</td>
		<td>13.0.19.314 and above</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Project Type</td>
		<td>.NET Core</td>
	</tr>
	<tr>
		<td>Preferred Language</td>
		<td>C Sharp</td>
	</tr>
</table>


## Description

This article describes how to extend the list of the supported ADO.NET data providers in a .NET Core project.

## Solution

To create a connection to a database, the Telerik Reporting engine targeting the .NET Framework 4.6.2 uses the [DbProviderFactories](https://docs.microsoft.com/en-us/dotnet/api/system.data.common.dbproviderfactories?view=netframework-4.8) class.

Since this class does not exist in .NET Standard 2.0, the data processing engine provides a specific class named **Telerik.Reporting.Processing.Data.DbProviderFactories** which exposes a few static methods that can be used to register a new DbProviderFactory instance.

These methods essentially modify the internal collection of DbProviderFactory types and provider invariant names. 
This internal collection contains predefined entries for the most popular data providers that work out-of-the-box in .NET Core projects:

|  Database  |  DbProviderFactory type name  |
|------------|-------------------------------|
| MSSQL      | System.Data.SqlClient.SqlClientFactory |
| SQLite     | System.Data.SQLite.SQLiteFactory |
| MySql      | MySql.Data.MySqlClient.MySqlClientFactory |
| PostgreSql | Npgsql.NpgsqlFactory |
| Oracle     | Oracle.ManagedDataAccess.Client.OracleClientFactory |
| Firebird   | FirebirdSql.Data.FirebirdClient.FirebirdClientFactory (added with [2026 Q2 (20.1.26.520)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2026-q2-(20-1-26-520)))|

In case this list needs to be extended with a new database provider, for example [IBM DB2](https://www.nuget.org/packages/Net.IBM.Data.Db2), the following line needs to be executed prior to report processing:

```CSharp
Telerik.Reporting.Processing.Data.DbProviderFactories.RegisterFactory("IBM.Data.Db2", IBM.Data.Db2.DB2Factory.Instance);
```

In case the data provider does not provide a static instance, the provider can be registered with the factory assembly qualified name:

```CSharp
Telerik.Reporting.Processing.Data.DbProviderFactories.RegisterFactory("IBM.Data.Db2", "IBM.Data.Db2.DB2Factory, IBM.Data.Db2, Version=8.0.0.300");
```

For web projects the recommended place to register the factory is the static constructor of the [ReportsController](/api/telerik.reporting.services.webapi.reportscontrollerbase) class.

For desktop projects, the provider registration can be done in the report viewer initialization code.
