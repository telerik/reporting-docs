---
title: How to Bind to a DataSet
page_title: How to Bind to a DataSet 
description: How to Bind to a DataSet
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-dataset
tags: how,to,bind,to,a,dataset
published: True
position: 4
previous_url: /object-data-source-how-to-bind-to-data-set
---

# How to Bind to a DataSet



The following example illustrates how to use a DataSet as the source for an ObjectDataSource component.

In the code snippet below a DataSet object is filled with three tables and then used for the DataSource property of the ObjectDataSource component. The DataMemeber property of the ObjectDataSource component is set to indicate to which one of the three tables to bind to. Additionally a sample calculated field is added which can be used in the report definition in the same way as a regular field.

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataSetSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataSetSnippet}}

> To use this code in the [Report Designer Tools]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}), the data retrival methods must be built in separate assembly and specifically configured before it can be resolved by the Report Designers - [Connecting the ObjectDataSource component to a Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%})
