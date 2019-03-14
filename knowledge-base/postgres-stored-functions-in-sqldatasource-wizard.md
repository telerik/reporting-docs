---
title: Handling PostgreSQL Stored functions in Report Designer's SqlDataSource wizard
description: When using PostgreSQL with NpgSql provider the Stored procedure dropdown is not populating in Report Designer's SqlDataSource wizard. When using ODBC provider the functions will be listed, but the number of their arguments may be incorrect.
type: troubleshooting, how-to
page_title: How to handle PostgreSQL Stored functions in Report designer's SqlDataSource wizard
slug: postgres-stored-functions-in-sqldatasource-wizard
position: 
tags: 
ticketid: 1382372
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
In PostgreSQL prior to version 11 there are Stored functions. Stored Procedures have been introduced with version 11.

1. When using ODBC provider for PostgreSQL with Stored functions, the Stored Procedure drop-down menu of the Report Designer's SqlDataSource wizard is populated, but the returned table columns will be listed as Stored Procedure arguments along with the real arguments, and the Stored function will not be correctly discovered.


2. When using NpgSql provider the Report Designer's SqlDataSource wizard does not list the PostgreSQL Stored functions in the Stored Procedures drop-down menu. The issue applies to PostgreSQL prior to version 11. 
  

## Solution
1. In our implementation for ODBC providers we use the [DbCommandBuilder](https://docs.microsoft.com/en-us/dotnet/api/system.data.common.dbcommandbuilder?view=netframework-4.7.2) _DeriveParameters_ method (it is non-public and we access it with reflection) that returns all the actual function parameters, but also the Table columns returned by the query as collection of [OdbcParameter](https://docs.microsoft.com/en-us/dotnet/api/system.data.odbc.odbcparameter?view=netframework-4.7.2) class with their property [Direction](https://docs.microsoft.com/en-us/dotnet/api/system.data.odbc.odbcparameter.direction?view=netframework-4.7.2) set to _Input_. Therefore, in our code, we create inputs for all (i.e. actual parameters as well as returned columns), and the stored procedure/function is passed and searched for by the provider with an incorrect number of parameters.  
The workaround is to use, for example NpgSql ADO.NET provider (see below).

2. With the NpgSql provider, the Report Designer's SqlDataSource wizard does not list the PostgreSQL Stored functions in the Stored Procedures drop-down menu. However, when the function is manually typed, it will be correctly executed. After recognizing the function, the SqlDataSource wizard populates the Query parameter successfully in the next window.  
Our assumption is that the ADO.NET provider can recognize the Stored functions, but probably cannot associate them with Stored Procedures, hence our code does not populate the drop down.
