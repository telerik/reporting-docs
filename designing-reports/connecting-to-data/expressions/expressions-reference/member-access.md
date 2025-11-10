---
title: Member Access
page_title: Member Access Explained
description: "Learn how to access members like inner properties of the Global Objects, Functions and other objects in Telerik Reporting Expressions."
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/member-access
tags: member,access,function,object,global,report
published: True
position: 4
previous_url: /expressions-member-access
reportingArea: General
---

# Accessing Members

When you write an expression, you have access not only to [Global Objects]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}), [Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%}) and [Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%}) but you can also access a member of an object, using the `.` (dot) character. You can call all public members of an object directly in the Expression Editor. Here are a few examples:

* `= Now().ToShortDateString():` Returns a string that contains the current date in short format.
* `= 'abc'.ToUpper():` Returns "ABC" string.
* `= 'abc'.Length:` Returns the length of the current string, 3.
* `= Price.ToString('$0.'):` Returns the value of Price formatted according to the specified format, i.e. $123

## See Also

* [Constants]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/constants%})
* [Operators]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/operators%})
* [Global Objects]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%})
* [Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%})
* [Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%})
