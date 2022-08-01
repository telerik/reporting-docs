---
title: How to Bind to a DataAdapter
page_title: How to Bind to a DataAdapter 
description: How to Bind to a DataAdapter
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-dataadapter
tags: how,to,bind,to,a,dataadapter
published: True
position: 3
---

# How to Bind to a DataAdapter



The following example illustrates how to use a __DataAdapter__ as the source for an __ObjectDataSource__ component.         

The __ObjectDataSource__ component allows you             to use directly a class that implements the __System.Data.IDataAdapter__ interface. In the sample code             below an instance of the __SqlDataAdapter__           class is created and passed to the __DataSource__           property of the __ObjectDataSource__ component.             When the __DataAdapter__ encounters multiple             result sets, it creates multiple tables and each table is given an             incremental default name of TableN, starting with "Table" for Table0.             In this case you have to set the __DataMember__           property of the __ObjectDataSource__ component             to indicate exactly which table to bind to. Additionally a sample             calculated field is added that can be used in the report definition             in the same way as a regular field.         

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataAdapterSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataAdapterSnippet}}


