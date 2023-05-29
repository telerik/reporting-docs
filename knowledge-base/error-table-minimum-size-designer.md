---
title: Each table row and column maintains a minimum size
description: "Learn why the Report Designer does not allow setting a table row's/column's height/width to a value lower than 10px."
type: troubleshooting
page_title: Error when a table's row/column has a width/height less than 10px
slug: error-table-minimum-size-designer
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Item</td>
		<td>Table/Crosstab/List Report Item</td>
	</tr>
</table>

## Description

Trying to set a width or height sizing of less than 10px on table/crosstab/list row or column results in the `Each table row and column maintains a minimum size, resulting in a minimum table size of {Width=10px, Height=10px}` error. Usually, such error occurs when user try to make a row or column not visible by basically reducing its width or height(or both) to zero. The correct way to hide a row or a column is through [Conditional Formatting]({%slug telerikreporting/designing-reports/styling-reports/conditional-formatting%}) or a [Binding]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to the **Visible** property.

## Error Message

`Each table row and column maintains a minimum size, resulting in a minimum table size of {Width=10px, Height=10px}`

## Possible Causes

* The report contains a [Table/Cross/List item]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%}) with Width or/and Height properties set to 0.

	Setting Table/CrossTab/List item's size properties to zero values in Report Designers was possible in versions prior to [R3 2016 SP1](https://www.telerik.com/support/whats-new/reporting/release-history/telerik-reporting-r3-2016-sp1-(version-10-2-16-1025)). Upgrading the report from earlier version to **R3 2016 SP1** will result in the mentioned error in the design view if the report contained Table/Cross/List item with **zero** width or/and height.

* Table/Cross/List item was created programmatically and its width or/and height was set to 0.
* The code for generating Table/Cross/List item in the **Report.Designer.cs(vb)** file was modified and zero values were inserted manually for item's width(height).
* Table/CrossTab item is nested inside another table's cell using Table/CrossTab Wizard. This is a known issue, a workaround is to first create two tables separately and then nest one table inside another table's cell.

## Solution

Removing the problematic item from the report's definition or setting non-zero values for item's Width(Height) properties will resolve the issue:

1. Downgrade the report to the previous version using [Upgrade Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/upgrade-wizard%}) which will allow opening the *Design view*. After that, locate the item using the [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%}) and delete it or set non-zero values for Width(Height) properties (**recommended**).
1. Open report's `.Designer.cs(vb)` file, locate the code for setting item's [Size property](/api/Telerik.Reporting.ReportItem#Telerik_Reporting_ReportItem_Size) and set `Width` and `Height` to values greater than `0`.

## Notes

Setting Table/Cross/List item's Width(Height) properties to 0 should be avoided. If the requirement is to hide the item, you can use item's `Visible` property instead. Setting the `Visible` property to `False` will hide the item in the rendered report.
