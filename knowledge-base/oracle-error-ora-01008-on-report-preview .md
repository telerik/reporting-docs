---
title: Oracle error ORA-01008 - Not all variables bound 
description: Oracle error ORA-01008 - Not all variables bound 
type: troubleshooting
page_title: Oracle error ORA-01008 - Not all variables bound 
slug: oracle-error-ora-01008-on-report-preview 
ticketid: 1526844
res_type: kb
---

## Description

On previewing the report in a report viewer, an Oracle error **'ORA-01008: Not all variables are bound'** is thrown. Sometimes, the report will display without errors in the [Standalone Report Designer](../standalone-report-designer) but the error gets thrown when displaying that same report in a report viewer. 

The exception is thrown when a parameter with the same name is used more than once in the query used by the [SqlDataSource component](../sqldatasource) and the data provider being used is the **Oracle.ManagedDataAccess(or Oracle.ManagedDataAccess.Core)** provider. However, the error may not be thrown in all such cases, so far it has been reported under specific circumstances such as having *nested select clauses* used in the query.

## Solution

There are two approaches that can be taken in this case:

1. With the *Oracle.ManagedDataAccess* data provider, clients have reported that the issue is occurring when a parameter with the same name is used **more than once** in the query. Event then, it does not occur everytime, a very simple query would probably pass without errors. In complicated queries, such as having *nested selects* in it, make sure that each parameter is used only **once** and the query should once again start passing.


  > Note
  > <br/>
  > The second approach is **not** recommended because the types in [System.Data.OracleClient](https://docs.microsoft.com/en-us/dotnet/api/system.data.oracleclient) are deprecated and will be removed in a future version of the .NET Framework. For more information, see [Oracle and ADO.NET](https://docs.microsoft.com/en-us/dotnet/framework/data/adonet/oracle-and-adonet).


2. Since the issue is only present in the **Oracle.ManagedDataAccess** data provider, switching to the deprecated **System.Data.OracleClient** data provider may also resolve the issue.


  > **Note**
  > <br/>
  > This error is related to the Oracle.ManagedDataAccess data provider itself and is out of the scope of Telerik Reporting. The problem is reproducible in apps that do not use Telerik Reporting at all which can be verified by simply extracting the query and executing it separately.

## See Also

[Using Parameters with the SqlDataSource component](../sql-data-source-using-parameters)
