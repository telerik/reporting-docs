---
title: Expressions as Values of Item Properties
page_title: Expressions as Values of Item Properties | for Telerik Reporting Documentation
description: Expressions as Values of Item Properties
slug: telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/expressions-as-values-of-item-properties
tags: expressions,as,values,of,item,properties
published: True
position: 1
---

# Expressions as Values of Item Properties



By default the report items’ properties are strongly typed. Anyway 		you can use expressions as value for some of them. To specify that the 		value of a property is an expression, the value should be a string  		starting with equal (=) sign. If the equal sign is not present the value 		will be interpreted as a string literal. 		

This expression:

__='Hi Mr.' + Fields.LastName + ', ' + Fields.FirstName + '!'__ 

when evaluated will result in:

__Hi Mr. Smith, John!__ 

If you want part of the expression to be put on another line you have to insert a new line character in a string literal. For example here is how the expresion should look       in the [Expression Editor]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/edit-expression-dialog%}):     

__='Hi Mr.' + Fields.LastName + ', ' + Fields.FirstName + '!__ 

__How are you today?'__ 

On the design surface expressions are usually displayed surrounded 		by square brackets ([]). For example, the expression __=Fields.PersonID__  		when used in __TextBox.Value__  property would appear 		as __[=Fields.PersonID]__ .

The following objects and properties support expressions as 		property values:


| Object | Property |
| ------ | ------ |
|Barcode|Value|
|CheckBox|ValueTrueValueFalseValueIndeterminateValueText|
|PictureBox|Value|
|Report|DocumentName|
|ReportBook|DocumentName|
|ReportParameter|Value|
|TextBox|Value|
|ReportItemBase (all items)|BookmarkIDDocumentMapText|
|Group|BookmarkIDDocumentMapText|
|TableGroup|BookmarkIDDocumentMapText|
|CalculateField|Expression|
|Filter|ExpressionValue|
|Sorting|Expression|
|Grouping|Expression|
|ReportParameter|Value|
|ReportParameter.AvailableValues|ValueMember,DisplayMember|
|Parameter|Valu|




# See Also

