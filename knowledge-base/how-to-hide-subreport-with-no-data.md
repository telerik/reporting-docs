---
title: How to hide a SubReport with no data
description: Hide sub-report and SubReport item when its data source is empty
type: how-to
page_title: Hide empty sub-report from main report
slug: how-to-hide-subreport-with-no-data
position: 
tags: 
ticketid: 1156835
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>


## Description
Sometimes you would like to hide a sub-report if there is no data to display inside.

By default the SubReport item inside the main report would occupy the preserved (design-time) space even if its content is empty.

The Detail section is rendered for each data record, so if there is no data, there will be no Detail section in the sub-report. However, the sub-report's Header/Footer section would still be rendered.

## Solution

### Forcing the SubReport item not to occupy space in the main report when empty

To mimic hiding of the SubReport item inside the main report, you could set its height to '0' (zero). 
This way it will not occupy space when there is nothing to render. However, when there is data in the sub-report, it will grow automatically to occupy the needed space.

### Forcing the sub-report referenced by the SubReport item to render blank/empty when there is no data

When the sub-report's data source is not directly dependent on the main report's data source it is enough to hide the sub-report's Header/Footer when there is no data. You could use [Bindings](https://docs.telerik.com/reporting/expressions-bindings) to set the Header/Footer section's _Visible_ property, for example with the expression _'=Count(Fields.SomeFieldValue) \> 0'_.

When the sub-report's data source is directly dependent on the main report's data source, i.e. it is set (using Bindings) with the expression '= ReportItem.DataObject', you can use another Binding (also directly on the Report referenced by the SubReport item) to set its _Visible_ property to an expression evaluated to _True_ only when the 'ReportItem.DataObject.SubreportData' is not Null/empty - for example when 'SomeFieldValue' is a single string passed from main report to the SubReport, the expression could look like '= ReportItem.DataObject.SomeFieldValue <> ""'.

## Notes
The suggested approach assumes that the SubReport has a data source (that could return empty data set) assigned directly to the SubReport report item. If the report DataSource is null the approach will not work as expected.
