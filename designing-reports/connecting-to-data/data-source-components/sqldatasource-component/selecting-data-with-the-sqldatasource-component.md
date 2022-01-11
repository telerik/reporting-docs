---
title: Selecting Data with the SqlDataSource component
page_title: Selecting Data with the SqlDataSource component | for Telerik Reporting Documentation
description: Selecting Data with the SqlDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/selecting-data-with-the-sqldatasource-component
tags: selecting,data,with,the,sqldatasource,component
published: True
position: 2
---

# Selecting Data with the SqlDataSource component

You can specify a SQL query for the __SqlDataSource__ component to execute by setting its __SelectCommand__ property.         

> If the SQL query returns more than one result sets, only the first set will be used.

The following example demonstrates a SQL query that retrieves a result set consisting of the names of all the persons in the __Contact__  table from the __AdventureWorks__ sample database:         

    
````sql
SELECT FirstName, LastName FROM Person.Contact
````

The following code example shows how to set the __ConnectionString__ and __SelectCommand__ properties of a __SqlDataSource__ component to retrieve the data from the above SQL query:         

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=SelectCommandSnippet}}
````C#
Telerik.Reporting.SqlDataSource sqlDataSource = new Telerik.Reporting.SqlDataSource();
sqlDataSource.ConnectionString = "MyAdventureWorksDB";
sqlDataSource.SelectCommand = "SELECT FirstName, LastName FROM Person.Contact";
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=SelectCommandSnippet}}
````VB
Dim sqlDataSource As Telerik.Reporting.SqlDataSource = New Telerik.Reporting.SqlDataSource()
sqlDataSource.ConnectionString = "MyAdventureWorksDB"
sqlDataSource.SelectCommand = "SELECT FirstName, LastName FROM Person.Contact"
````

If the database you are working with supports stored procedures, you can set the __SelectCommand__ property to the name of an existing stored procedure and the __SelectCommandType__  property to __StoredProcedure__  to indicate that the __SelectCommand__ property refers to a stored procedure. The following example demonstrates a simple stored procedure that you can create in SQL Server:         

    
````SQL
CREATE PROCEDURE GetAllContacts AS
SELECT FirstName, LastName FROM Person.Contact;
GO
````

To configure the __SqlDataSource__  component to use this stored procedure, set the __SelectCommand__ text to *"GetAllContacts"*  and the __SelectCommandType__  property to __StoredProcedure__ :         

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=StoredProcedureSnippet}}
````C#
Telerik.Reporting.SqlDataSource sqlDataSource = new Telerik.Reporting.SqlDataSource();
sqlDataSource.ConnectionString = "MyAdventureWorksDB";
sqlDataSource.SelectCommand = "GetAllContacts";
sqlDataSource.SelectCommandType = SqlDataSourceCommandType.StoredProcedure;
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=StoredProcedureSnippet}}
````VB
Dim sqlDataSource As Telerik.Reporting.SqlDataSource = New Telerik.Reporting.SqlDataSource()
sqlDataSource.ConnectionString = "MyAdventureWorksDB"
sqlDataSource.SelectCommand = "GetAllContacts"
sqlDataSource.SelectCommandType = SqlDataSourceCommandType.StoredProcedure
````

At run time, the __SqlDataSource__ component submits the text in the __SelectCommand__ property to the database, and the database returns the result of the SQL query or stored procedure back to the __SqlDataSource__ component. Any data items that are bound to the data source component display the result set on your report.

