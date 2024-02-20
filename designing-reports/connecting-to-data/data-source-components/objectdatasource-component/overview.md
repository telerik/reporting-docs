---
title: Overview
page_title: ObjectDataSource Component at a Glance
description: "Learn what are the basic requirements and the types supported by the ObjectDataSource Component in Telerik Reporting."
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview
tags: overview,object,business,component,.NET,types,requirements
published: True
position: 0
previous_url: /ObjectDataSource, /designing-reports/connecting-to-data/data-source-components/objectdatasource-component/
---

# ObjectDataSource Component Overview

A common application design practice is to separate the presentation layer from the business logic and encapsulate the business logic in business objects. These business objects form a layer between the presentation layer and the data tier, resulting in a multi-tier application architecture. The ObjectDataSource component supports the multi-tier architecture by providing a way for you to bind the Data Report Items to a middle-tier business object without extensive code. The ObjectDataSource component represents the middle-tier object (business object or any other class) and provides data retrieval capabilities.

## Supported object types

Any of the following data sources can be assigned to the DataSource property of the ObjectDataSource component:

* Any component that implements __[IEnumerable](https://learn.microsoft.com/en-us/dotnet/api/system.collections.ienumerable?redirectedfrom=MSDN&view=net-7.0)__, including __[System.Array](https://learn.microsoft.com/en-us/dotnet/api/system.array?redirectedfrom=MSDN&view=net-7.0)__, __[IList](https://learn.microsoft.com/en-us/dotnet/api/system.collections.ilist?redirectedfrom=MSDN&view=net-7.0)__, __[ICollection](https://learn.microsoft.com/en-us/dotnet/api/system.collections.icollection?redirectedfrom=MSDN&view=net-7.0)__, and __[BindingSource](https://learn.microsoft.com/en-us/dotnet/api/system.windows.forms.bindingsource?redirectedfrom=MSDN&view=windowsdesktop-7.0)__

* Any component that implements __[IListSource](https://learn.microsoft.com/en-us/dotnet/api/system.componentmodel.ilistsource?redirectedfrom=MSDN&view=net-7.0)__, including __[DataTable](https://learn.microsoft.com/en-us/dotnet/api/system.data.datatable?redirectedfrom=MSDN&view=net-7.0)__, __[DataSet](https://learn.microsoft.com/en-us/dotnet/api/system.data.dataset?redirectedfrom=MSDN&view=net-7.0)__ and DataView 

* Any component that implements __[IDataAdapter](https://learn.microsoft.com/en-us/dotnet/api/system.data.idataadapter?view=net-7.0)__, including __SqlDataAdapter__ and __OleDbDataAdapter__ 

* Any component that implements __[ITypedList](https://learn.microsoft.com/en-us/dotnet/api/system.componentmodel.itypedlist?view=net-7.0)__, including __[DataView](https://learn.microsoft.com/en-us/dotnet/api/system.data.dataview)__ and __[DataViewManager](https://learn.microsoft.com/en-us/dotnet/api/system.data.dataviewmanager)__ 

* System.Type which represents the type of the business object

## Requirements for the DataSource

* If the `DataSource` reference contains more than one table, you must set the `DataMember` property to a string that specifies the table to bind to.

	For example, if the DataSource is a DataSet or DataViewManager that contains three tables named `Customers`, `Orders`, and `OrderDetails`, you need to specify the table to bind to.

* If the name of the `DataMember` (i.e. the table to bind to) is not specified, __the first Table of the DataSet__ will be bound to the `DataSource`.
* If the `DataSource` references a strongly typed array of objects (business objects) these objects must contain public properties.
* If the `DataSource` is a business object, the `DataMember` property specifies the name of the method that should be invoked to retrieve the data.
* If the `DataMember` property is not specified, the constructor of the type will be invoked.
* If the constructor or the method contains arguments they can be specified through the `Parameters` collection of the `ObjectDataSource` component.
* You can also bind to an `ArrayList`. A feature of the `ArrayList` is that it can contain objects of multiple types. The `ObjectDataSource` component binds to such a list despite the types of items in it. The only requirement is that they provide public properties with the same names as they are used in the expressions.
* Already instantiated data objects do not have to be wrapped in a data source component. Instantiated data objects can be set directly to data items' DataSource properties.

## Supported developer platforms

* .NET Framework 4.0 and above
* .NET 6 and above
* .NET Standard 2.0 and above

## See Also

* [Connecting the ObjectDataSource component to a Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%})
* [How to Add ObjectDataSource in a Report Designed in the Standalone Designer?]({%slug steps-on-how-to-add-objectdatadource-in-a-report-designed-in-the-standalone-designer%})
* [AssemblyReferences element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%})
* [Data Source Components Problems]({%slug telerikreporting/designing-reports/connecting-to-data/troubleshooting/data-source-components-problems%})
