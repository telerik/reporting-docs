---
title: How to use local variables in a SQL query used by the SqlDataSource component
description: How to create local variables in a SQL query used by the SqlDataSource component.
type: how-to
page_title: How to implement local variables in a SQL query used by the SqlDataSource component
slug: how-to-use-local-variables-in-a-sql-query-used-by-the-sqldatasource-component
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Report Item</td>
			<td>SqlDataSource Component</td>
		</tr>
	</tbody>
</table>

## Description

In this article, we will explain how to use local variables in a SQL query used by the SqlDataSource component. 

 Sample SQL query:  

```sql
Declare @localVariable varchar(max)
Set @localVariable='SELECT * FROM MYTABLE'
 
Exec(@localVariable)
```
 
- If the above is set as SQL text, the [SqlDataSource Wizard](../sqldatasource-wizard) will return an error like:  

```
The variable name '@localVariable' has already been declared. Variable names must be unique within a query batch or stored procedure.
```
  
## Solution  

On configuring a SqlDataSource component you can map SQL parameters to report parameters - SqlDataSource Wizard [step 4](../sqldatasource-wizard). 
 
SQL queries relying on local variables can be turned into **stored procedures**. 

The .NET provider will not consider the internally declared SQL parameters as procedure's parameters.
 
## Notes

The syntax of the SQL query must be considered with the specification of the selected .NET data provider. It is the provider that interprets the SQL query and provides information what ADO<span>.</span>NET classes to be used for retrieving data. If the .NET data provider recognizes the local variables as SQL parameters, they will be listed for mapping by the SqlDataSource Wizard, which will result in an error on executing the SQL query.  
  
## See Also

[Using Parameters with the SqlDataSource component.](../sql-data-source-using-parameters)  
