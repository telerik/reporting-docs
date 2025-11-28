---
title: Using ReportItem.DataObject
page_title: Using the ReportItem.DataObject Global Object in Expressions
description: "Learn more about the Global Object ReportItem.DataObject, how to use it in Expressions and bind it to data item's DataSources."
slug: telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions
tags: how,to,use,the,reportitem.dataobject,property,in,expressions
published: True
position: 6
previous_url: /data-items-how-to-use-data-object
reportingArea: General
---

# Expressions with ReportItem.DataObject

This topic illustrates how to use the ReportItem.DataObject property in an expressions and master-detail scenarios.

DataObject is an object instance that represents the data that an item is bound to when processed. In the examples below we will illustrate how to use it in the most common scenarios.

When used in the context of data item (table, subreport, grapth and etc.) expression ReportItem.DataObject references the parent's data item data.

## Work with raw data type's methods and properties

The DataObject implements [IDataObject](/api/Telerik.Reporting.Processing.IDataObject) interface which defines the RawData property. This property is the actual data object that is being wrapped by the IDataObject and referring to DataObject, we actually refer to its RawData values. Thus to get the actual data object you can work with **ReportItem.DataObject.RawData**. The **RawData** object exposes all properties and methods of the data object's type.

For example:

```C#
public class Phone
{
	public string Number { get; set; }
	public string GetFormattedNumber()
	{
		return Number.Replace(' ','-');
	}
}
```
```VB
Public Class Phone
	Public Property Number() As String
		Get
			Return _Number
		End Get
		Set
			_Number = Value
		End Set
	End Property
	Private _Number As String
	Public Function GetFormattedNumber() As String
		Return Number.Replace(" ", "-")
	End Function
End Class
```

If the data object above is bound to a [data item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%}), `=ReportItem.DataObject.RawData` will return the exact data object of type **Phone**. This allows you to use the GetFormattedNumber method in an expression by calling `=ReportItem.DataObject.RawData.GetFormattedNumber()`, or use a property of the type e.g., `=ReportItem.DataObject.RawData.Number`.

## Use parent data item data for child data item datasource parameter

In the context of data item ReportItem.DataObject references the parent's data item data. Thus the ReportItem.DataObject.MyField retrieves the MyField data from the parent data item datasource. This way you can make use of of the datasource relations capability. For example when SqlDataSourceReport is set to the report and SqlDataSourceTable is set to a table. You can bind the SqlDataSourceTable datasource parameter to a SqlDataSourceReport data field as shown in the following datasource parameter example:

| Name         | Type   | Value                           |
| ------------ | ------ | ------------------------------- |
| @MyParameter | string | = ReportItem.DataObject.MyField |

### Use DataObject in an expression and user-defined function

When complicated logic should be applied or.NET framework routines need to be utilized it is more appropriate to create a user defined function instead of an expression. In this case it is useful to pass the current data item to the user function which will do the processing logic instead of writing a complicated expression. In the following example we will show how to display properly the **AdditionalContactsInfo** field, which is stored in XML format in the **AdventureWorks Person.Contact** table.

### Steps:

1. Create or open an existing report.
1. Add an SqlDataSource connected to **AdventureWorks** sample database and set it as a report's datasource.
1. Put the following text in the SqlDataSource's SelectCommand value:

   ```SQL
   select Contact.*
   from Person.Contact
   where Contact.AdditionalContactInfo is not null
   ```

1. Place two textboxes on your report’s detail section.
1. Set the first textbox's expression to

   `=Fields.FirstName`

1. Switch to code window and place the following code snippet:

   {{source=CodeSnippets\CS\API\Telerik\Reporting\Expressions\ReportItemDataObjectSnippets.cs region=ReportItemDataObjectGetContactInfo}}
   {{source=CodeSnippets\VB\API\Telerik\Reporting\Expressions\ReportItemDataObjectSnippets.vb region=ReportItemDataObjectGetContactInfo}}

   In this step we process the passed data argument as IDataObject, retrieving the fields by name.

1. Rebuild your project.
1. Set the second textbox's expression to the user defined function you created in **step 6** and pass the **ReportItem.DataObject** as its argument. The function name is **YourNamespace.GetContactInfo(data)**, so your expression should look like this:

   `= YourNamespace.GetContactInfo(ReportItem.DataObject)`

1. Preview or run your report. The second textbox now should show the concatenated person names and telephone numbers.

### Use DataObject as a datasource for nested data items (Table, List, Crosstab, Graph)

This scenario takes place when the currently bound data object have to be used as a datasource for a nested report item - table, graph or a subreport - for example, when it is needed to process some grouped data and show summary in the group header. The following example uses the **AdventureWorks’ Product** table, groups products by their **SafetyStockLevel** field and shows summary info about the products color in a crosstab placed in the group header.

The following screenshot shows the expected report output that should be created as a result of this example:

![The preview of the final report from the example as seen in the Windows Forms Report Viewer](images/DataItems/dataobject-report-output.png)

### Steps:

1. Create or open an existing report.
1. Add an SqlDataSource as a report's DataSource and set its SelectCommand property to:

   ```SQL
   select top 100 Product.Name, Product.ProductNumber, Product.Color, Product.SafetyStockLevel
   from Production.Product
   where Product.Color is not null
   order by Product.Name, Product.Color
   ```

1. Place two textboxes on your report's detail section and set their expressions to

   `= Fields.Name`

   and

   `= Fields.Color`

   respectively.

1. Add a report group using either the report's context menu or the Group Explorer and set its grouping to

   `= Fields.SafetyStockLevel`

1. Place a textbox on report's group header and set its expression to

   `= 'SafetyStockLevel: ' + Fields.SafetyStockLevel`

1. Add a crosstab to your report's group header and create a row or column group with the expression

   `= Fields.Color`

   as a grouping expression. Set the detail textbox's expression to

   `= Count(Fields.Color)`

   Alternatively you may use the crosstab wizard choosing the SqlDataSource used for the whole report, so that you have design-time support (Data explorer, Expression Builder in the context of the crosstab).

1. Add a [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to the crosstab using `DataSource` as a `PropertyPath` and `=ReportItem.DataObject` as an `Expression`, as shown in the following screenshot. This means that when the crosstab is processed its data source will be replaced with the result of the binding expression evaluation. This way it will be populated with the data of the current group insance.

   ![Setting of the Crosstab DataSource with Binding through the Editor of the Report Designer](images/DataItems/dataobject-edit-bindings.png)

1. Preview or start your report. You should now see the products information listed in the details section for every group and a summary info about the products colors summarized in the group headers.
