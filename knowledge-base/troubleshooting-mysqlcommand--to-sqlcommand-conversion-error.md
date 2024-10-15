---
title: SqlCommand Conversion Error
description: "Learn how to resolve the SqlCommand conversion error when using Stored Procedures in Telerik Reporting."
type: troubleshooting
page_title: Fix SqlCommand Conversion Error with Stored Procedures
slug: troubleshooting-sqlcommand-conversion-error
tags: telerik, reporting, mysql, oracle, postgresql, mssql, stored-procedures, conversion-error
res_type: kb
ticketid: 1667172
---

## Environment

<table>
  <tbody>
    <tr>
      <td>Product</td>
      <td>Progress® Telerik® Reporting</td>
    </tr>
    <tr>
      <td>Version</td>
      <td>18.2.24.924</td>
    </tr>
  <tbody>
</table>

## Description

After updating to Telerik Reporting version `18.2.24.924`, an error occurs when retrieving data using the [SqlDataSource component]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/overview%}) with **Stored Procedures** when using a data provider different from the default [System.Data.SqlClient](https://learn.microsoft.com/en-us/dotnet/api/system.data.sqlclient). 

For example, the below error indicates that the type `Mysql.Data.MySqlClient.MySqlCommand` cannot be converted to type `System.Data.SqlClient.SqlCommand`. This issue affects the execution of Stored Procedures, both with and without parameters.

## Error Message

```
System.ArgumentException: Object of type 'MySql.Data.MySqlClient.MySqlCommand' cannot be converted to type 'System.Data.SqlClient.SqlCommand'.
   at System.RuntimeType.TryChangeType(Object value, Binder binder, CultureInfo culture, Boolean needsSpecialCast)
   at System.Reflection.MethodBase.CheckArguments(Object[] parameters, Binder binder, BindingFlags invokeAttr, CultureInfo culture, Signature sig)
   at System.Reflection.RuntimeMethodInfo.InvokeArgumentsCheck(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at System.Reflection.RuntimeMethodInfo.Invoke(Object obj, BindingFlags invokeAttr, Binder binder, Object[] parameters, CultureInfo culture)
   at Telerik.Reporting.Processing.Data.SqlProviderFactory.DeriveParameters(IDbCommand command)
   at Telerik.Reporting.Processing.Data.SqlCommandProvider.ResolveProcedure(IDbCommand command, SqlDataSourceParameterCollection parameters)
   at Telerik.Reporting.Processing.Data.SqlQueryProvider.CreateCommandCore(IDbConnection connection, Boolean evaluateParameters)
   at Telerik.Reporting.Processing.Data.SqlQueryProvider.CreateCommand(IDbConnection connection)
   at Telerik.Reporting.Processing.Data.SqlDataEnumerable.<GetEnumerator>d__2.MoveNext()
   at Telerik.Reporting.Processing.Data.LazyList`1.LazyListEnumerator.MoveNext()
   at System.Linq.Buffer`1..ctor(IEnumerable`1 source)
   at System.Linq.Enumerable.ToArray[TSource](IEnumerable`1 source)
   at Telerik.Reporting.Processing.Data.SeedDataAdapter.Execute(IEnumerable`1 data)
   at Telerik.Reporting.Processing.Data.ResultSetAdapter.Execute(IEnumerable`1 data)
   at Telerik.Reporting.Processing.Data.MultidimentionalDataProvider.Execute(MultidimensionalQuery query)
   at Telerik.Reporting.Processing.DataItemResolveDataAlgorithm.GetDataCore(IDataSource dataSource, MultidimensionalQuery query, IServiceProvider serviceProvider, EvalObject expressionContext, IProcessingContext processingContext)
   at Telerik.Reporting.Processing.Report.GetDataCore(IDataSource dataSource, MultidimensionalQuery query)
   at Telerik.Reporting.Processing.DataItemResolveDataAlgorithm.ResolveData(String processingId, InMemoryState inMemoryState, MultidimensionalQuery query, Func`1 getDataCore, EvalObject expressionContext)
   at Telerik.Reporting.Processing.Report.ResolveData()
   at Telerik.Reporting.Processing.Report.ProcessItemCore()
   at Telerik.Reporting.Processing.Report.ProcessItem()
   at Telerik.Reporting.Processing.ReportItemBase.ProcessElement()
   at Telerik.Reporting.Processing.ProcessingElement.Process(IDataMember dataContext)
```

## Cause

The issue is caused by changes related to the [Type Restrictions]({%slug telerikreporting/upgrade/2024/2024-q3-18-2-24-924%}#type-restrictions) introduced with the [Telerik Reporting 2024 Q3(18.2.24.924)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-2024-q3-(18-2-24-924)) release.

Inline SQL queries work as expected, but Stored Procedures throw a conversion error for any data provider other than [System.Data.SqlClient](https://learn.microsoft.com/en-us/dotnet/api/system.data.sqlclient).

## Workaround

Manually invoking the **Stored Procedures** works for both scenarios - with and without parameters. The syntax for invoking a **Stored Procedure** depends on the data provider and the database:

- MySQL

  ````SQL
CALL Stored_Procedure;
````


- Oracle

  ````SQL
EXECUTE Stored_Procedure;
````


- PostgreSQL

  ````SQL
CALL Stored_Procedure();
````


- MSSQL

  ````SQL
EXEC Stored_Procedure;
````


## See Also

* [How To Use Stored Procedures in MySQL | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-use-stored-procedures-in-mysql#creating-a-stored-procedure-with-an-input-parameter)
* [Using CALL Command to Invoke a Stored Procedure in PostgreSQL](https://www.postgresql.org/docs/current/sql-call.html)
* [Using EXECUTE Command to Invoke a Stored Procedure in Oracle](https://docs.oracle.com/cd/E11882_01/olap.112/e17122/dml_app_dbms_aw021.htm#OLADM984)
* [Using EXEC Command to Invoke a Stored Procedure in MSSQL](https://learn.microsoft.com/en-us/sql/relational-databases/stored-procedures/execute-a-stored-procedure)
