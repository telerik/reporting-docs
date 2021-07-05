---
title: Exporting a report to PDF programmatically
description: Exporting a report to PDF programmatically. Export the report without going through the report viewer.
page_title: Exporting a report to PDF programmatically
type: how-to
slug: exporting-a-report-to-pdf-programmatically
tags: styling and formatting reports
res_type: kb
---
   
## DESCRIPTION

This article explains how to export a report to PDF without the need to go through the web viewer.

## SOLUTION

You can use the following code snippet to programmatically export the report into **PDF** format from a Web Site or Web Application project:  
   
````cs
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
````vb
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

