---
title: How to set the default PDF view size to 100%
description: How to change settings of Acrobat Reader to be with 100 percentages zoom level
type: how-to
page_title: How to apply settings to the PDF Acrobat Reader to change the view size
slug: how-to-set-the-default-pdf-view-size-to-100-percentages
position:
tags: pdfrendering
ticketid: 1149438
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Rendering Format</td>
		<td>PDF</td>
	</tr>
</table>

## Description

This article describes how to change the default zoom level options in PDF Viewer Tool as they are set to "automatic" most commonly.

## Solution

The default PDF viewer zoom level could be changed in three ways:

1. Change the settings of the PDF Viewer tool
   - Open Acrobat Reader, navigate to _Edit menu_ -> _Preferences_ -> _Page Display_ -> set your required Zoom percentage.
   - Click _OK_ to confirm the change.
   - Relaunch Acrobat Reader to test

2. Change the settings programmatically with Telerik.Reporting configuration section in application configuration file

   This setting could be added to [Telerik.Reporting Configuration Section Extension Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/extensions-element%}) by using _JavaScript_ as name attribute and value _this.zoom=100_ like the following code snippet:

   ```XML
   <Telerik.Reporting>
      <extensions>
   	  <render>
   		<extension name="PDF">
   		  <parameters>
   			<parameter name="JavaScript" value="this.zoom=100"/>
   		  </parameters>
   		</extension>
   	  </render>
   	</extensions>
   </Telerik.Reporting>
   ```

3. With the using of the [ReportProcessor.RenderReport Method](/api/telerik.reporting.processing.reportprocessor#collapsible-Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) to render the report in the specified format

   There is a parameter called **deviceInfo** that contains parameters to pass to the rendering extension. Based on the [Export Report Programmatically: Exporting a report to a single document format]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}#exporting-a-report-to-a-single-document-format) example, is created the following code snippet for this case:

   ```C#
   Telerik.Reporting.Processing.ReportProcessor reportProcessor =
   	new Telerik.Reporting.Processing.ReportProcessor();

   // set any deviceInfo settings if necessary
   System.Collections.Hashtable deviceInfo =
   	new System.Collections.Hashtable();

   deviceInfo["JavaScript"] = "this.zoom=100";

   Telerik.Reporting.TypeReportSource typeReportSource =
   			 new Telerik.Reporting.TypeReportSource();

   // reportName is the Assembly Qualified Name of the report
   typeReportSource.TypeName = reportName;

   Telerik.Reporting.Processing.RenderingResult result =
   	reportProcessor.RenderReport("PDF", typeReportSource, deviceInfo);

   string fileName = result.DocumentName + "." + result.Extension;
   string path = System.IO.Path.GetTempPath();
   string filePath = System.IO.Path.Combine(path, fileName);

   using (System.IO.FileStream fs = new System.IO.FileStream(filePath, System.IO.FileMode.Create))
   {
   	fs.Write(result.DocumentBytes, 0, result.DocumentBytes.Length);
   }
   ```
