---
title: Selecting Data from OLAP Cube
page_title: Selecting data from an OLAP cube with the CubeDataSource Explained
description: "Learn how to provide an MDX query to select data from an OLAP cube with the Telerik Reporting CubeDataSource component."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/selecting-data-from-an-olap-cube-with-the-cubedatasource-component
tags: selecting,data,from,an,olap,cube,with,the,cubedatasource,component
published: True
position: 3
previous_url: /cubedatasource-selecting-data
reportingArea: General
---

# Selecting Data from an OLAP Cube with the CubeDataSource Component

You can specify an __MDX__ query for the `CubeDataSource` component to execute by setting its `SelectCommand` property.

The following example demonstrates an __MDX__ query that retrieves a result set consisting of product sales grouped by category and subcategory:

````SQL
select non empty { [Measures].[Sales Amount] } on columns,
	non empty { [Product].[Category].[Category] *
	[Product].[Subcategory].[Subcategory] } on rows
from [Adventure Works]
````

The next code sample illustrates how to set the `ConnectionString` and `SelectCommand` properties of a `CubeDataSource` component to retrieve the data from the above __MDX__ query:

{{source=CodeSnippets\CS\API\Telerik\Reporting\CubeDataSourceSnippets.cs region=SelectCommandSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\CubeDataSourceSnippets.vb region=SelectCommandSnippet}}

The `CubeDataSource` component does not impose any restrictions over the format of the __MDX__ query. However, to ensure that the retrieved data is in a proper format for visualization you should follow the next rule: specify the measures you want to aggregate in the column axis and the dimensions to group by in the row axis of the query; also avoid using more than two axes in a single query.

If you need to visualize the data grouped by rows and columns you can use the __Crosstab__ report item. Specify all the measures you want aggregated inside the __Crosstab__ body in the column axis and all the grouping dimensions in the row axis of your __MDX__ query. You can distribute the groups by rows and columns in the __Crosstab__ later, when configuring the __Crosstab__ layout from __Crosstab Wizard__ or in __Report Designer__.

The default fields returned by an __MDX__ query often are too long and might need to be escaped when used in expressions. To overcome this it is advised to assign shorter and more descriptive aliases for them. Use the `Mappings` collection of the `CubeDataSource` component to specify mappings between the fields of the data source and their corresponding aliases for use in expressions as illustrated in the following code sample:

{{source=CodeSnippets\CS\API\Telerik\Reporting\CubeDataSourceSnippets.cs region=FieldMappingSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\CubeDataSourceSnippets.vb region=FieldMappingSnippet}}

