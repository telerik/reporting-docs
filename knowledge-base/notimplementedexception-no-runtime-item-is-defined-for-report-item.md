---
title: System.NotImplementedException 'No runtime item is defined for Telerik.Reporting.Report item'
description: System.NotImplementedException 'No runtime item is defined for Telerik.Reporting.Report item'.
type: how-to
page_title: System.NotImplementedException 'No runtime item is defined for Telerik.Reporting.Report item'
slug: notimplementedexception-no-runtime-item-is-defined-for-report-item
res_type: kb
---

  
## Problem  
**"System.NotImplementedException: No runtime item is defined for Telerik.Reporting.Report item"** is displayed on processing a report or in [Visual Studio Output window](https://msdn.microsoft.com/en-us/library/3hk6fby3.aspx).  

The full stack trace is included below for comparison:  

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
  
  
## Description 

To distribute Telerik Reporting assemblies you want to merge them into a single EXE or DLL that can be used by the custom application. ILMerge or other tool manages to gather the DLLs successfully, but when you try to run an application, which uses the merged DLL|EXE, you get the above mentioned error.   

The problem is related to changes in Telerik.Reporting.dll introduced in Q1 2013 and is applicable for v7.x and newer.  
  
## Solution 

You are allowed to distribute Telerik Reporting assemblies required for running the application. This excludes design-time assemblies provided by your Telerik Reporting installation.
For more details, check [Telerik Reporting License Agreement](https://www.telerik.com/purchase/license-agreement/reporting-dlw-s) - 4. License for Redistribution.

