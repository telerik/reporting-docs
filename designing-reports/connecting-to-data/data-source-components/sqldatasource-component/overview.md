---
title: SqlDataSource Component Overview
page_title: SqlDataSource Component Overview
description: SqlDataSource Component Overview
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview
tags: overview
published: True
position: 0
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

SqlDataSource Component

The __SqlDataSource__ component enables data items to display data located in a relational database, including __Microsoft SQL Server__  and __Oracle__ databases, as well as __OLE DB__  and __ODBC__ data sources, using little or no code. Using __SqlDataSource__ allows you to access and display data in a report without using __ADO.NET__  classes directly. You provide a connection string to connect to the database and define the SQL statement or the stored procedure to retrieve the data. At run time, __SqlDataSource__ automatically opens the database connection, executes the SQL statement or stored procedure, returns the selected data, and then closes the connection. The SqlDataSource component would list and work with any  [ADO.NET provider](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/ado-net-overview) that is correctly registered on the device. The list with ADO.NET providers is taken as described in [Obtaining the DbProviderFactory MSDN article](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/obtaining-a-dbproviderfactory) and lists all of the provider factories registered in the machine.config. 

## Supported providers

The __SqlDataSource__ component uses __ADO.NET__ classes to interact with any database supported by __ADO.NET__. This includes, but is not limited to: 

| Provider Name | Invariant Name | Description |
| ------ | ------ | ------ |
|SqlClient Data Provider|System.Data.SqlClient|.Net Framework Data Provider for SqlServer|
|OracleClient Data Provider|System.Data.OracleClient|.Net Framework Data Provider for Oracle|
|OleDb Data Provider|System.Data.OleDb|.Net Framework Data Provider for OleDb|
|Odbc Data Provider|System.Data.Odbc|.Net Framework Data Provider for Odbc|
|MySQL Data Provider|MySql.Data.MySqlClient|.Net Framework Data Provider for MySQL|
|Oracle Data Provider for.NET|Oracle.DataAccess.Client|Oracle Data Provider for.NET|

## Supported developer platforms

*.NET Framework 4.0 and above             

*.NET Core 2.0 and above             

*.NET Standard 2.0 and above
