---
title: ObjectDataSource Component Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview
tags: overview
published: True
position: 0
---

# ObjectDataSource Component Overview



A common application design practice is to separate the presentation         layer from business logic and encapsulate the business logic in business objects.         These business objects form a layer between the presentation layer and the data         tier, resulting in a multi-tier application architecture. The ObjectDataSource         component supports the multi-tier architecture by providing a way for you to bind         the Data Report Items to a middle-tier business object without extensive code.         The ObjectDataSource component represents the middle-tier object (business object         or any other class) and provides data retrieval capabilities.       

## Supported object types

Any of the following data sources can be assigned to the DataSource property of the ObjectDataSource component:

* Any component that implements               __[IEnumerable](http://msdn.microsoft.com/en-us/library/system.collections.ienumerable.aspx)__,               including               __[System.Array](http://msdn.microsoft.com/en-us/library/system.array.aspx)__,               __[IList](http://msdn.microsoft.com/en-us/library/system.collections.ilist.aspx)__,               __[ICollection](http://msdn.microsoft.com/en-us/library/system.collections.icollection.aspx)__,               and __[BindingSource](http://msdn.microsoft.com/en-us/library/system.windows.forms.bindingsource.aspx)__

* Any component that implements __[IListSource](http://msdn.microsoft.com/en-us/library/system.componentmodel.ilistsource.aspx)__,               including __[DataTable](http://msdn.microsoft.com/en-us/library/system.data.datatable(VS.80).aspx)__,               __[DataSet](http://msdn.microsoft.com/en-us/library/system.data.dataset.aspx)__ and DataView             

* Any component that implements __[IDbDataAdapter](http://msdn.microsoft.com/en-us/library/system.data.idbdataadapter.aspx)__,               including __SqlDataAdapter__  and __OleDbDataAdapter__ 

* System.Type which represents the type of the business object             

## Requirements for the DataSource

* If the __DataSource__  reference contains more than one table, you must set           the __DataMember__  property to a string that specifies the table to bind to.         For example, if the DataSource is a DataSet or DataViewManager that contains three           tables named __Customers__ , __Orders__ , and __OrderDetails__ , you need to specify the table to           bind to.         

* If the name of the __DataMember__  (i.e. the table to bind to) is not specified, __the first Table of the DataSet__  will be bound to the __DataSource__ .         

* If the __DataSource__  references a strongly typed array of objects           (business objects) these objects must contain public properties.         

* If the __DataSource__  is a business object,           the __DataMember__  property           specifies the name of the method which should be invoked to retrieve the data.         

* If the __DataMember__  property is not specified, the constructor of the type will be invoked.             

* If the constructor or the method contains arguments they can be specified through the __Parameters__  collection of the __ObjectDataSource__  component.         

* You can also bind to an __ArrayList__ . A feature of the __ArrayList__  is that it           can contain objects of multiple types. The __ObjectDataSource__  component binds to           such a list despite the types of items in it. The only requirement is that they           provide public properties with the same names as they are used in the           expressions.         

* Already instantiated data objects do not have to be wrapped in a data source component.           Instantiated data objects can be set directly to data items' DataSource properties.         

## Supported developer platforms

* .NET Framework 4.0 and above             

* .NET Core 2.0 and above             

* .NET Standard 2.0 and above             

# See Also


 * [Connecting the ObjectDataSource component to a Data Source]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/connecting-the-objectdatasource-component-to-a-data-source%})

 * [How to add ObjectDataSource in a report designed in the Standalone Designer?](https://docs.telerik.com/reporting/knowledge-base/steps-on-how-to-add-objectdatadource-in-a-report-designed-in-the-standalone-designer)

 * [AssemblyReferences element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/assemblyreferences-element%})

 * [Data Source Components Problems]({%slug telerikreporting/designing-reports/connecting-to-data/troubleshooting/data-source-components-problems%})
