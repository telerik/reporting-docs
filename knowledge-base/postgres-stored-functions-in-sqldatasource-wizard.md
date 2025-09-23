---
title: Handling PostgreSQL Stored functions in the Report Designer's SqlDataSource wizard
description: When using PostgreSQL with the NpgSql provider, the Stored procedure dropdown is not populating in the Report Designer's SqlDataSource wizard. When using the ODBC provider, the functions will be listed, but the number of their arguments may be incorrect.
type: troubleshooting, how-to
page_title: How to handle PostgreSQL Stored functions in the Report Designer's SqlDataSource wizard
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
In PostgreSQL before version 11, there are Stored functions. Stored Procedures have been introduced with version 11.

1. When using the ODBC provider for PostgreSQL with Stored functions, the Stored Procedure drop-down menu of the Report Designer's [SqlDataSource wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%}) is populated, but the returned scalar values or result set columns are included in the stored procedure's input arguments and will be listed as Stored Procedure arguments along with the real arguments, and the Stored function will not be correctly discovered, resulting in an exception.

2. When using the NpgSql provider, the Report Designer's SqlDataSource wizard does not list the PostgreSQL Stored functions in the Stored Procedures drop-down menu. The issue applies to PostgreSQL before version 11. 


## Solution
1. In our implementation for ODBC providers we use the [DbCommandBuilder](https://docs.microsoft.com/en-us/dotnet/api/system.data.common.dbcommandbuilder?view=netframework-4.7.2) _DeriveParameters_ method (it is non-public and we access it with reflection) that returns all the actual function parameters, but also the Table columns returned by the query as collection (or single value) of [OdbcParameter](https://docs.microsoft.com/en-us/dotnet/api/system.data.odbc.odbcparameter?view=netframework-4.7.2) class with their property [Direction](https://docs.microsoft.com/en-us/dotnet/api/system.data.odbc.odbcparameter.direction?view=netframework-4.7.2) set to _Input_. Therefore, in our code, we create inputs for all (i.e., actual parameters as well as returned columns), and the stored procedure/function is passed and searched for by the provider with an incorrect number of parameters.  
The workaround is to use an ADO.NET provider (for example, NpgSql - see below).

2. With the NpgSql provider, the Report Designer's SqlDataSource wizard does not list the PostgreSQL Stored functions in the Stored Procedures drop-down menu. However, when the function is manually typed, it will be correctly discovered and executed. After recognizing the function, the SqlDataSource wizard populates the Query parameter successfully in the next window.  
The [NpgSql ADO.NET provider](https://www.npgsql.org/) can recognize the Stored functions. However, the wizard does not list the stored functions because they are not provided in the schema information we request, and therefore, the drop-down menu is not populated.
