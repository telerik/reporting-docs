---
title: System.Data.OracleClient Data Provider for Oracle Database
description: "System.Data.OracleClient is a .NET library for connecting to Oracle databases, enabling data access, commands, and transactions."
type: how-to
page_title: System.Data.OracleClient is Deprecated
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
		<td>Report Component</td>
		<td>SqlDataSource</td>
	</tr>
	<tr>
		<td>Data Providere</td>
		<td>System.Data.OracleClient</td>
	</tr>
</table>

## Description

> Visit the updated [Integrating the ODP.NET Data Provider]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-data-providers/using-odpnet-data-provider%}) article for a how-to on connecting to Oracle Databases.

`System.Data.OracleClient` is a Microsoft .NET Framework data provider allowing you to connect to an Oracle database. The provider is deprecated and it should not be used - [Oracle and ADO.NET](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/oracle-and-adonet).

## Solution

We recommend the usage of the [Oracle Data Provider for .NET/ODP.NET](https://www.oracle.com/database/technologies/appdev/dotnet/odp.html). More .NET Framework data providers and how they can be used for connecting to an Oracle database can be found in the [Oracle connection strings](https://www.connectionstrings.com/oracle/) article.

You may also check out [Data provider is missing in the SqlDataSource wizard]({%slug data-provider-is-missing-in-the-sqldatasource-wizard%}).

## Notes

Each .NET Framework data provider has its own specification of how to read SQL queries. If you use *SQL parameters*, please check the valid syntax for typing parameters in the SQL query.
