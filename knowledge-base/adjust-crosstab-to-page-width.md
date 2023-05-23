---
title: Adjust Crosstab to Page Width
description: "Learn how to adjust dynamically the Crosstab column width based on the incoming grouping data so that it always fits within a single page."
type: how-to
page_title: Modify crosstab column width dynamically to always fit in the page
slug: adjust-crosstab-to-page-width
tags: telerik,reporting,crosstab,data,adjust,dynamically
ticketid: 1602092
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

I would like the crosstab to occupy always the entire page width. The crosstab columns are generated dynamically, based on the incoming data.

## Solution

You may achieve the requirement with the [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) of the column Width. You may take the number of columns to be generated from the column grouping [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%}). The Page width may also be taken from the [Global Object]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}) [ReportDefinition]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%}#reportdefinition).

Here is a sample Expression:

`= (CDbl(Replace(CStr(ReportDefinition.PageSettings.PaperSize.Width), 'in', '')) - CDbl(Replace(CStr(ReportDefinition.PageSettings.Margins.Right), 'in', '')) - CDbl(Replace(CStr(ReportDefinition.PageSettings.Margins.Left), 'in', ''))) / Exec('crosstab1', CountDistinct(Fields.group)) + "in"`

The paper width and margins are in the format `1.5in`, so the above Expression removes the unit 'in' to be able to divide the available width by the total number of columns, and then re-adds the unit 'in' to the final width. If you use different units, i.e. 'cm', etc., you need to change the expression correspondingly.

>important The Expression assumes that the page mode is __Portrait__. When the page is in Landscape mode, you have to replace the Width with the Height and the Right/Left margins with the Top/Bottom ones.

If there is other content that needs to be on the page away from the crosstab, it may be necessary to subtract other (constant) values from the total available page width.

>important The column width may only grow dynamically. For that reason, you need to make its default (design-time) width smaller than the minimum expected column width.

A demo report demonstrating the approach may be found in our Reporting Samples Github Repository [DynamicCrosstabColumn.trdp](https://github.com/telerik/reporting-samples/blob/master/DynamicCrosstabColumn.trdp).

## See Also

* [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%})
* [Expression]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/overview%})
* [Global Object]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/global-objects%})
