---
title: Bindings
page_title: Bindings | for Telerik Reporting Documentation
description: Bindings
slug: telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings
tags: bindings
published: True
position: 3
---

# Bindings



By default only a certain number of report items and properties can handle expression values. The simple binding between the other properties of a report item and an expression is accomplished by adding Binding objects to the Bindings collection.

For example, you can bind the Style.BackgroundColor property of a TextBox item to an expression (=Fields.CarColor) that when evaluated returns an object of type appropriate for the property, System.Drawing.Color in this case. In certain cases using user-defined functions to perform appropriate type conversions should be considered. 

When constructing a Binding instance with Binding constructor, you must specify:

* the name of the property to bind; alternatively a period-delimited 		  	navigation path can be used to reference a property down the object 		  	hierarchy. For example the following navigation paths define valid 		  	properties:

   + "DataSource"

   + "Style.BackgroundColor"

   + "Style.Font.Name"Only write-enabled properties can be set through binding 			expressions, so read-only properties are not suitable for 			data-binding.Note: Not all item properties support expression bindings. 			Please refer to the API reference to check if a property  			supports binding.

* an expression that will return the value for the property when evaluated at runtime.  

  ![](images/UI/Bindings.png)

# See Also


 * [Telerik.Reporting.Binding](/reporting/api/Telerik.Reporting.Binding) 

 * [Telerik.Reporting.BindingCollection](/reporting/api/Telerik.Reporting.BindingCollection) 
