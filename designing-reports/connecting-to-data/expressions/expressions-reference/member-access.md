---
title: Member Access
page_title: Member Access | for Telerik Reporting Documentation
description: Member Access
slug: telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/member-access
tags: member,access
published: True
position: 4
---

# Member Access



When you write an expression, you have access not only to [Global Objects]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}),        	[Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%}) and [Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%})     	but you can also access a member of an object, using the . (dot) character. You can call all public members of an object directly     	in the Expression Editor. Here are a few examples:     	     	 

*  __= Now().ToShortDateString():__  Returns a string that contains the current date in short format.

*  __= 'abc'.ToUpper():__  Returns "ABC" string.

*  __= 'abc'.Length:__  Returns the length of the current string, 3.

*  __= Price.ToString('$0.'):__  Returns the value of Price formatted according to the specified format, i.e. $123

# See Also


 * [Constants]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/constants%})

 * [Operators]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/operators%})

 * [Global Objects]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%})

 * [Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/overview%})

 * [Aggregate Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/aggregate-functions%})
