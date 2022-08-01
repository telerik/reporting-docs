---
title: Using Parameters with the SqlDataSource component
page_title: Using Parameters with the SqlDataSource component 
description: Using Parameters with the SqlDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/using-parameters-with-the-sqldatasource-component
tags: using,parameters,with,the,sqldatasource,component
published: True
position: 3
---

# Using Parameters with the SqlDataSource component



Users often request data based on parameters that can be resolved or evaluated only at run time. For example, the         data displayed in a report might depend on a specific input value. If the user selects a different value, that data         can also change. Whether the value is changed explicitly by the user or programmatically by the application, the         SQL query that you submit to the database can be made more flexible and more maintainable if it is a parameterized         SQL query, in which elements of the SQL statement are bound to parameters and evaluated at run time. Moreover using         parameterized SQL queries to filter the data of the report might improve the performance and decrease the memory         footprint of your application, because the filter is applied directly on the database server and only the necessary         data is downloaded on the middle tier or client machine.       

The __SqlDataSource__  component supports parameterized SQL queries by associating the parameters         you add to the __Parameters__  collection with placeholders in the __SelectCommand__  query. Parameter values can be evaluated with any expression which conforms to the common expression         syntax supported by the reporting engine. This grants you a great deal of flexibility on how you can supply your         SQL queries with parameters. For example, you can bind a SQL query parameter directly to a report parameter without         any extra coding at all.       

The syntax used for the placeholders varies, depending on the type of the database. If you are working with         __SQL Server__, the parameter name begins with the *'@'*  character,         and its name corresponds to the name of the parameter object in the Parameters collection. For __Oracle__  databases the parameters are prefixed with the *':'*  character instead,         and are referenced by name in the __Parameters__  collection as well. If you are working with         an __ODBC__  or __OLE DB__  database, parameters in a parameterized statement         are not named and instead are specified with the placeholder character *'?'*.       

> The [SqlDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/sqldatasource-wizard/overview%}) can detect SQL parameters listed           in the SQL query, and it will ask you to provide values for them at  __Configure Data Source Parameters__  step.           The information is provided by the selected.NET data provider,           which implementation is important for determining what SQL syntax can be used for the SQL query.         

##Using Parameters with the SqlClient Provider

The __System.Data.SqlClient__  provider supports named parameters as placeholders,                 as shown in the following example:               

    
````SQL
SELECT * FROM Person.Contact WHERE FirstName = @FirstName AND LastName = @LastName
````

With named parameters, the order in which the parameters are specified in the command's parameters                 collection is not important. However, you must ensure that the parameter names that you use in your SQL                 command correspond to the names of the parameters in the associated collection. The following example                 shows how to use named parameters in an SQL command for a __SqlDataSource__                  component that uses the __System.Data.SqlClient__  provider:               

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=NamedParametersSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=NamedParametersSnippet}}

##Using Parameters with the OLE DB and ODBC Providers

The __System.Data.OleDb__  and __System.Data.Odbc__  providers                 support only positional parameters identified by the *'?'*  character, as                 shown in the following example:               

    
````SQL
SELECT * FROM Person.Contact WHERE FirstName = ? AND LastName = ?
````

When you use the __System.Data.OleDb__  and __System.Data.Odbc__                  providers with parameterized SQL query statements, the order in which you specify the parameter placeholders                 must match exactly the order of the parameter objects in the __Parameters__  collection                 of the __SqlDataSource__  component. Specifying names for the parameters in this case                 is only for informative purposes, these names are not used when binding the parameter values to the SQL                 query statement.               

The following example shows how to specify parameters for a __SqlDataSource__  component                 that uses the __System.Data.OleDb__  provider:               

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=PositionalParametersSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=PositionalParametersSnippet}}

##Binding SQL Query Parameters to Report Parameters

The following code example shows how to bind the parameters of an SQL query to the corresponding                 parameters of the report using expressions:               

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=BindingExpressionSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=BindingExpressionSnippet}}

