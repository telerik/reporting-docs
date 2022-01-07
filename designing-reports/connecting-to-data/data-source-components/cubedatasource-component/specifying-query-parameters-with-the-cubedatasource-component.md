---
title: Specifying query parameters with the CubeDataSource component
page_title: Specifying query parameters with the CubeDataSource component | for Telerik Reporting Documentation
description: Specifying query parameters with the CubeDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/specifying-query-parameters-with-the-cubedatasource-component
tags: specifying,query,parameters,with,the,cubedatasource,component
published: True
position: 4
---

# Specifying query parameters with the CubeDataSource component



The __CubeDataSource__  component supports parameterized __MDX__          queries by associating the parameters you add to the __Parameters__  collection with         placeholders in the query. Parameter values can be evaluated with any expression which conforms to the         common expression syntax supported by the reporting engine. This grants you a great deal of flexibility         on how you can supply your __MDX__  queries with parameters. For example, you can         bind an __MDX__  query parameter directly to a report parameter.       

>note The [CubeDataSource Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/data-source-wizards/cubedatasource-wizard%}) can detect parameters listed           in the MDX query, and it will ask you to provide values for them at  __Configure Data Source Parameters__  step.         

## 

When creating a parameterized query, you identify the parameter name by prefixing the name with the           *"@"*  character. For example, *"@Year"*  would           be a valid parameter name. __MDX__  supports only parameters for literal or scalar           values. To create a parameter that references a member, set, or tuple, you would have to use a function           such as __StrToMember__  or __StrToSet__ . To illustrate this,           let us define a simple __MDX__  query that selects product sales grouped by category           and subcategory, and define a slicing axis by year, where the chosen year is specified as a parameter.           Since the *"@Year"*  parameter is passed as a string literal value, we need           to use the __StrToMember__  function to convert that value to a valid member of           the cube as shown below:         

    
````sql
select non empty { [Measures].[Sales Amount] } on columns,
non empty { [Product].[Category].[Category] *
[Product].[Subcategory].[Subcategory] } on rows
from [Adventure Works]
where StrToMember(@Year)
````

The following code sample illustrates how to pass a value to the *"@Year"*            parameter of the query using the __Parameters__  collection of the __CubeDataSource__  component:         

{{source=CodeSnippets\CS\API\Telerik\Reporting\CubeDataSourceSnippets.cs region=SingleValueParameterSnippet}}
````c#
Telerik.Reporting.CubeDataSource cubeDataSource = new Telerik.Reporting.CubeDataSource();

cubeDataSource.ConnectionString = "MyAdventureWorksDW";
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " +
                               "       non empty { [Product].[Category].[Category] * " +
                               "                   [Product].[Subcategory].[Subcategory] } on rows " +
                               "from [Adventure Works] " +
                               "where StrToMember(@Year)";
cubeDataSource.Parameters.Add("Year", "[CY 2001]");
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\CubeDataSourceSnippets.vb region=SingleValueParameterSnippet}}
````vb
Dim cubeDataSource As Telerik.Reporting.CubeDataSource = New Telerik.Reporting.CubeDataSource()

cubeDataSource.ConnectionString = "MyAdventureWorksDW"
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " & _
                               "       non empty { [Product].[Category].[Category] * " & _
                               "                   [Product].[Subcategory].[Subcategory] } on rows " & _
                               "from [Adventure Works] " & _
                               "where StrToMember(@Year)"
cubeDataSource.Parameters.Add("Year", "[CY 2001]")
````

When you need to pass multiple values as a single parameter to the query, use the __StrToSet__  function instead. For example, to pass several years for the slicing axis at once, we can           modify the previous query as shown below:         

    
````sql
select non empty { [Measures].[Sales Amount] } on columns,
non empty { [Product].[Category].[Category] *
[Product].[Subcategory].[Subcategory] } on rows
from [Adventure Works]
where StrToSet(@Year)
````

Now it is possible to assign an array of years to the data source parameter:         

{{source=CodeSnippets\CS\API\Telerik\Reporting\CubeDataSourceSnippets.cs region=MultiValueParameterSnippet}}
````c#
Telerik.Reporting.CubeDataSource cubeDataSource = new Telerik.Reporting.CubeDataSource();

cubeDataSource.ConnectionString = "MyAdventureWorksDW";
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " +
                               "       non empty { [Product].[Category].[Category] * " +
                               "                   [Product].[Subcategory].[Subcategory] } on rows " +
                               "from [Adventure Works] " +
                               "where StrToSet(@Year)";
cubeDataSource.Parameters.Add("Year", new string[] { "[CY 2001]", "[CY 2002]" });
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\CubeDataSourceSnippets.vb region=MultiValueParameterSnippet}}
````vb
Dim cubeDataSource As Telerik.Reporting.CubeDataSource = New Telerik.Reporting.CubeDataSource()

cubeDataSource.ConnectionString = "MyAdventureWorksDW"
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " & _
                               "       non empty { [Product].[Category].[Category] * " & _
                               "                   [Product].[Subcategory].[Subcategory] } on rows " & _
                               "from [Adventure Works] " & _
                               "where StrToSet(@Year)"
cubeDataSource.Parameters.Add("Year", New String() {"[CY 2001]", "[CY 2002]"})
````

Instead of specifying the parameter values directly, you can use expressions to evaluate them at runtime.           For instance, you can bind the __CubeDataSourceParameter__  from the previous example           to a __ReportParameter__  with an expression, so that the default parameter user           interface of __Report Viewer__  can be used for choosing the slicing year:         

{{source=CodeSnippets\CS\API\Telerik\Reporting\CubeDataSourceSnippets.cs region=ReportParameterSnippet}}
````c#
var cubeDataSource = new Telerik.Reporting.CubeDataSource();

cubeDataSource.ConnectionString = "MyAdventureWorksDW";
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " +
                               "       non empty { [Product].[Category].[Category] * " +
                               "                   [Product].[Subcategory].[Subcategory] } on rows " +
                               "from [Adventure Works] " +
                               "where StrToMember(@Year)";
cubeDataSource.Parameters.Add("Year", "=Parameters.Year.Value");

var report = new Report1();

report.DataSource = cubeDataSource;
report.ReportParameters.Add("Year", ReportParameterType.String, "[CY 2001]");
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\CubeDataSourceSnippets.vb region=ReportParameterSnippet}}
````vb
Dim cubeDataSource As Telerik.Reporting.CubeDataSource = New Telerik.Reporting.CubeDataSource()

cubeDataSource.ConnectionString = "MyAdventureWorksDW"
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " & _
                               "       non empty { [Product].[Category].[Category] * " & _
                               "                   [Product].[Subcategory].[Subcategory] } on rows " & _
                               "from [Adventure Works] " & _
                               "where StrToMember(@Year)"
cubeDataSource.Parameters.Add("Year", "=Parameters.Year.Value")

Dim report As New Report1()

report.DataSource = cubeDataSource
report.ReportParameters.Add("Year", ReportParameterType.String, "[CY 2001]")
````

