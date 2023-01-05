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

The Detail section is rendered for each data record, so if there is no data, there will be no Detail section in the sub-report. However, the sub-report's ReportHeader/ReportFooter section (if any) would still be rendered.

## Solution

### Forcing the SubReport item not to occupy space in the main report when empty

To mimic hiding of the SubReport item inside the main report, you could set its height to '0' (zero). 
This way it will not occupy space when there is nothing to render. However, when there is data in the sub-report, it will grow automatically to occupy the needed space.
Setting the height of the SubReport item to '0' would make it invisible in the report designer. If you need to select it, you could use the [Report Explorer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-explorer%}).

### Forcing the sub-report referenced by the SubReport item to render blank/empty when there is no data

+ When the sub-report's data source is not directly dependent on the main report's data source, simply hiding the sub-report's ReportHeader/ReportFooter when there is no data would do. You could use [Bindings]({%slug telerikreporting/designing-reports/connecting-to-data/expressions/using-expressions/bindings%}) to set the ReportHeader/ReportFooter section _Visible_ property. For example:
	1. Select sub-report ReportHeader/ReportFooter _Properties_ -> _Bindings_ -> click on the ellipses to open the Bindings editor
	2. Click _New_ to add new Binding to the ReportHeader/ReportFooter section
	3. Under _Property path_ choose _Visible_
	4. Under _Expression_ type:
	
		```
			= Count(Fields.SomeFieldValue) > 0
		```
	
+ When the sub-report's data source is directly dependent on the main report's data source, i.e. it is set (using Bindings) with an expression like:
	```
		= ReportItem.DataObject
	```
	you can use another Binding (also directly on the sub-report) to set its _Visible_ property to an expression evaluated to _True_ only when the sub-report data is not _null_/_empty_. For example, let's assume that _'SomeFieldValue'_ is a single string passed from the main report to the sub-report:
	1. Select sub-report _Properties_ -> _Bindings_ -> click on the ellipses to open the Bindings editor
	2. Click _New_ to add new Binding to the sub-report
	3. Under _Property path_ choose _Visible_
	4. Under _Expression_ type:
	
		```
			= ReportItem.DataObject.SomeFieldValue <> ""
		```
	
## Notes
The suggested approach assumes that the sub-report has a data source (that could return empty data set) assigned directly to its DataSource property. If the sub-report DataSource is null the approach will not work as expected.
