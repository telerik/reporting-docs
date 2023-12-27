---
title: How to Merge Cells from Different Groups in Table/Crosstab
description: "Learn how to merge cells that don't belong to the same group in a table or crosstab using Telerik Reporting."
type: how-to
page_title: Merge Cells from Neighbor Groups in Table
slug: create-merge-cell-dynamic-table-crosstab
tags: reporting, merge-cell, dynamic-table, crosstab
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

I want to merge cells in a table or crosstab. The desired result is shown in the attached image "Need-Result.png".

### Solution

We will create the desired layout combining two different approaches for the left and right-hand columns of the Crosstab.

* You can use the Table Row Groups feature in Telerik Reporting to achieve the required merging on the left side of the Crosstab. Here are the steps:

1. Open the report in Telerik Report Designer.
1. Use the Crosstab Wizard to add a Crosstab to your report.
1. Group the Crosstab on the columns 'questName', 'questDetail', and 'risk'. This will create the necessary groupings automatically.

* The second part is to merge the cells with identical content in the detail part of the Crosstab, including those that belong to different groups. Let's apply table borders to mimic the rest of the merging and proper Expressions for the Values of the merged cells to avoid multiplication in the merged cell:

1. Set all `Bottom` borders to `None`.
1. Set the Top border of a repeated value to `None` and the border of a new value to `Solid`. Here is a sample expression for the [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) of the property `Style.BorderStyle.Top`:

````
= If(Previous(Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous(Fields.responsibilityAgency)) ? '' : Fields.responsibilityAgency,
	If(Previous('risk', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('risk', Last(Fields.responsibilityAgency))) ? '' : Fields.responsibilityAgency,
	If(Previous('questDetail', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('questDetail', Last(Fields.responsibilityAgency))) ? '' : Fields.responsibilityAgency, Fields.responsibilityAgency)))
````

1. Set the cell Value to an empty string for a repeated value and to the corresponding fields for a new value. Here is a sample Expression:

````
= If(Previous(Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous(Fields.responsibilityAgency)) ? '' : Fields.responsibilityAgency,
	If(Previous('risk', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('risk', Last(Fields.responsibilityAgency))) ? '' : Fields.responsibilityAgency,
	If(Previous('questDetail', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('questDetail', Last(Fields.responsibilityAgency))) ? '' : Fields.responsibilityAgency, Fields.responsibilityAgency)))
````

1. Repeat the previous steps for each column, changing only the name of the field.
1. Save and run the report to see the merged cells in the Crosstab.

Note that the `Previous` [Data Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions%}) is used to check whether a value repeats with the previous one. When the value is the first for the current group, it needs to be compared with the last one from the previous group in the parent scope.

## Notes

* Make sure to adjust the expressions and values based on your specific report and data.
* The sample merges cells among the groups 'questDetail' and 'risk'. You may add merging also with the top-level group 'guestName' by changing the Expressions to test for repeated value also in this group. For example, the Border Expression will become:

````
= If(Previous(Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous(Fields.responsibilityAgency)) ? 'None' : 'Solid',
	If(Previous('risk', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('risk', Last(Fields.responsibilityAgency))) ? 'None' : 'Solid',
	If(Previous('questDetail', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('questDetail', Last(Fields.responsibilityAgency))) ? 'None' : 'Solid',
	If(Previous('questName', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('questName', Last(Fields.responsibilityAgency))) ? 'None' : 'Solid', 'Solid'))))
````

## See Also

* [Telerik Reporting Documentation](https://docs.telerik.com/reporting/overview)
* [Telerik Reporting Forum](https://www.telerik.com/forums/reporting)
* [Telerik Reporting Demos](https://demos.telerik.com/reporting/)
