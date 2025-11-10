---
title: Bind to a DataAdapter
page_title: Binding ObjectDataSource to a DataAdapter
description: "Learn how to Bind a Telerik Reporting ObjectDataSource component to a DataAdapter after creating it with code."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-dataadapter
tags: how,to,bind,to,a,dataadapter
published: True
position: 13
previous_url: /object-data-source-how-to-bind-to-data-adapter
reportingArea: General
---

# Binding ObjectDataSource Component to a DataAdapter

The following example illustrates how to use a `DataAdapter` as the source for an `ObjectDataSource` component. The example demonstrates also how to configure the report to use the `ObjectDataSource` and how to preview it in the Windows Forms Report Viewer with code.

The `ObjectDataSource` component may be configured in the [Telerik Report Designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}) without the need for writing additional code. It may be necessary to extend the Reporting engine to recognize the custom assembly with the data providing logic through the [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) in the `Telerik.Reporting` section of the designer's configuration file.

The `ObjectDataSource` component allows you to use directly a class that implements the `System.Data.IDataAdapter` interface. In the sample code below an instance of the `SqlDataAdapter` class is created and passed to the `DataSource` property of the `ObjectDataSource` component. When the `DataAdapter` encounters multiple result sets, it creates multiple tables and each table is given an incremental default name of TableN, starting with "Table" for Table0. In this case you have to set the `DataMember` property of the `ObjectDataSource` component to indicate exactly which table to bind to. Additionally a sample calculated field is added that can be used in the report definition in the same way as a regular field.

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataAdapterSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataAdapterSnippet}}

> To use this code in the [Report Designer Tools]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}), the data retrival methods must be built in separate assembly and specifically configured before it can be resolved by the Report Designers - [Connecting the ObjectDataSource component to a Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%})

## See Also

* [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%})
* [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
