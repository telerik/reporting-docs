---
title: Should I use System.Data.OracleClient .NET data provider to retrieve data for reports from an Oracle database?
description: Which .NET data provider should I use to retrieve data for reports from an Oracle database?. 
type: how-to
page_title: The System.Data.OracleClient .NET data provider is deprecated, use the Oracle Data Provider for .NET/ODP.NET instead.
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
**System.Data.OracleClient** is a Microsoft .NET data provider allowing you to connect to an Oracle database. The provider is deprecated and it should not be used - <a href="https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/oracle-and-adonet" target="_blank">Oracle and ADO.NET</a>.
  
## Solution
We recommend the usage of the [Oracle Data Provider for .NET/ODP.NET](https://www.oracle.com/database/technologies/appdev/dotnet/odp.html). More .NET data providers and how they can be used for connecting to an Oracle database can be found in the <a href="https://www.connectionstrings.com/oracle/" target="_blank">Oracle connection strings</a> article.  
   
You may also check out [Data provider is missing in the SqlDataSource wizard](./data-provider-is-missing-in-the-sqldatasource-wizard).  

## Notes

Each .NET data provider has its own specification how to read SQL queries. If you use *SQL parameters*, please check the valid syntax for typing parameters in the SQL query. 
