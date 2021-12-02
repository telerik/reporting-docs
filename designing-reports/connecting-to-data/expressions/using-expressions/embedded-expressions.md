---
title: Embedded Expressions
page_title: Embedded Expressions | for Telerik Reporting Documentation
description: Embedded Expressions
slug: telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/embedded-expressions
tags: embedded,expressions
published: True
position: 2
---

# Embedded Expressions



Some properties that accept String values allow mixing text with 		expressions. When evaluated, expressions will be replaced by their 		result thus forming the runtime value of the property.

Expressions are embedded in a string literal by surrounding them 		with curly brackets {}:

__Hi Mr. {Fields.LastName}, {Fields.FirstName}!__ 

In the example above the expressions Fields.FirstName and 		Fields.LastName are embedded in a string constant and when evaluated will 		produce a result like this:

__Hi Mr. Smith, John!__ 

If used in a string literal, curly brackets - __{ }__  should be escaped 		with double brackets like this: __{{__  or __}}__ .

The following properties support embedded expressions:

* TextBox.Value

* HtmlTextBox.Value

* CheckBox.Text

* ReportParameter.Text

* ReportParameter.AvailableValues.DisplayMember

* ReportParameter.AvailableValues.ValueMember

# See Also

