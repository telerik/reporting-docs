---
title: Bind to a BusinessObject
page_title: Binding ObjectDataSource to a BusinessObject
description: "Learn how to Bind a Telerik Reporting ObjectDataSource component to a BusinessObject after creating it with code."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject
tags: how,to,bind,to,a,businessobject
published: True
position: 10
previous_url: /object-data-source-how-to-bind-to-business-object
reportingArea: General
---

# Binding ObjectDataSource Component to a BusinessObject

The following code sample illustrates a custom middle-tier business object that can be used with an `ObjectDataSource` component that specifies a strongly typed source object. The example demonstrates also how to configure the report to use the `ObjectDataSource` and how to preview it in the Windows Forms Report Viewer with code.

The `ObjectDataSource` component may be configured in the [Telerik Report Designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}) without the need for writing additional code. It may be necessary to extend the Reporting engine to recognize the custom assembly with the data providing logic through the [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%}) in the `Telerik.Reporting` section of the designer's configuration file.

## Remarks

The business object exposes several methods which return different data types. They represent only part of the data types which are supported by **Telerik Reporting** and can be used to feed an item with data. Additionally, methods with arguments are implemented which can be also invoked from the `ObjectDataSource` component. When the data method contains parameters the `Parameters` collection of the `ObjectDataSource` should be used to pass values to them at runtime.

To successfully invoke the data method, the parameters number, their names and types should match. The order of the parameters in the `Parameters` collection is not important. If there is a discrepancy between `ObjectDataSource` parameters and the method parameters you will receive a runtime exception that the method cannot be resolved.

The business object is marked with the `DataObjectAttribute` which indicates that the object is suitable for data binding. Objects marked with this attribute will be shown in the `ObjectDataSource` wizard when "_Show only data components_" checkbox is checked. Respectively the methods used for data retrieval are marked with the `DataObjectMethod` attribute.

## Example

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToBusinessObjectSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToBusinessObjectSnippet}}

> To use this code in the [Report Designer Tools]({%slug telerikreporting/designing-reports/report-designer-tools/overview%}), the data retrival methods must be built in separate assembly and specifically configured before it can be resolved by the Report Designers - [Connecting the ObjectDataSource component to a Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%})

## See Also

- [assemblyReferences Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%})
- [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
