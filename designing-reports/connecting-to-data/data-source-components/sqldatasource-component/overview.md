---
title: Overview
page_title: SqlDataSource Component at a Glance
description: "Learn more about the data providers supported by the Telerik Reporting SqlDataSource and how you may use the component in reports."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview
tags: overview
published: True
position: 0
previous_url: /SqlDataSource,/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/
---

<style>
table th:first-of-type {
	width: 30%;
}
table th:nth-of-type(2) {
	width: 30%;
}
table th:nth-of-type(3) {
	width: 40%;
}
</style>

# SqlDataSource Component Overview

The `SqlDataSource` component enables data items to display data located in a relational database, including **Microsoft SQL Server** and **Oracle** databases, as well as **OLE DB** and **ODBC** data sources, using little or no code. Using `SqlDataSource` allows you to access and display data in a report without using `ADO.NET` classes directly.

You provide a connection string to connect to the database and define the SQL statement or the stored procedure to retrieve the data. At run time, `SqlDataSource` automatically opens the database connection, executes the SQL statement or stored procedure, returns the selected data, and then closes the connection.

The SqlDataSource component would list and work with any [ADO.NET provider](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/ado-net-overview) that is correctly registered on the device. The list with ADO.NET providers is taken as described in [Obtaining the DbProviderFactory MSDN article](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/obtaining-a-dbproviderfactory) and lists all of the provider factories registered in the `machine.config`.

## Supported providers

The `SqlDataSource` component uses `ADO.NET` classes to interact with any database supported by `ADO.NET`. This includes, but is not limited to:

| Provider Name                 | Invariant Name           | Description                                |
| ----------------------------- | ------------------------ | ------------------------------------------ |
| SqlClient Data Provider       | System.Data.SqlClient    | .Net Framework Data Provider for SqlServer |
| OracleClient Data Provider    | System.Data.OracleClient | .Net Framework Data Provider for Oracle    |
| OleDb Data Provider           | System.Data.OleDb        | .Net Framework Data Provider for OleDb     |
| Odbc Data Provider            | System.Data.Odbc         | .Net Framework Data Provider for Odbc      |
| MySQL Data Provider           | MySql.Data.MySqlClient   | .Net Framework Data Provider for MySQL     |
| Oracle Data Provider for .NET | Oracle.DataAccess.Client | Oracle Data Provider for .NET              |

## Supported developer platforms

- .NET Framework 4.6.2 and above
- .NET {{site.mindotnetversion}} and above
- .NET Standard 2.0 and above
