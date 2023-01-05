---
title: How do I display PDF directly in the browser without exporting first?
description: This article describes how to display a PDF directly in the browser without exporting first.
type: troubleshooting
page_title: How do I display PDF directly in the browser without exporting first?
slug: how-do-i-display-pdf-directly-in-the-browser-without-exporting-first
position: 
tags: PDFRendering
ticketid: 
res_type: kb
---

## Environment
<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting </td>
	</tr>
</table>

## Description
Do you want to create a PDF and open it directly within a webform? 

## Solution
Use the [ReportProcessor.RenderReport](/api/telerik.reporting.processing.reportprocessor#collapsible-Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) method to create a stream of bytes and write those bytes to the ASP.NET Response object. 

1. Reference the reporting engine in your web application by adding reference to the *Telerik.Reporting.dll* assembly.

2. Create *ExportToPDF()* method (see code example below) to your application.

3. Call the *ExportToPDF()* method. For example you might call this within a button click event handler:

  **CSharp**
  ```CSharp
  void ExportToPDF(string reportToExport)
  {
      var reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();
      var typeReportSource = new Telerik.Reporting.TypeReportSource();

      // reportToExport is the Assembly Qualified Name of the report
      typeReportSource.TypeName = reportToExport;

      var result = reportProcessor.RenderReport("PDF", typeReportSource, null);

      this.Response.Clear();
      this.Response.ContentType = result.MimeType;
      this.Response.Cache.SetCacheability(HttpCacheability.Private);
      this.Response.Expires = -1;
      this.Response.Buffer = true;

      /* Uncomment to handle the file as attachment
       Response.AddHeader("Content-Disposition",
                      string.Format("{0};FileName=\"{1}\"",
                                      "attachment",
                                      fileName));
       */

      this.Response.BinaryWrite(result.DocumentBytes);
      this.Response.End();
  }
  ```
  
  **VB**
  ```VB
  Sub ExportToPDF(ByVal reportToExport As String)
    Dim reportProcessor As New Telerik.Reporting.Processing.ReportProcessor()
    Dim typeReportSource As New Telerik.Reporting.TypeReportSource()

    ' reportToExport is the Assembly Qualified Name of the report
    typeReportSource.TypeName = reportToExport

    Dim result As Telerik.Reporting.Processing.RenderingResult = reportProcessor.RenderReport("PDF", typeReportSource, Nothing)

    Response.Clear()
    Response.ContentType = result.MimeType
    Response.Cache.SetCacheability(HttpCacheability.Private)
    Response.Expires = -1
    Response.Buffer = True
    'Uncomment to handle the file as attachment
    'Response.AddHeader("Content-Disposition", String.Format("{0};FileName=""{1}""", "attachment", fileName))
    Response.BinaryWrite(result.DocumentBytes)
    Response.End()
  End Sub
  ```
