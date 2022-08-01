---
title: How to Bind to a BusinessObject
page_title: How to Bind to a BusinessObject 
description: How to Bind to a BusinessObject
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject
tags: how,to,bind,to,a,businessobject
published: True
position: 0
---

# How to Bind to a BusinessObject

The following code sample illustrates a custom middle-tier business object that can be used with an __ObjectDataSource__ component that specifies a strongly typed source object. 

## Remarks

The business object exposes several methods which return different data types. They represent only part of the data types which are supported by __Telerik Reporting__ and can be used to feed an item with data. Additionally, methods with arguments are implemented which can be also invoked from the __ObjectDataSource__ component. When the data method contains parameters the __Parameters__ collection of the __ObjectDataSource__ should be used to pass values to them at runtime. To successfully invoke the data method, the parameters number, their names and types should match. The order of the parameters in the __Parameters__ collection is not important. If there is a discrepancy between __ObjectDataSource__ parameters and the method parameters you will receive a runtime exception that the method cannot be resolved. 

The business object is marked with the __DataObjectAttribute__ which indicates that the object is suitable for data binding. Objects marked with this attribute will be shown in the __ObjectDataSource__ wizard when "*Show only data components*" checkbox is checked. Respectively the methods used for data retrieval are marked with the __DataObjectMethod__ attribute. 

## Example

{{source=CodeSnippets\CS\API\Telerik\Reporting\ObjectDataSourceSnippets.cs region=HowToBindToBusinessObjectSnippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\ObjectDataSourceSnippets.vb region=HowToBindToBusinessObjectSnippet}}

