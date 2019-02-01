---
title: Hide Sub Report (both Report Header and the Detail Section) if there is no data
description: Hide Sub Report (both Report Header and the Detail Section) if there is no data
type: how-to
page_title: Hide Sub Report (both Report Header and the Detail Section) if there is no data
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
How to hide the [SubReport](https://docs.telerik.com/reporting/report-items-sub-report) if there is no data?

## Solution
The Detail Section is rendered for each data record, so if there is no data, there will be no Detail Section in the SubReport.
To hide the SubReport Header, use a [binding rule](https://docs.telerik.com/reporting/expressions-bindings) to set its **Visible** property to **True** only if there is an available data. For example:
```
= Count(Fields.SomeFieldValue) > 0
```
In main report, set the height of the SubReport item to 0 (zero). This way it will not occupy space when there is nothing to render in the SubReport.
