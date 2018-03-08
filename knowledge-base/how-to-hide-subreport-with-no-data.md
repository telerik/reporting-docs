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
Sometimes you would like to hide the Subreport(s) (i.e. Report Header/Footer and the Detail Section) if there is no data in it.
The Detail Section is rendered for each data record, so if there is no data, there will be no Detail Section in the SubReport. However, the Report Header/Footer would still be rendered, and the Subreport item inside the main report would still occupy the preserved (design-time) space.

## Solution
1. To hide the SubReport Header/Footer you could use [Bindings ](https://docs.telerik.com/reporting/expressions-bindings) to set its Visible property to True only when there is data (for example_'=Count(Fields.SomeFieldValue) \> 0'_).  

2. To mimic hiding of the Subreport item inside the main report, you could set its height to 0in (zero inches).  
This way it will not occupy space when there is nothing to render. However, when there is data in the SubReport, it will grow automatically to occupy the needed space. 
  

