---
title: System.Data.OracleClient Data Provider for Oracle Database
description: "Learn which .NET Framework data provider to use to retrieve data for reports from an Oracle database in Telerik Reporting."
type: how-to
page_title: System.Data.OracleClient is deprecated in .NET Framework
slug: should-i-use-system-data-oracleclient-net-data-provider
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Item</td>
		<td>SqlDataSource Component</td>
	</tr>
</table>

## Description

`System.Data.OracleClient` is a Microsoft .NET Framework data provider allowing you to connect to an Oracle database. The provider is deprecated and it should not be used - [Oracle and ADO.NET](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/oracle-and-adonet).

## Solution

We recommend the usage of the [Oracle Data Provider for .NET/ODP.NET](https://www.oracle.com/database/technologies/appdev/dotnet/odp.html). More .NET Framework data providers and how they can be used for connecting to an Oracle database can be found in the [Oracle connection strings](https://www.connectionstrings.com/oracle/) article.

You may also check out [Data provider is missing in the SqlDataSource wizard]({%slug data-provider-is-missing-in-the-sqldatasource-wizard%}).

## Notes

Each .NET Framework data provider has its own specification how to read SQL queries. If you use *SQL parameters*, please check the valid syntax for typing parameters in the SQL query.
