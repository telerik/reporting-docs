---
title: Selecting Data
page_title: Selecting Data with the SqlDataSource component explained
description: "Learn how to Select Data with the Telerik Reporting SqlDataSource component through an inline query or stored procedure."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/selecting-data-with-the-sqldatasource-component
tags: selecting,data,with,the,sqldatasource,component,query,stored procedure
published: True
position: 2
previous_url: /sql-data-source-selecting-data, /how-to-sqldatasource-sct-storedprocedure
reportingArea: General
---

# Selecting Data with the SqlDataSource Component

You can specify a SQL query for the `SqlDataSource` component to execute by setting its `SelectCommand` property.

> The `SqlDataSource` is designed to read data from the database but internally it uses the [_DbCommand.ExecuteReader_ method](https://learn.microsoft.com/en-us/dotnet/api/system.data.common.dbcommand.executereader?view=net-8.0) which does not limit the commands that can be executed against the database connection. Therefore, the command typed in the `SelectCommand` property will be executed as-is, even if it contains statements such as DELETE, UPDATE, DROP, etc. To prevent potentially unwanted modifications to your database, we strongly recommend using connections with read-only permissions to fetch the data.

> If the SQL query returns more than one result set, only the first set will be used.

The following example demonstrates a SQL query that retrieves a result set consisting of the names of all the persons in the `Contact` table from the __AdventureWorks__ sample database:

````SQL
SELECT FirstName, LastName FROM Person.Contact;
````

The following code example shows how to set the `ConnectionString` and `SelectCommand` properties of a `SqlDataSource` component to retrieve the data from the above SQL query:

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=SelectCommandSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=SelectCommandSnippet}}

If the database you are working with supports stored procedures, you can set the `SelectCommand` property to the name of an existing stored procedure and the `SelectCommandType` property to `StoredProcedure` to indicate that the `SelectCommand` property refers to a stored procedure. The following example demonstrates a simple stored procedure that you can create in SQL Server:

````SQL
CREATE PROCEDURE GetAllContacts AS
SELECT FirstName, LastName FROM Person.Contact;
GO
````

To configure the `SqlDataSource` component to use this stored procedure, set the `SelectCommand` text to *"GetAllContacts"* and the `SelectCommandType` property to `StoredProcedure`:

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=StoredProcedureSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=StoredProcedureSnippet}}

At run time, the `SqlDataSource` component submits the text in the `SelectCommand` property to the database, and the database returns the result of the SQL query or stored procedure back to the `SqlDataSource` component. Any data items that are bound to the data source component display the result set on your report.
