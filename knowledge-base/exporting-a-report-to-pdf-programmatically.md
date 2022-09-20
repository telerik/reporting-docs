---
title: Exporting a report to PDF programmatically
description: Exporting a report to PDF programmatically. Export the report without going through the report viewer.
page_title: Exporting a report to PDF programmatically
type: how-to
slug: exporting-a-report-to-pdf-programmatically
tags: styling and formatting reports
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>

## Description

This article explains how to export a report to PDF without the need to go through a report viewer.

## Solution

### For ASP.NET Framework

You can use the following code snippet to programmatically export the report into `PDF` format from a Web Site or Web Application project: 

````C#
void ExportToPDF(Telerik.Reporting.Report reportToExport)
{
	ReportProcessor reportProcessor = new ReportProcessor();
	Telerik.Reporting.InstanceReportSource instanceReportSource = new Telerik.Reporting.InstanceReportSource();
	instanceReportSource.ReportDocument = reportToExport;
	RenderingResult result = reportProcessor.RenderReport("PDF", instanceReportSource, null);

	string fileName = result.DocumentName + "." + result.Extension;

	Response.Clear();
	Response.ContentType = result.MimeType;
	Response.Cache.SetCacheability(HttpCacheability.Private);
	Response.Expires = -1;
	Response.Buffer = true;

	Response.AddHeader("Content-Disposition",
					string.Format("{0};FileName=\"{1}\"",
									"attachment",
									fileName));

	Response.BinaryWrite(result.DocumentBytes);
	Response.End();
}
````
````VB.NET
Sub ExportToPDF(ByVal reportToExport As Telerik.Reporting.Report)

	Dim reportProcessor As New ReportProcessor()
	Dim instanceReportSource As New Telerik.Reporting.InstanceReportSource()
	instanceReportSource.ReportDocument = reportToExport
	Dim result As RenderingResult = reportProcessor.RenderReport("PDF", instanceReportSource, Nothing)

	Dim fileName As String = result.DocumentName + "." + result.Extension 
	Response.Clear()
	Response.ContentType = result.MimeType
	Response.Cache.SetCacheability(HttpCacheability.Private)
	Response.Expires = -1
	Response.Buffer = True
	Response.AddHeader("Content-Disposition", String.Format("{0};FileName=""{1}""", "attachment", fileName))   
	Response.BinaryWrite(result.DocumentBytes)
	Response.End()
End Sub
````


### For ASP.NET Core

In ASP.NET Core, the `Response` object does not expose a `BinaryWrite` method. For that reason, the approach will need to change a little.
We can instead convert the document bytes, of the result object returned by the `RenderReport` method, to a `Base64` string and we may then return it.

````C#
[HttpGet]
public IActionResult GenerateReportPDF(string reportName)
{
	var reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();

	// set any deviceInfo settings if necessary
	var deviceInfo = new System.Collections.Hashtable();

	var reportSource = new Telerik.Reporting.UriReportSource();

	reportSource.Uri = @"C:\Program Files (x86)\Progress\Telerik Reporting Version\Report Designer\Examples\Dashboard.trdp";

	Telerik.Reporting.Processing.RenderingResult result = reportProcessor.RenderReport("PDF", reportSource, deviceInfo);

	var b64 = Convert.ToBase64String(result.DocumentBytes);
	return new ContentResult() { Content = b64 };
}
````

Then, on the client side, we need to convert that Base64 string back to array. The following function may be used for the task:

````JS
function base64ToArrayBuffer(data) {
		var binaryString = window.atob(data);
		var binaryLen = binaryString.length;
		var bytes = new Uint8Array(binaryLen);
		for (var i = 0; i < binaryLen; i++) {
			var ascii = binaryString.charCodeAt(i);
			bytes[i] = ascii;
		}
		return bytes;
	};
````

Lastly, we can make an AJAX request to our controller method to get the rendered report, convert the returned Base64 string and then return the rendered report as an attachment using [Blobs](https://developer.mozilla.org/en-US/docs/Web/API/Blob)

````JS
$.ajax({
	method: "GET",
	url: '@Url.Action("GenerateReportPDF","ControllerName")',
	async: false,
	cache: false,
	data: { reportName }
}).done(function(result) {
	//if the call was successful
	if (result) {
		buffer = base64ToArrayBuffer(result)
		var file = new Blob([buffer], { type: "application/pdf" })

		var link = document.createElement('a')
		link.href = window.URL.createObjectURL(file)
		link.download = "Report.pdf";
		document.body.appendChild(link)
		link.click()
	}
})
````

