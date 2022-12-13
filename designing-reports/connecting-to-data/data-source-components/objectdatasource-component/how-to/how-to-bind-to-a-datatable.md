---
title: How to Bind to a DataTable
page_title: How to Bind to a DataTable 
description: How to Bind to a DataTable
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-datatable
tags: how,to,bind,to,a,datatable
published: True
position: 1
previous_url: /object-data-source-how-to-bind-to-data-table
---

# How to Bind to a DataTable



The following example illustrates how to use a __DataTable__ as the        source for an __ObjectDataSource__ component. The code below additionally        creates a calculated field that can be used in the report definition in        the same way as a regular field.

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataTableSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataTableSnippet}}

> To use this code in the [Report Designer Tools]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}), the data retrival methods must be built in separate assembly and specifically configured before it can be resolved by the Report Designers - [Connecting the ObjectDataSource component to a Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%})
