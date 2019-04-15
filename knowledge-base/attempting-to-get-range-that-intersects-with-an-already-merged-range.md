---
title: Exporting to Excel 2003 causes an error {"Attempting to get range {X,Y}{X,Y},Merged=False,Parent=ReportName, that intersects with an already merged range."}
description: When selecting export to Excel 2003 from the drop down menu an error {"Attempting to get range,Merged=False,Parent=, that intersects with an already merged range."} occurs
type: troubleshooting
page_title: Exporting to Excel 2003 causes an error {"Attempting to get range {X,Y}{X,Y},Merged=False,Parent=ReportName, that intersects with an already merged range."}
slug: attempting-to-get-range-that-intersects-with-an-already-merged-range
position: 
tags: ExcelRendering
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


## Error Message
```
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
```

## Cause\Possible Cause(s)
Usually, this error could happen as a result of incorrect report layout which might be caused by overlapping or growing items. As described in the [Design Considerations for Excel Rendering](../designing-reports-considerations-excel) help article, overlapped items are not allowed in Excel and may lead to unexpected results.

## Solution
Double-check for any overlapping items in the Design view of the report and please make sure that there are none. They could be found in the report surface with warning signs (yellow triangle with an exclamation mark).
