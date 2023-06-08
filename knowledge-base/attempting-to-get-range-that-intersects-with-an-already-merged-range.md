---
title: Exporting Reports to Excel 2003 Causes an Error
page_title: Error occurring when exporting Telerik Reports to Excel 2003
description: "Learn how to handle the error thrown by the Telerik Reporting engine when trying to export to Excel 2003."
type: troubleshooting
slug: attempting-to-get-range-that-intersects-with-an-already-merged-range
tags: telerik, reporting, export, to, excel, 2003, throws, an, error
ticketid: 1402792
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product Version</td>
		<td>13.0.19.222</td>
	</tr>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Rendering Format</td>
		<td>Excel 97-2003</td>
	</tr>
</table>

## Description

How can I handle the error that occurs when I export the report to Excel 2003?

## Error Message

````
System.InvalidOperationException: Attempting to get range {X,Y}{X,Y},Merged=False,Parent=Telerik.Reporting.OpenXmlRendering.Spreadsheet.Worksheet, that intersects with an already merged range.
   at Telerik.Reporting.OpenXmlRendering.Spreadsheet.Worksheet.GetRange(Int32 col, Int32 row, Int32 colSpan, Int32 rowSpan)
   at Telerik.Reporting.ExcelRendering.RenderingItem.GetRange(IWorksheet worksheet, TableLayoutInfo layoutInfo)
   at Telerik.Reporting.ExcelRendering.RenderingItem.Render(IWorksheet worksheet, TableLayoutInfo layoutInfo)
   at Telerik.Reporting.ExcelRendering.RenderingItemContainer.RenderInternal(IWorksheet worksheet, TableLayoutInfo layoutInfo)
   at Telerik.Reporting.ExcelRendering.RenderingItemContainer.RenderInternal(IWorksheet worksheet, TableLayoutInfo layoutInfo)
   at Telerik.Reporting.ExcelRendering.Section.RenderInternal(IWorksheet worksheet, TableLayoutInfo layoutInfo)
   at Telerik.Reporting.ExcelRendering.Group.RenderInternal(IWorksheet worksheet, TableLayoutInfo layoutInfo)
   at Telerik.Reporting.ExcelRendering.Group.RenderInternal(IWorksheet worksheet, TableLayoutInfo layoutInfo)
   at Telerik.Reporting.ExcelRendering.RenderingItemContainer.RenderInternal(IWorksheet worksheet, TableLayoutInfo layoutInfo)
   at Telerik.Reporting.ExcelRendering.Report.RenderInternal(IWorksheet worksheet, TableLayoutInfo layoutInfo)
   at Telerik.Reporting.OpenXmlRendering.Spreadsheet.SpreadsheetReport.Telerik.Reporting.Processing.IRenderingExtension.Render(Report report, Hashtable renderingContext, Hashtable deviceInfo, CreateStream createStreamCallback, EvaluateHeaderFooterExpressions evalHeaderFooterCallback)
   at Telerik.Reporting.Processing.ReportProcessor.RenderCore(ExtensionInfo extensionInfo, IList`1 reports, Hashtable deviceInfo, IRenderingContext renderingContext, CreateStream createStreamCallback)
   at Telerik.ReportViewer.WebForms.ReportExportOperation.RenderReport(String format, IList`1 processingReports, Hashtable deviceInfo, IRenderingContext renderingContext)
   at Telerik.ReportViewer.WebForms.ReportRenderOperation.PerformOperationOverride()
   at Telerik.ReportViewer.WebForms.BasicHandler.ProcessRequest(HttpContext context)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStepImpl(IExecutionStep step)
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
````

## Cause

Usually, this error occurs as a result of incorrect report layout which might be caused by overlapping or growing items. As described in the [Design Considerations for Excel Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/excel-rendering-design-considerations%}) article, overlapped items are not allowed in Excel and may lead to unexpected results.

## Solution

To solve this issue, double-check for any overlapping items in the **Design** view of the report and make sure none of the items overlap. Overlapping items are located in the report surface and are marked with yellow triangle with an exclamation mark as a warning sign.

## See Also

* [Design Considerations for Excel Rendering]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/excel-rendering-design-considerations%})
