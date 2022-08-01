---
title: Connecting the SqlDataSource component to a Data Source
page_title: Connecting the SqlDataSource component to a Data Source 
description: Connecting the SqlDataSource component to a Data Source
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/sqldatasource-component/connecting-the-sqldatasource-component-to-a-data-source
tags: connecting,the,sqldatasource,component,to,a,data,source
published: True
position: 1
---

# Connecting the SqlDataSource component to a Data Source



When you configure the __SqlDataSource__  component, you set the __ProviderName__  property to the type of database (the default is __System.Data.SqlClient__ )           and the __ConnectionString__  property to a connection string that includes information           required to connect to the database. The contents of a connection string differ depending on what type of           database the data source component is accessing. For example, the __System.Data.SqlClient__            provider requires a server name, database (catalog) name, and information about how to authenticate the user           when connecting to __SQL Server__. For information on valid connection strings, see the           __ConnectionString__  property topics for the __SqlConnection__,           __OracleConnection__, __OleDbConnection__, and __OdbcConnection__  classes.         

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=ConnectionStringSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=ConnectionStringSnippet}}

Instead of setting connection strings at design time as property settings in the __SqlDataSource__            component, you can store them centrally as part of your application's configuration settings using the __connectionStrings__  configuration element. This enables you to manage connection strings independently           of your reports, including encrypting them using __Protected Configuration__.         

The following example shows how to connect to the __SQL Server AdventureWorks__  sample database           using a connection string which stored in the __connectionStrings__  configuration element named           __MyAdventureWorksDB__ :         

    
````xml
<configuration>
  <connectionStrings>
    <add name="MyAdventureWorksDB"
         connectionString="Data Source=.\SQLEXPRESS;Initial Catalog=AdventureWorks;Integrated Security=True"
         providerName="System.Data.SqlClient" />
  </connectionStrings>
</configuration>
````

Configuration files in XML format are used in.NET Framework applications. In.NET Core applications the configuration file usually is in JSON-format           and is called __appsettings.json__. The configuration of connection strings section is explained in the following documentation article:           [Manual Setup of HTML5 Report Viewer in an ASP.NET Core 2+ application](9bf9f23f-2aa2-47d4-8d21-feeae104ed69#ConnectionStringsAndConfiguration).         

When the connection string is stored in the configuration file, you need to specify the name of the configuration           element as a value for the __ConnectionString__  property of __SqlDataSource__.           Specifying a value for the __ProviderName__  property is no longer necessary, since that information           is already present in the configuration element itself.         

{{source=CodeSnippets\CS\API\Telerik\Reporting\SqlDataSourceSnippets.cs region=ConnectionNameSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\SqlDataSourceSnippets.vb region=ConnectionNameSnippet}}

The __SqlDataSource__  component retrieves data using a SQL statement defined through the           __SelectCommand__  property. If the data source component connects to a database that           supports stored procedures, you can specify the name of a stored procedure in place of the SQL statement.           You can create parameterized commands that include placeholders for values to be supplied at run time. The           following example shows a typical parameterized SQL select command:         

    
````SQL
SELECT CustomerID, CompanyName FROM Customers WHERE City = @City
````

You can create parameter objects that specify where the command should get parameter values from at run time.           You can also use expressions which values will be evaluated when processing the report or pass specific values           programmatically.

