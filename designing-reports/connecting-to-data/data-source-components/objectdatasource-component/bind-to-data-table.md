---
title: Bind to a DataTable
page_title: Binding ObjectDataSource to a DataTable
description: "Learn how to Bind a Telerik Reporting ObjectDataSource component to a DataTable after creating it with code."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-datatable
tags: how,to,bind,to,a,datatable
published: True
position: 1
previous_url: /object-data-source-how-to-bind-to-data-table
---

# Binding ObjectDataSource Component to a DataTable

The following example illustrates how to use a `DataTable` as the source for an `ObjectDataSource` component. The code below additionally creates a calculated field that can be used in the report definition in the same way as a regular field. The example demonstrates also how to configure the report to use the `ObjectDataSource` and how to preview it in the Windows Forms Report Viewer.

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataTableSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataTableSnippet}}

> To use this code in the [Report Designer Tools]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}), the data retrival methods must be built in separate assembly and specifically configured before it can be resolved by the Report Designers - [Connecting the ObjectDataSource component to a Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%})
