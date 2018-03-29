---
title: How to export data to multiple Excel worksheets
description: How to export report to multiple Excel worksheets
type: how-to
page_title: Export report content to several worksheets in Excel
slug: export-data-to-multiple-worksheets
position: 
tags: excel,reportbook
ticketid: 1158098
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Product Version</td>
		<td>12.0 18.227</td>
	</tr>
</table>


## Description

Telerik Reporting Excel rendering extension exports a report into a single worksheet in Excel workbook. How to export report content to multiple worksheets.

## Solution

To export the data into multiple worksheets, add several reports to a [ReportBook](https://docs.telerik.com/reporting/designing-reports-general-explanation).
Each report in a ReportBook will occupy a separate worksheet in Excel workbook.

ReportBook can be created programmatically or using [Standalone report designer](https://docs.telerik.com/reporting/standalone-report-designer).

ReportBook support for Standalone designer was added in R1 2017 release. To start creating ReportBook, select **File | New** from the designer menu and choose a ReportBook report template.

## See Also
[How to: Create a Report Book at run-time](https://docs.telerik.com/reporting/designing-reports-reportbook-creating-reportbook-run-time)

[Design Considerations for Excel Rendering](https://docs.telerik.com/reporting/designing-reports-considerations-excel)
