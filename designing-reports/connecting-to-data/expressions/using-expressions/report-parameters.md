---
title: Report Parameters
page_title: Report Parameters | for Telerik Reporting Documentation
description: Report Parameters
slug: telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/report-parameters
tags: report,parameters
published: True
position: 6
---

# Report Parameters



Report parameters expose __AvailableValues__ , 		which represents the  		valid set of value/label pairs that the end user can choose from.

The __AvailableValues.ValueMember__  and 		__AvailableValues.DisplayMember__  		are usually names of columns from the __AvailableValues.DataSource__ , 		but sometimes you may need to use an expression to combine values from more 		columns as values/labels of the parameters. Expressions are also valid 		ValueMember/DisplayMembers, for example:

	='Mr. ' + Fields.LastName + ', ' + Fields.FirstName



You may also use 		[embedded expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/embedded-expressions%}):

	Mr. {Fields.LastName}, {Fields.FirstName}



# See Also


 * [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%})

 * [Using Report Parameters in Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/using-report-parameters-in-expressions%})
