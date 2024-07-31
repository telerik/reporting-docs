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
We can instead use the document bytes of the result object returned by the `RenderReport` method to return a [FileContentResult](https://learn.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.mvc.filecontentresult?view=aspnetcore-8.0):

````C#
        [Route("exportreport")]
        public IActionResult GenerateReportPDF(string reportName)
        {
            ReportProcessor reportProcessor = new ReportProcessor();
            Telerik.Reporting.UriReportSource uriReportSource = new Telerik.Reporting.UriReportSource();
            uriReportSource.Uri = Path.Combine(_environment.ContentRootPath, "Reports", reportName);
            RenderingResult result = reportProcessor.RenderReport("PDF", uriReportSource, null);

            return File(result.DocumentBytes, result.MimeType);
        }
````

Then, we can make an AJAX request to our controller method to get the rendered report and return it as an attachment using [Blobs](https://developer.mozilla.org/en-US/docs/Web/API/Blob).

````JS
        function exportReport(reportName) {
            fetch(`/api/sample/exportreport?reportName=${reportName}`)
                 .then(res => {
                     if (res.status === 200) {
                         return res.blob();
                     } else {
                         console.log("Could not retrieve PDF document.");
                     }
                 })
                 .then(blob => {
                    let link = document.createElement('a');
                    let documentName = reportName.slice(0, -4);
                    link.href = window.URL.createObjectURL(blob);
                    link.download = `${documentName}.pdf`;
                    document.body.appendChild(link);
                    link.click();
                });
        }
````

## Notes

Whether the report will be downloaded or previewed in the browser depends on the browser's PDF document settings, for example:

- [PDF Settings on Edge](edge://settings/content/pdfDocuments)
- [PDF Settings on Chrome](chrome://settings/content/pdfDocuments) 

