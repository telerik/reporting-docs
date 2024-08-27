---
title: System.NotImplementedException 'No runtime item is defined for Telerik.Reporting.Report item' error.
description: System.NotImplementedException 'No runtime item is defined for Telerik.Reporting.Report item' error is thrown.
type: how-to
page_title: System.NotImplementedException 'No runtime item is defined for Telerik.Reporting.Report item' error is fired.
slug: notimplementedexception-no-runtime-item-is-defined-for-report-item
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
  	<tr>
		<td>Version</td>
		<td>Q1 2013 and later</td>
	</tr>
</table>

## Description 

**"System.NotImplementedException: No runtime item is defined for Telerik.Reporting.Report item"** is displayed on processing a report or in [Visual Studio Output window](https://msdn.microsoft.com/en-us/library/3hk6fby3.aspx).

## Cause

To distribute the Telerik Reporting assemblies, you want to merge them into a single **EXE** or **DLL** that can be used by the custom application. **ILMerge** or another tool manages to gather the DLLs successfully, but when you try to run an application, that uses the merged DLL|EXE, you get the aforementioned error. 
  
## Error Message

```
An error has occurred while rendering a report:
System.NotImplementedException: No runtime item is defined for Telerik.Reporting.Report item
   at Telerik.Reporting.Processing.ItemFactory.Create(Object itemDef, IProcessingContext processingContext)
   at Telerik.Reporting.Processing.ItemFactory.CreateItem(Object itemDef, IProcessingContext processingContext)
   at Telerik.Reporting.Processing.ReportProcessor.ProcessReport(Report report, IPathResolver pathResolver, IProcessingContext parentContext, IEnumerable`1 parameters, Key rootKey, Boolean interactivityEnabled, Boolean documentMapEnabled, PageLayoutInfo pageSettings, ErrorEventHandler errorHandler, List`1 documentNodes, Boolean& documentMapAvailable)
   at Telerik.Reporting.Processing.ReportProcessor.ProcessResolvedReports(ResolvedReportDocument resolvedReportDocument, IList`1 parameters, IProcessingContext contextPerDocument, Boolean interactivityEnabled, Boolean documentMapEnabled, PageLayoutInfo pageSettings, List`1 processedReports, ErrorEventHandler errorHandler, List`1 documentNodes, Boolean& documentMapAvailable, ListSlice& tocReportsSlice)
   at Telerik.Reporting.Processing.ReportProcessor.ProcessReportSource(ReportSource reportSource, IRenderingContext context)
   at Telerik.Reporting.Processing.ReportProcessor.ProcessReportSource(ReportSource reportSource, Hashtable deviceInfo, IRenderingContext context)
   at Telerik.ReportViewer.Common.ReportRenderer.Render(ReportRendererArgs args)
```

## Solution 

You are allowed to distribute the Telerik Reporting assemblies required for running the application, you do not need to merge them.

> This excludes design-time assemblies provided by your Telerik Reporting installation.

## See Also

* [Telerik Reporting License Agreement - 4. License for Redistribution.](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s)
