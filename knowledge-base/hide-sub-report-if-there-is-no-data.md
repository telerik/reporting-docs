---
title: Hiding SubReport if there is no data
description: "Learn how to hide a SubReport report item if the report referenced by the aforementioned item has no data in it."
type: how-to
page_title: Hiding a SubReport (both Report Header and the Detail Section) if there is no data
slug: hide-sub-report-if-there-is-no-data
position: 
tags: SubReport, Expressions
ticketid: 1347758
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td>12.0.18.416</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
How to hide the [SubReport]({%slug telerikreporting/designing-reports/report-structure/subreport%}) if there is no data?

## Solution
The reporting generation engine renders a Detail section for each data record. When there is no data, it will not produce any Detail sections.
To hide the SubReport Header, use a [binding rule]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to set its **Visible** property to **True** only if there is an available data. For example:

`= Count(Fields.SomeFieldValue) > 0`

In main report, set the height of the SubReport item to 0 (zero). This way it will not occupy space when there is nothing to render in the SubReport.

For more available approaches, please refer to [How to hide a SubReport with no data]({%slug how-to-hide-subreport-with-no-data%}).
