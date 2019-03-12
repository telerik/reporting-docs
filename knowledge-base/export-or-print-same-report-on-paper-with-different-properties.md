---
title: Printing or physical rendering of report on a paper with dynamically modified properties
description: Modify page settings of a report dynamically 
type: how-to
page_title: Render the same report on paper with different properties (Paper Size, Margins, etc.)
slug: export-or-print-same-report-on-paper-with-different-properties
position: 
tags: 
ticketid: 1357072
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>


## Description
Printer settings and Device Info settings passed to the _ReportProcessor_ have lower priority than report _PageSettings_. Here we suggest two approaches when it is necessary to print the same report on different paper types/sizes.

## Solution
The [PageSettings](../properties-t-telerik-reporting-drawing-pagesettings) of the Report will be respected upon rendering in physical format and printing.  

1. Create a copy of the report for each specific paper type/size. The difference between the reports will be the _Report.PageSettings_ property, i.e in the corresponding _PaperKind_, _PaperSize_, _Margins_, etc.


2. Instantiate the report, change its _PageSettings_ accordingly and wrap it in an _InstanceReportSource_ to pass it to the _ReportProcessor_ / Reporting Engine for rendering.  
  ```CSharp
  report = new MyReport();
  
  // Modify report PageSettings
  report.PageSettings.PaperKind = "A3";
  report.PageSettings.Landscape = True;
  
  InstanceReportSource instanceReportSource = new InstanceReportSource();
  instanceReportSource.ReportDocument = report;
  Telerik.Reporting.Processing.ReportProcessor reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();
  System.Collections.Hashtable deviceInfo = new System.Collections.Hashtable();
  Telerik.Reporting.Processing.RenderingResult result = reportProcessor.RenderReport("PDF", instanceReportSource, deviceInfo);
  ```
