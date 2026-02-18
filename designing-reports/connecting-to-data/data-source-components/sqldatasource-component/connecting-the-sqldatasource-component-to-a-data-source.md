---
title: Connecting to a Data Source
page_title: Connect the SqlDataSource to Database
description: "Learn how to set up the SqlDataSource component to connect to a Data Source in .NET Framework and in .NET Core through the configuration file and code."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/connecting-the-sqldatasource-component-to-a-data-source
tags: connecting,the,sqldatasource,component,to,a,data,source
published: True
position: 1
previous_url: /sql-data-source-connecting-to-data
reportingArea: General
---

# Connecting the SqlDataSource Component to Data Source

When you configure the `SqlDataSource` component, you set the `ProviderName` property to the type of database (the default is `System.Data.SqlClient` ) and the `ConnectionString` property to a connection string that includes information required to connect to the database. The contents of a connection string differ depending on what type of database the data source component is accessing. For example, the `System.Data.SqlClient` provider requires a server name, database (catalog) name, and information about how to authenticate the user when connecting to **SQL Server**. For information on valid connection strings, see the `ConnectionString` property topics for the `SqlConnection`, `OracleConnection`, `OleDbConnection`, and `OdbcConnection` classes.

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=ConnectionStringSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=ConnectionStringSnippet}}

Instead of setting connection strings at design time as property settings in the `SqlDataSource` component, you can store them centrally as part of your application's configuration settings using the `connectionStrings` configuration element. This enables you to manage connection strings independently of your reports, including encrypting them using **Protected Configuration**.

The following example shows how to connect to the **SQL Server AdventureWorks** sample database using a connection string which stored in the `connectionStrings` configuration element named `MyAdventureWorksDB`:

```XML
<configuration>
	<connectionStrings>
		<add name="MyAdventureWorksDB"
			connectionString="Data Source=.\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
			providerName="System.Data.SqlClient" />
	</connectionStrings>
</configuration>
```

.NET Framework applications use configuration files in XML format, while .NET Core and .NET applications usually have a JSON-based configuration file, called `appsettings.json`. The configuration of the connection strings section in .NET is explained in the following documentation article: [How to Host Reports Service in ASP.NET Core in .NET {{site.mindotnetversion}}]({%slug how-to-host-reports-service-in-aspnet-core-in-net-6-with-minimal-api%}).

When the connection string is stored in the configuration file, you need to specify the name of the configuration element as a value for the `ConnectionString` property of `SqlDataSource`. Specifying a value for the `ProviderName` property is no longer necessary, since that information is already present in the configuration element itself.

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=ConnectionNameSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=ConnectionNameSnippet}}

The `SqlDataSource` component retrieves data using a SQL statement defined through the `SelectCommand` property. If the data source component connects to a database that supports stored procedures, you can specify the name of a stored procedure in place of the SQL statement. You can create parameterized commands that include placeholders for values to be supplied at run time. The following example shows a typical parameterized SQL select command:

```SQL
SELECT CustomerID, CompanyName FROM Customers WHERE City = @City
```

You can create parameter objects that specify where the command should get parameter values from at run time. You can also use expressions which values will be evaluated when processing the report or pass specific values programmatically.
