---
title: How to Bind to a DataView
page_title: How to Bind to a DataView 
description: How to Bind to a DataView
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-dataview
tags: how,to,bind,to,a,dataview
published: True
position: 2
previous_url: /object-data-source-how-to-bind-to-data-view
---

# How to Bind to a DataView



The following example illustrates how to use a __DataView__ as the source       for an __ObjectDataSource__ component.

The sample code below shows how to pass a __DataView__    object to the __DataSource__    property of the __ObjectDataSource__ component. __DataView__ is usually used when we       want to work only with a subset of data from the __DataTable__. Additionally a       sample calculated field is added that can be used in the report definition in       the same way as a regular field.      

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataViewSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataViewSnippet}}


