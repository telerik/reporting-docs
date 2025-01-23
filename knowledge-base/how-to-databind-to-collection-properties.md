---
title: Binding to Collection Properties
description: Learn how to build a hierarchical Report Table using nested Collection Properties.
type: how-to
page_title: Using Nested Collection Properties for Building Hierarical Table
slug: how-to-databind-to-collection-properties
tags: report, hierarchy, nested, collection, table, class, object, source
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 18.3.24.1112 | Telerik Reporting |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

A common scenario is to set a [Data Item]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/overview%})'s **DataSource** property to a custom Business object. Depending on the underlying data structure [ObjectDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/overview%}), [EntityDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/entitydatasource-component/overview%}), etc. components can be used to expose the properties of the Business object to the report. However, if the data schema is **not flat** and some of the properties represent child (nested) data collections, you may need to bind a report to the hierarchical data.

In order to be able to use hierarchical data, you can take advantage of the [Bindings](/api/Telerik.Reporting.ReportItemBase#Telerik_Reporting_ReportItemBase_Bindings) functionality. Using it, you can bind declaratively the data item's [DataSource](/api/Telerik.Reporting.DataItem#Telerik_Reporting_DataItem_DataSource) property to a given collection property from your business object and the data item will display all collection items.

This tutorial shows a sample approach how to create a hierarchical Report Table using a collection of business objects  in which the business objects contains a collection property.

## Solution

Consider the scenario illustrating a custom business object `Contact` having as a property a collection of `Phone` objects.

1\. Create a **ClassLibrary** project with the following definition:

````CSharp
	using System.ComponentModel;

	namespace ContactsClassLibrary
	{
		public class ContactsCollection
		{

			BindingList<Contact> _contacts;
			public ContactsCollection()
			{

				_contacts = new BindingList<Contact>();
				for (int i = 0; i < 5; i++)
				{
					BindingList<Phone> phones = new BindingList<Phone>();
					for (int j = 0; j < 3; j++)
					{
						phones.Add(new Phone("Phone" + i + "." + j));
					}
					_contacts.Add(new Contact("Contact" + i, phones));
				}
			}
			public BindingList<Contact> AllContacts { get { return _contacts; } }

		}

		public class Contact
		{
			public Contact(string _name, BindingList<Phone> _phones)
			{
				this.Name = _name;
				this.Phones = _phones;
			}
			public string Name { get; set; }
			public BindingList<Phone> Phones { get; set; }
		}

		public class Phone
		{
			public Phone(string _number)
			{
				this.Number = _number;
			}
			public string Number { get; set; }
		}
	}
````

2\. Build the project to ensure that **ContactsClassLibrary.dll** is produced in the **bin** folder.

3\. [Extend the Report Designer to Recognize the Custom Assembly]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})

4\. Create a brand new report and add an **ObjectDataSource** data item bound to the ContactsCollection.**AllContacts** property:

![Binding ObjectDataSource](images/binding-object-data-source.png) 

5\. Create a Table Report Item using the wizard and bind it to the defined **ObjectDataSource**:

![Table Wizard](images/table-wizard.png)  

6\. Previewing the report at this state is expected to produce the following result:

![Initial Preview](images/initial-preview.png)   

7\. Select the **=Fields.Phones** TextBox and replace it with an empty Table item:

![Replace with Empty Table](images/replace-with-empty-table.png)    

8\. Adjust the empty Table's **DataSource** via Bindings:

![Bind the Empty Table](images/bind-the-empty-table.png)   

9\. Select one of the generated TextBoxes in the empty Table and set its **Value** property to the desired property of the **Phone** class, e.g. "Number":

![Bind the Nested Property](images/bind-the-nested-property.png)    

10\. Preview the report and see the phones for each contact:

![Hierarchical Table](images/hierarchical-table.png)    

## Notes

The expressions are evaluated only during the report processing. Thus, the data schema for the nested data item (Table) will not be available in the Data Explorer and in the wizards. You can use additional data source components bound to the nested business objects to help yourself with creating the report layout. Finally, apply the required bindings and remove the helper object data source components.

## See Also

* [Extending Report Designer to Recognize Custom Assemblies]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
* [Bind to a BusinessObject]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/objectdatasource-component/how-to/how-to-bind-to-a-businessobject%})
* [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%})
* [Data Binding Problems]({%slug telerikreporting/designing-reports/connecting-to-data/troubleshooting/data-binding-problems%})
* [How to use the ReportItem.DataObject property in expressions]({%slug telerikreporting/designing-reports/connecting-to-data/data-items/how-to-use-the-reportitem.dataobject-property-in-expressions%})
