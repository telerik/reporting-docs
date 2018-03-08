---
title: How to hide a Subreport with no data
description: Hide Sub-Report Header/Footer and Subreport item when its data source is empty
type: how-to
page_title: Hide empty subreport item from main report
slug: how-to-hide-subreport-with-no-data
position: 
tags: 
ticketid: 1156835
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product Version</td>
		<td></td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
Sometimes you would like to hide the Subreport(s) (i.e. Report Header/Footer and the Detail Section) if there is no data to display inside.

By default the Subreport item inside the main report would occupy the preserved (design-time) space even if its content is empty.

The Detail Section is rendered for each data record, so if there is no data, there will be no Detail Section in the (Sub)report. However, the (Sub)report Header/Footer would still be rendered.

## Solution
1. Forcing the Subreport item not to occupy space in the main report when empty:

To mimic hiding of the Subreport item inside the main report, you could set its height to '0' (zero inches).  
This way it will not occupy space when there is nothing to render. However, when there is data in the Subreport, it will grow downwards automatically to occupy the needed space.

2. Forcing the report referenced by the Subreport item to render blank/empty when there is no data:

When the Subreport DataSource is not directly dependent on the main report DataSource it is enough to hide the Subreport Header/Footer when there is no data. You could use [Bindings ](https://docs.telerik.com/reporting/expressions-bindings) to set Header/Footer _Visible_ property, for example with the expression _'=Count(Fields.SomeFieldValue) \> 0'_.

When the Subreport DataSource is directly dependent on the main report DataSource, i.e. it is set (using Bindings) with the expression '= ReportItem.DataObject', you can use another Binding (also directly on the Report referenced by the Subreport item) to set its _Visible_ property to an expression evaluated to _True_ only when the 'ReportItem.DataObject.SubreportData' is not Null/empty - for example when 'SomeFieldValue' is a single string passed from main report to the Subreport, the expression could lool like '= ReportItem.DataObject.SomeFieldValue <> ""'.


  

