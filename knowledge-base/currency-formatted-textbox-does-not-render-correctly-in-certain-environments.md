---
title: Currency formatted textbox does not render correctly in certain environments
description: The currency symbol renders incorrectly in certain environments
type: troubleshooting
page_title: The currency symbol is wrongly encoded
slug: currency-formatted-textbox-does-not-render-correctly-in-certain-environments
position: 
tags: 
ticketid: 1548378
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

The rendered report document contains weird symbols in place of the currency symbol in the textboxes that have currency formatting applied.

When determining what Culture to use for formatting strings and text direction, the rendering engine will inspect those objects in the following order:

1. The Culture of the TextBox.

2. If the TextBox has no Culture defined, the Culture of the Report is used.

3. If the Report has no Culture defined, the Culture of the **CurrentThread** is used.


## Possible Cause

This could be caused by the environment, where the report is rendered, having a different culture than the machine, where the report was designed.

For example, if the production environment had a specific culture, which currency symbol was not available in the font used by the textbox.

## Solution

1. You may wrap your textbox's __Value__ expression in the __FormatWithCulture(cultureName, format, args)__ [text function]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions%}) to ensure that the textbox will be formatted with that specific culture.

2. You may set the [Report.Culture](../api/Telerik.Reporting.Report.html#collapsible-Telerik_Reporting_Report_Culture) to a specific culture that will be used whenever the report is rendered.

## See Also

* [Report Globalization]({%slug telerikreporting/designing-reports/report-globalization%})

* [Text Functions]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/expressions-reference/functions/text-functions%})
