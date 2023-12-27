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

I want to merge neighbor cells with identical content in a table or crosstab. The desired result is shown in the following image.

![Merged neighbor table cells with identical content.](images/Need-Result-Merged-Cells.png)

## Solution

We will create the desired layout combining two different approaches for the left and right-hand columns of the Crosstab.

* You can use the Table Row Groups feature in Telerik Reporting to achieve the required merging on the left side of the Crosstab. It comes automatically with the grouping. Here are the steps:

	1. Open or create the report in Telerik Report Designer.
	1. Use the [Crosstab Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/table-and-crosstab-wizards%}) to add a Crosstab to your report.
	1. Group the Crosstab on the columns `questName`, `questDetail`, and `risk`. This will create the necessary groupings and merge cells automatically.

* The second part is to merge the cells with identical content in the detail part of the Crosstab, including those that belong to different groups. Let's apply table borders to mimic this merging and proper [Expressions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}) for the Values of the merged cells to avoid multiplication in the merged cell:

	1. Set all `Bottom` borders to `None`.
	1. Set the `Top` border of a repeated value to `None` and the one of a new value to `Solid`. Here is a sample expression for the [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) of the property `Style.BorderStyle.Top` of the last column in our sample:

		````
= If(Previous(Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous(Fields.responsibilityAgency)) ? '' : Fields.responsibilityAgency,
			If(Previous('risk', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('risk', Last(Fields.responsibilityAgency))) ? '' : Fields.responsibilityAgency,
			If(Previous('questDetail', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('questDetail', Last(Fields.responsibilityAgency))) ? '' : Fields.responsibilityAgency, Fields.responsibilityAgency)))
````

	1. Set the cell Value to an empty string for a repeated value and to the corresponding fields for a new value. Here is a sample Expression for the same column:

		````
= If(Previous(Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous(Fields.responsibilityAgency)) ? '' : Fields.responsibilityAgency,
			If(Previous('risk', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('risk', Last(Fields.responsibilityAgency))) ? '' : Fields.responsibilityAgency,
			If(Previous('questDetail', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('questDetail', Last(Fields.responsibilityAgency))) ? '' : Fields.responsibilityAgency, Fields.responsibilityAgency)))
````

	1. Repeat the previous steps for each detail crosstab column, changing only the name of the field.
	1. Save and run the report to see the merged cells in the Crosstab.

	The `Previous` [Data Function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/data-functions%}) is used to check whether a value repeats the previous one in the column. When the value is the first for the current group, it needs to be compared with the last one from the previous group in the parent scope.

## Notes

* Make sure to adjust the expressions and values based on your specific report and data.
* The sample merges cells among the groups `questDetail` and `risk`. You may add merging with the top-level group `guestName` by changing the Expressions to test for repeated value also in this group. For example, the Border Expression will become:

````
= If(Previous(Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous(Fields.responsibilityAgency)) ? 'None' : 'Solid',
	If(Previous('risk', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('risk', Last(Fields.responsibilityAgency))) ? 'None' : 'Solid',
	If(Previous('questDetail', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('questDetail', Last(Fields.responsibilityAgency))) ? 'None' : 'Solid',
	If(Previous('questName', Fields.responsibilityAgency) is Not Null, (Fields.responsibilityAgency = Previous('questName', Last(Fields.responsibilityAgency))) ? 'None' : 'Solid', 'Solid'))))
````

## Example

Download the sample report [MergedTableCells.trdp in our reporting-samples Github repository]( https://github.com/telerik/reporting-samples/blob/master/Sample%20Reports/MergedTableCells.trdp).

## See Also

* [Telerik Reporting Documentation](https://docs.telerik.com/reporting/overview)
* [Telerik Reporting Forum](https://www.telerik.com/forums/reporting)
* [Telerik Reporting Demos](https://demos.telerik.com/reporting/)
