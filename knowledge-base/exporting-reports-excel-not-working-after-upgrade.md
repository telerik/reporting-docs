---
title: Exporting Reports to MS Excel and Word Not Working After Upgrade
description: This article provides guidance on resolving the issue where Report Viewers fail to export a report to OpenXML formats after upgrading to the latest DocumentFormat.OpenXml version.
type: troubleshooting
page_title: Exporting Reports to MS Excel and Word Not Working After Upgrade | Telerik Reporting
slug: exporting-reports-excel-not-working-after-upgrade
tags: exporting, reports, Excel, patch, upgrade, Word, Telerik Reporting
res_type: kb
---

## Environment

| Product                    |
| -------------------------- |
| Progress Telerik Reporting |

## Description

After upgrading to the latest [DocumentFormat.OpenXml](https://www.nuget.org/packages/documentformat.openxml) version(3.0.0+), Telerik Reporting application fails to export a report to the MS OpenXML formats like XLSX and DOCX.

## Error

```
CSharp.Net7.Html5IntegrationDemo Error: 0 : System.TypeInitializationException: The type initializer for 'Telerik.Reporting.OpenXmlRendering.Wordprocessing.DocumentHelper' threw an exception.
 ---> System.TypeLoadException: Could not load type 'DocumentFormat.OpenXml.Packaging.ImagePartType' from assembly 'Telerik.Reporting.OpenXmlRendering.2.7.2, Version=17.2.23.1114, Culture=neutral, PublicKeyToken=a9d7983dfcc261be' due to value type mismatch.
   at Telerik.Reporting.OpenXmlRendering.Wordprocessing.DocumentHelper..cctor()
   --- End of inner exception stack trace ---
   at Telerik.Reporting.OpenXmlRendering.Wordprocessing.DocumentHelper.CreateMainPart(WordprocessingDocument package)
   at Telerik.Reporting.OpenXmlRendering.Wordprocessing.DocumentBuilder.CreateMainPart()
   at Telerik.Reporting.OpenXmlRendering.Wordprocessing.DocumentBuilder.CreateBodyLayout()
   at Telerik.Reporting.OpenXmlRendering.Wordprocessing.ReportWriter.WriteDocument(DocumentBuilder documentBuilder, LayoutElement layoutElement)
   at Telerik.Reporting.OpenXmlRendering.Wordprocessing.WordprocessingWriter.WriteEndElement(LayoutElement source, ElementPageInfo pageInfo)
   at Telerik.Reporting.BaseRendering.PageHandler.Telerik.Reporting.Paging.IPageHandler.EndElement(LayoutElement element, ElementPageInfo info)
   at Telerik.Reporting.Paging.PageEndElement.OutputToPage(IPageHandler handler)
   at Telerik.Reporting.Paging.PageElementsLayer.OutputToPage(IPageHandler handler)
   at Telerik.Reporting.Paging.PageContent.Output(IPageHandler handler)
   at Telerik.Reporting.Paging.PageCompositionBase.OutputPageContent(Stopwatch stopwatchOutputContent, PageContent pageContent)
   at Telerik.Reporting.Paging.PageCompositionBase.<>c__DisplayClass124_0.<CreatePageContentOutputTask>b__0()
An error has occurred while rendering the report: System.OperationCanceledException: The operation was canceled.
   at System.Threading.CancellationToken.ThrowOperationCanceledException()
   at System.Threading.ManualResetEventSlim.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.SpinThenBlockingWait(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.InternalWaitCore(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.Wait(CancellationToken cancellationToken)
   at Telerik.Reporting.Paging.PageCompositionBase.SeparateThreadOutputBehavior.Finish()
   at Telerik.Reporting.Paging.PageCompositionBase.CreatePages()
   at Telerik.Reporting.Paging.PagerBase.Telerik.Reporting.Paging.IPager.CreatePages(IPageHandler handler, LayoutElement root)
   at Telerik.Reporting.BaseRendering.RenderingExtensionBase.Render(LayoutElement root, Hashtable renderingContext, Hashtable deviceInfo, CreateStream createStreamCallback, EvaluateHeaderFooterExpressions evalHeaderFooterCallback, PageSettings pageSettings)
*** Render Report #0 "ReportCatalog" DONE in 00:00:00.2183346 ***

CSharp.Net7.Html5IntegrationDemo Error: 0 : An error occurred while rendering the report in separate thread: System.OperationCanceledException: The operation was canceled.
   at System.Threading.CancellationToken.ThrowOperationCanceledException()
   at System.Threading.ManualResetEventSlim.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.SpinThenBlockingWait(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.InternalWaitCore(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.Wait(Int32 millisecondsTimeout, CancellationToken cancellationToken)
   at System.Threading.Tasks.Task.Wait(CancellationToken cancellationToken)
   at Telerik.Reporting.Paging.PageCompositionBase.SeparateThreadOutputBehavior.Finish()
   at Telerik.Reporting.Paging.PageCompositionBase.CreatePages()
   at Telerik.Reporting.Paging.PagerBase.Telerik.Reporting.Paging.IPager.CreatePages(IPageHandler handler, LayoutElement root)
   at Telerik.Reporting.BaseRendering.RenderingExtensionBase.Render(LayoutElement root, Hashtable renderingContext, Hashtable deviceInfo, CreateStream createStreamCallback, EvaluateHeaderFooterExpressions evalHeaderFooterCallback, PageSettings pageSettings)
   at Telerik.Reporting.BaseRendering.RenderingExtensionBase.Render(Report report, Hashtable renderingContext, Hashtable deviceInfo, CreateStream createStreamCallback, EvaluateHeaderFooterExpressions evalHeaderFooterCallback)
   at Telerik.Reporting.Processing.ReportProcessor.RenderCore(ExtensionInfo extensionInfo, IList`1 processingReports, Hashtable deviceInfo, IRenderingContext renderingContext, CreateStream createStreamCallback)
   at Telerik.Reporting.Processing.ReportProcessor.RenderCore(String format, IList`1 reports, Hashtable deviceInfo, IRenderingContext renderingContext, CreateStream createStreamCallback)
   at Telerik.Reporting.Services.Engine.ReportRenderer.Render(ReportRendererArgs args)
   at Telerik.Reporting.Services.Engine.Rendering.RenderWithCulture(ReportRendererArgs args)
   at Telerik.Reporting.Services.Engine.Rendering.ThreadFunc(Object o)
```

## Solution

- If you are using version of Telerik Reporting prior to 2024 Q1 (18.0.24.130), you need to ensure that the `DocumentFormat.OpenXml` version referenced in the project is **2.7.2 or higher**, but lower than **3.0.0**.
- If you are using version of Telerik Reporting version 18.0.24.130 or newer, please reference `Telerik.Reporting.OpenXmlRendering.3.0.1` which works with `DocumentFormat.OpenXml` version **3.0.0 or newer**.
