---
title: Bind to a DataTable
page_title: Binding ObjectDataSource to a DataTable
description: "Learn how to Bind a Telerik Reporting ObjectDataSource component to a DataTable after creating it with code."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-datatable
tags: how,to,bind,to,a,datatable
published: True
position: 11
previous_url: /object-data-source-how-to-bind-to-data-table
reportingArea: General
---

# Binding ObjectDataSource Component to a DataTable

The following example illustrates how to use a `DataTable` as the source for an `ObjectDataSource` component. The code below additionally creates a calculated field that can be used in the report definition in the same way as a regular field. The example demonstrates also how to configure the report to use the `ObjectDataSource` and how to preview it in the Windows Forms Report Viewer with code.

The `ObjectDataSource` component may be configured in the [Telerik Report Designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}) without the need for writing additional code. It may be necessary to extend the Reporting engine to recognize the custom assembly with the data providing logic through the [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) in the `Telerik.Reporting` section of the designer's configuration file.

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToDataTableSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToDataTableSnippet}}

> To use this code in the [Report Designer Tools]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}), the data retrival methods must be built in separate assembly and specifically configured before it can be resolved by the Report Designers - [Connecting the ObjectDataSource component to a Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%})

## See Also

* [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%})
* [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
