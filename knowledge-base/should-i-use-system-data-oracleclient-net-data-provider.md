---
title: Should I use System.Data.OracleClient .NET data provider to retrieve data for reports from an Oracle database?
description: Should I use System.Data.OracleClient .NET data provider to retrieve data for reports from an Oracle database?. 
type: how-to
page_title: Should I use System.Data.OracleClient .NET data provider to retrieve data for reports from an Oracle database?
slug: should-i-use-system-data-oracleclient-net-data-provider
res_type: kb
---


  
## Description  
**System.Data.OracleClient** is a Microsoft .NET data provider allowing you to connect to an Oracle database. The provider is deprecated and it should not be used - <a href="https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/oracle-and-adonet" target="_blank">Oracle and ADO.NET</a>.
  
## Solution
We recommend the usage of the Oracle Data Provider for .NET/ODP.NET. More .NET data providers and how they can be used for connecting to an Oracle database can be found in the <a href="https://www.connectionstrings.com/oracle/" target="_blank">Oracle connection strings</a> article.  
   
You may also check out [Data provider is missing in the SqlDataSource wizard](../details/data-provider-is-missing-in-the-sqldatasource-wizard).  

Note that each .NET data provider has its own specification how to read SQL queries. If you use SQL parameters, please check the valid syntax for typing parameters in the SQL query. 
