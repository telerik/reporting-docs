---
title: How to export data to multiple Excel worksheets
description: How to export reports to multiple Excel worksheets
type: how-to
page_title: Export report content to several worksheets in Excel
slug: export-data-to-multiple-worksheets
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

## Important

We issued this article before introducing the `SplitWorksheetOnPageBreak` Excel device info setting, allowing the splitting of the resulting document into sheets based on the applied soft page breaks. See:

* [Progress® Telerik® Reporting R2 2022 SP1 (16.1.22.622)](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r2-2022-sp1-16-1-22-622)
* [Excel 2007 Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/excel-2007-device-information-settings%})
* [Excel 2003 Device Information Settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/excel-2003-device-information-settings%})
* [Understanding Pagination]({%slug telerikreporting/designing-reports/rendering-and-paging/understanding-pagination%})

You can still apply the approach described in the current article if it better suits your scenario.

## Description

Telerik Reporting Excel rendering extension exports a report into a single worksheet in the Excel workbook. How to export report content to multiple worksheets.

## Solution

To export the data into multiple worksheets, add several reports to a [ReportBook]({%slug telerikreporting/designing-reports/report-book/overview%}).
Each report in a ReportBook will occupy a separate worksheet in the Excel workbook.

ReportBook can be created programmatically or using [Standalone report designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}).

ReportBook support for Standalone designer was added in the R1 2017 release. To start creating ReportBook, select **File | New** from the designer menu and choose a ReportBook report template.

## See Also

* [How to: Create a Report Book at run-time]({%slug telerikreporting/designing-reports/report-book/how-to-create-a-report-book-at-run-time%})
* [Design Considerations for Excel Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/excel-rendering-design-considerations%})
