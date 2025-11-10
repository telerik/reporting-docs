---
title: Bindings
page_title: Bindings at a Glance
description: "Learn more about Bindings in Telerik Reporting, what are the suitable scenarios for using them and how to set bindings in report items."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings
tags: bindings
published: True
position: 3
previous_url: /expressions-bindings
reportingArea: General
---

# Bindings Overview

By default only a certain number of report items and properties can handle expression values. The simple binding between the other properties of a report item and an expression is accomplished by adding Binding objects to the Bindings collection.

For example, you can bind the `Style.BackgroundColor` property of a TextBox item to an expression `=Fields.CarColor` that when evaluated returns an object of type appropriate for the property, _System.Drawing.Color_ in this case. In certain cases using user-defined functions to perform appropriate type conversions should be considered.

When constructing a Binding instance with Binding constructor, you must specify:

* the `Name` of the property to bind; alternatively a period-delimited navigation path can be used to reference a property down the object hierarchy. For example the following navigation paths define valid properties:

	+ `DataSource`
	+ `Style.BackgroundColor`
	+ `Style.Font.Name` Only write-enabled properties can be set through binding expressions, so read-only properties are not suitable for data-binding.

	>tip Not all item properties support expression bindings. Please refer to the [Reporting API Reference](/api/) to check if a property supports binding.

* an [`Expression`]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) that will return the value for the property when evaluated at runtime.

![Edit Bindings Wizard](images/UI/Bindings.png)

## See Also

* [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})
* [Telerik.Reporting.Binding](/api/Telerik.Reporting.Binding)
* [Telerik.Reporting.BindingCollection](/api/Telerik.Reporting.BindingCollection)
