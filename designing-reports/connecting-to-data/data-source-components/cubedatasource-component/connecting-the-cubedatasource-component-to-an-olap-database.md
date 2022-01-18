---
title: Connecting the CubeDataSource component to an OLAP database
page_title: Connecting the CubeDataSource component to an OLAP database | for Telerik Reporting Documentation
description: Connecting the CubeDataSource component to an OLAP database
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/connecting-the-cubedatasource-component-to-an-olap-database
tags: connecting,the,cubedatasource,component,to,an,olap,database
published: True
position: 2
---

# Connecting the CubeDataSource component to an OLAP database

When you configure a __CubeDataSource__  you set the __ConnectionString__ property to a connection string that includes information required to connect to the database. Specifying an appropriate connection string requires at least a server name and database (catalog) name. For information on valid connection strings see the __ConnectionString__ property topic for the __AdomdConnection__ class.             

The sample code below illustrates how to connect a __CubeDataSource__ component to the __Adventure Works DW 2008R2__ sample database:                 

{{source=CodeSnippets\CS\API\Telerik\Reporting\CubeDataSourceSnippets.cs region=ConnectionStringSnippet}}
````c#
Telerik.Reporting.CubeDataSource cubeDataSource = new Telerik.Reporting.CubeDataSource();

cubeDataSource.ConnectionString = "Data Source=localhost;Initial Catalog=Adventure Works DW 2008R2";
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " +
                               "       non empty { [Product].[Category].[Category] } on rows " +
                               "from [Adventure Works]";
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\CubeDataSourceSnippets.vb region=ConnectionStringSnippet}}
````vb
Dim cubeDataSource As Telerik.Reporting.CubeDataSource = New Telerik.Reporting.CubeDataSource()

cubeDataSource.ConnectionString = "Data Source=localhost;Initial Catalog=Adventure Works DW 2008R2"
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " & _
                               "       non empty { [Product].[Category].[Category] } on rows " & _
                               "from [Adventure Works]"
````

Instead of setting connection strings as property settings in the __CubeDataSource__ object, you can store them centrally as part of your application's configuration settings using the __connectionStrings__  configuration element. This enables you to manage connection strings independently of your reports, including encrypting them using __Protected Configuration__. The following example shows how to connect to the __Adventure Works DW 2008R2__ sample database using a connection string which stored in the __connectionStrings__ configuration element named __MyAdventureWorksDW__ :                 

    
````xml
<configuration>
<connectionStrings>
<add name="MyAdventureWorksDW"
connectionString="Data Source=localhost;Initial Catalog=Adventure Works DW 2008R2"
providerName="Microsoft.AnalysisServices.AdomdClient" />
</connectionStrings>
</configuration>
````

When the connection string is stored in the configuration file you need to specify the name of the configuration element as a value for the __ConnectionString__ property of the __CubeDataSource__ component:                 

{{source=CodeSnippets\CS\API\Telerik\Reporting\CubeDataSourceSnippets.cs region=ConnectionNameSnippet}}
````c#
Telerik.Reporting.CubeDataSource cubeDataSource = new Telerik.Reporting.CubeDataSource();

cubeDataSource.ConnectionString = "MyAdventureWorksDW";
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " +
                               "       non empty { [Product].[Category].[Category] } on rows " +
                               "from [Adventure Works]";
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\CubeDataSourceSnippets.vb region=ConnectionNameSnippet}}
````vb
Dim cubeDataSource As Telerik.Reporting.CubeDataSource = New Telerik.Reporting.CubeDataSource()

cubeDataSource.ConnectionString = "MyAdventureWorksDW"
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " & _
                               "       non empty { [Product].[Category].[Category] } on rows " & _
                               "from [Adventure Works]"
````

