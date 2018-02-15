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
		<td>Progress® Telerik® Reporting </td>
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

	* Open Acrobat Reader, navigate to *Edit menu* -> *Preferences* -> *Page Display* -> set your required Zoom percentage.
	* Click *OK* to confirm the change.
	* Relaunch Acrobat Reader to test
2. Change the settings programatically with Telerik.Reporting configuration section in application configuration file

	This setting could be added to [Telerik.Reporting Configuration Section Extension Element](https://docs.telerik.com/reporting/configuring-telerik-reporting-extensions) by using *JavaScript* as name attribute and value *this.zoom=100* like the following code snippet:
	```
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
3. With the using of the [ReportProcessor.RenderReport Method](https://docs.telerik.com/reporting/m-telerik-reporting-processing-reportprocessor-renderreport) to render the report in the specified format

	There is a parameter called **deviceInfo** that contains parameters to pass to the rendering extension. Based on the [Export Report Programmatically: Exporting a report to a single document format](https://docs.telerik.com/reporting/programmatic-exporting-report#exporting-a-report-to-a-single-document-format) example, I created the following for the setting needed in this case:
	```CSharp
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
