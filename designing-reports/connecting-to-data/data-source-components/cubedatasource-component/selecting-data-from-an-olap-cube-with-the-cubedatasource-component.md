---
title: Selecting data from an OLAP cube with the CubeDataSource component
page_title: Selecting data from an OLAP cube with the CubeDataSource component 
description: Selecting data from an OLAP cube with the CubeDataSource component
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/selecting-data-from-an-olap-cube-with-the-cubedatasource-component
tags: selecting,data,from,an,olap,cube,with,the,cubedatasource,component
published: True
position: 3
---

# Selecting data from an OLAP cube with the CubeDataSource component

You can specify an __MDX__  query for the __CubeDataSource__ component to execute by setting its __SelectCommand__ property.             

The following example demonstrates an __MDX__ query that retrieves a result set consisting of product sales grouped by category and subcategory:                 

    
````sql
select non empty { [Measures].[Sales Amount] } on columns,
non empty { [Product].[Category].[Category] *
[Product].[Subcategory].[Subcategory] } on rows
from [Adventure Works]
````

The next code sample illustrates how to set the __ConnectionString__  and __SelectCommand__  properties of a __CubeDataSource__ component to retrieve the data from the above __MDX__  query:                 

{{source=CodeSnippets\CS\API\Telerik\Reporting\CubeDataSourceSnippets.cs region=SelectCommandSnippet}}
````c#
Telerik.Reporting.CubeDataSource cubeDataSource = new Telerik.Reporting.CubeDataSource();

cubeDataSource.ConnectionString = "MyAdventureWorksDW";
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " +
                               "       non empty { [Product].[Category].[Category] * " +
                               "                   [Product].[Subcategory].[Subcategory] } on rows " +
                               "from [Adventure Works]";
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\CubeDataSourceSnippets.vb region=SelectCommandSnippet}}
````vb
Dim cubeDataSource As Telerik.Reporting.CubeDataSource = New Telerik.Reporting.CubeDataSource()

cubeDataSource.ConnectionString = "MyAdventureWorksDW"
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " & _
                               "       non empty { [Product].[Category].[Category] * " & _
                               "                   [Product].[Subcategory].[Subcategory] } on rows " & _
                               "from [Adventure Works]"
````

The __CubeDataSource__  component does not impose any restrictions over the format of the __MDX__  query. However, to ensure that the retrieved data is in a proper format for visualization you should follow the next rule: specify the measures you want to aggregate in the column axis and the dimensions to group by in the row axis of the query; also avoid using more than two axes in a single query.                 

If you need to visualize the data grouped by rows and columns you can use the __Crosstab__ report item. Specify all the measures you want aggregated inside the __Crosstab__ body in the column axis and all the grouping dimensions in the row axis of your __MDX__ query. You can distribute the groups by rows and columns in the __Crosstab__ later, when configuring the __Crosstab__ layout from __Crosstab Wizard__ or in __Report Designer__.                 

The default fields returned by an __MDX__ query often are too long and might need to be escaped when used in expressions. To overcome this it is advised to assign shorter and more descriptive aliases for them. Use the __Mappings__  collection of the __CubeDataSource__ component to specify mappings between the fields of the data source and their corresponding aliases for use in expressions as illustrated in the following code sample: 

{{source=CodeSnippets\CS\API\Telerik\Reporting\CubeDataSourceSnippets.cs region=FieldMappingSnippet}}
````c#
Telerik.Reporting.CubeDataSource cubeDataSource = new Telerik.Reporting.CubeDataSource();

cubeDataSource.ConnectionString = "MyAdventureWorksDW";
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " +
                               "       non empty { [Product].[Category].[Category] * " +
                               "                   [Product].[Subcategory].[Subcategory] } on rows " +
                               "from [Adventure Works]";
cubeDataSource.Mappings.Add("[Measures].[Sales Amount]", "Sales");
cubeDataSource.Mappings.Add("[Product].[Category].[Category].[MEMBER_CAPTION]", "Category");
cubeDataSource.Mappings.Add("[Product].[Subcategory].[Subcategory].[MEMBER_CAPTION]", "Subcategory");
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\CubeDataSourceSnippets.vb region=FieldMappingSnippet}}
````vb
Dim cubeDataSource As Telerik.Reporting.CubeDataSource = New Telerik.Reporting.CubeDataSource()

cubeDataSource.ConnectionString = "MyAdventureWorksDW"
cubeDataSource.SelectCommand = "select non empty { [Measures].[Sales Amount] } on columns, " & _
                               "       non empty { [Product].[Category].[Category] * " & _
                               "                   [Product].[Subcategory].[Subcategory] } on rows " & _
                               "from [Adventure Works]"
cubeDataSource.Mappings.Add("[Measures].[Sales Amount]", "Sales")
cubeDataSource.Mappings.Add("[Product].[Category].[Category].[MEMBER_CAPTION]", "Category")
cubeDataSource.Mappings.Add("[Product].[Subcategory].[Subcategory].[MEMBER_CAPTION]", "Subcategory")
````

