---
title: How to Databind to Collection Properties
description: How to Databind to Collection Properties. 
type: how-to
page_title: How to Databind to Collection Properties
slug: how-to-databind-to-collection-properties
res_type: kb
---

## Problem 
How to databind to collection properties of Business Objects
 
## Description  
 A common scenario is the need to set a [data item](../data-items)’s DataSource property to a custom Business object. Depending on the underlying data-structure [ObjectDataSource](../objectdatasource), [OpenAccessDataSource](../openaccessdatasource) or [EntityDataSource](../entitydatasource) components can be used to expose the properties of the Business object to the report. However, if the data schema is not flat and some of the properties represent child data collections. This presents the need of a way to bind a report to hierarchical data.
 
## Solution
 In order to be able to use hierarchical data you can take advantage of the [Bindings](../p-telerik-reporting-reportitembase-bindings) functionality. Using it, you can bind declaratively the data item's [DataSource](../p-telerik-reporting-table-datasource) property to a given collection property from your business object and the data item will display all collection items.
 
## Example  
 Consider the following scenario illustrating a custom business object **Contact** having as a property a collection of**Phone** objects.   
   
 
````cs
public class Contact
 {
     public string Name { get; set; }
     public List<Phone> Phones { get; set; }       
 }
 
public class Phone
 {
     public string Number { get; set; }
 }
````
````vb
Public Class Contact
    Private m_Name As String   
    Public Property Name() As String
        Get
            Return m_Name
        End Get
        Set(value As String)
            m_Name = value
        End Set
    End Property
    
    Private m_Phones As List(Of Phone)
    Public Property Phones() As List(Of Phone)
        Get
            Return m_Phones
        End Get
        Set(value As List(Of Phone))
            m_Phones = value
        End Set
    End Property
     
End Class
 
Public Class Phone
    Public Property Number() As String
        Get
            Return m_Number
        End Get
        Set(value As String)
            m_Number = value
        End Set
    End Property
    Private m_Number As String
End Class
```` 
    
The *Report.DataSource* property is set to a collection of **Contact** objects and we want to display a list of **Phone** objects for each **Contact** object. For the purpose add a Table item and set its DataSource property to Fields.Phones via binding as illustrated on the image below. 

 ![Bindings](https://d585tldpucybw.cloudfront.net/sfimages/default-source/kb-articles/bindings.png)
 
For more information, see [Bindings.](../expressions-bindings)
 
> Note 
></br>
>The expressions are evaluated only during the report processing. Thus the data schema for the nested data item (Table) will not be available in the data explorer and in the wizards. You can use additional data source components bound to the nested business objects to help yourself with creating the report layout. Finally, apply the required bindings and remove the helper object data source components.
 
 


