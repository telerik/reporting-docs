---
title: Embedded Report Engine
page_title: Embedded Report Engine | for Telerik Reporting Documentation
description: Embedded Report Engine
slug: telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine
tags: embedded,report,engine
published: True
position: 0
---

# Embedded Report Engine



## Requirements

To export a report, you can use the __[RenderReport](/reporting/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_)__  method of the  [ReportProcessor](/reporting/api/Telerik.Reporting.Processing.ReportProcessor)  class.           This method converts the contents of the report to a byte array in the specified format, which you can then use           with other classes such as            [MemoryStream](http://msdn.microsoft.com/en-us/library/system.io.memorystream.aspx)            or  [FileStream](http://msdn.microsoft.com/en-us/library/system.io.filestream.aspx)            .         

The  [RenderReport](/reporting/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_)            method has two overloads, the first is used when rendering a single stream, the second when rendering multiple streams. The           available extensions used as first argument of the  [RenderReport](/reporting/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_)            method are listed in the [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}) article.          

## Exporting a report to a single document format

Some formats (MHTML, PDF, XLS(X), RTF, DOCX, PPTX, CSV) produce a single document which is handled by the first overload of the            [RenderReport](/reporting/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) :         

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\ReportProcessorSnippets.cs region=Export_Single_Stream_Snippet}}
````C#
	
	            var reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();
	
	            // set any deviceInfo settings if necessary
	            var deviceInfo = new System.Collections.Hashtable();
	
	            // Depending on the report definition choose ONE of the following REPORT SOURCES
	            //                  -1-
	            // ***CLR (CSharp) report definitions***
	            var reportSource = new Telerik.Reporting.TypeReportSource();
	
	            // reportName is the Assembly Qualified Name of the report
	            reportSource.TypeName = reportName;
	            //                  -1-
	
	            ////                  -2-
	            //// ***Declarative (TRDP/TRDX) report definitions***
	            //var reportSource = new Telerik.Reporting.UriReportSource();
	
	            //// reportName is the path to the TRDP/TRDX file
	            //reportSource.Uri = reportName;
	            ////                  -2-
	
	            ////                  -3-
	            //// ***Instance of the report definition***
	            //var reportSource = new Telerik.Reporting.InstanceReportSource();
	
	            //// Report1 is the class of the report. It should inherit Telerik.Reporting.Report class
	            //reportSource.ReportDocument = new Report1();
	            ////                  -3-
	
	            // Pass parameter value with the Report Source if necessary
	            object parameterValue = "Some Parameter Value";
	            reportSource.Parameters.Add("ParameterName", parameterValue);
	
	            Telerik.Reporting.Processing.RenderingResult result = reportProcessor.RenderReport("PDF", reportSource, deviceInfo);
	
	            if (!result.HasErrors)
	            {
	                string fileName = result.DocumentName + "." + result.Extension;
	                string path = System.IO.Path.GetTempPath();
	                string filePath = System.IO.Path.Combine(path, fileName);
	
	                using (System.IO.FileStream fs = new System.IO.FileStream(filePath, System.IO.FileMode.Create))
	                {
	                    fs.Write(result.DocumentBytes, 0, result.DocumentBytes.Length);
	                }
	            }
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\ReportProcessorSnippets.vb region=Export_Single_Stream_Snippet}}
````VB
	
	        Dim reportProcessor As New Telerik.Reporting.Processing.ReportProcessor()
	
	        'set any deviceInfo settings if necessary
	        Dim deviceInfo As New System.Collections.Hashtable()
	
	        ' Depending on the report definition choose ONE of the following REPORT SOURCES
	        '                  -1-
	        ' ***CLR (VB) report definitions***
	        Dim reportSource As New Telerik.Reporting.TypeReportSource()
	
	        ' reportName is the Assembly Qualified Name of the report
	        reportSource.TypeName = reportName
	        '                  -1-
	
	        ''                  -2-
	        '' ***Declarative (TRDP/TRDX) report definitions***
	        'Dim reportSource As New Telerik.Reporting.UriReportSource()
	
	        '' reportName Is the path to the TRDP/TRDX file
	        'reportSource.Uri = reportName
	        ''                  -2-
	
	        ''                  -3-
	        '' ***Instance of the report definition***
	        'Dim reportSource As New Telerik.Reporting.InstanceReportSource()
	
	        '' Report1 Is the type of the report. It should inherit Telerik.Reporting.Report
	        'reportSource.ReportDocument = New Report1()
	        ''                  -3-
	
	        Dim parameterValue As Object = "Some Parameter Value"
	        reportSource.Parameters.Add("ParameterName", parameterValue)
	
	        Dim result As Telerik.Reporting.Processing.RenderingResult = reportProcessor.RenderReport("PDF", reportSource, deviceInfo)
	
	        If Not result.HasErrors Then
	            Dim fileName As String = result.DocumentName + "." + result.Extension
	            Dim path As String = System.IO.Path.GetTempPath()
	            Dim filePath As String = System.IO.Path.Combine(path, fileName)
	
	            Using fs As New System.IO.FileStream(filePath, System.IO.FileMode.Create)
	                fs.Write(result.DocumentBytes, 0, result.DocumentBytes.Length)
	            End Using
	        End If
	
````



>note When you export programmatically to  __XPS__ , you should use a separate STA thread which is             required by the underlying WPF UI elements that we use to create the XAML representation of the report.           


## Exporting a report to a multi document format

Some formats produce multiple files, for example HTML outputs all pages and related resources (images)           in separate streams. In order to render a report in a non-single document format (HTML and IMAGE except TIFF) one should use           the second  [RenderReport](/reporting/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_Telerik_Reporting_Processing_CreateStream_System_String__)            overload that accepts a  [CreateStream](/reporting/api/Telerik.Reporting.Processing.CreateStream)  callback. For this example we're going to render to JPEG, but you can           render a report in all graphic formats that GDI+ supports natively - this includes BMP, GIF, JPEG,           PNG, TIFF and metafile (EMF). The [Windows Forms Application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}) uses internally           metafile for rendering the reports for viewing, and           TIFF for exporting. The rest of the formats are available only through code using the ReportProcessor.Render method           where you should specify "IMAGE" as export format and the additional output format that is the actual graphic           format - BMP, GIF, JPEG. Here is an example that renders a report as a JPEG image:         

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\ReportProcessorSnippets.cs region=Export_CreateStream_Callback_Snippet}}
````C#
	
	        System.Collections.Generic.List<System.IO.Stream> streams =
	            new System.Collections.Generic.List<System.IO.Stream>();
	
	        public bool RenderReport(string reportName)
	        {
	            Telerik.Reporting.Processing.ReportProcessor reportProcessor = new Telerik.Reporting.Processing.ReportProcessor();
	
	            string documentName = "";
	
	            // specify the output format of the produced image.
	            var deviceInfo = new System.Collections.Hashtable();
	
	            deviceInfo["OutputFormat"] = "JPEG";
	
	            
	            // Depending on the report definition choose ONE of the following REPORT SOURCES
	            //                  -1-
	            // ***CLR (CSharp) report definitions***
	            var reportSource = new Telerik.Reporting.TypeReportSource();
	
	            // reportName is the Assembly Qualified Name of the report
	            reportSource.TypeName = reportName;
	            //                  -1-
	
	            ////                  -2-
	            //// ***Declarative (TRDP/TRDX) report definitions***
	            //var reportSource = new Telerik.Reporting.UriReportSource();
	
	            //// reportName is the path to the TRDP/TRDX file
	            //reportSource.Uri = reportName;
	            ////                  -2-
	
	            ////                  -3-
	            //// ***Instance of the report definition***
	            //var reportSource = new Telerik.Reporting.InstanceReportSource();
	
	            //// Report1 is the class of the report. It should inherit Telerik.Reporting.Report class
	            //reportSource.ReportDocument = new Report1();
	            ////                  -3-
	
	            // Pass parameter value with the Report Source if necessary
	            object parameterValue = "Some Parameter Value";
	            reportSource.Parameters.Add("ParameterName", parameterValue);
	
	            bool result = reportProcessor.RenderReport("IMAGE", reportSource, deviceInfo, this.CreateStream, out documentName);
	
	            this.CloseStreams();
	
	            return result;
	        }
	
	        void CloseStreams()
	        {
	            foreach (System.IO.Stream stream in this.streams)
	            {
	                stream.Close();
	            }
	            this.streams.Clear();
	        }
	
	        System.IO.Stream CreateStream(string name, string extension, System.Text.Encoding encoding, string mimeType)
	        {
	            string path = System.IO.Path.GetTempPath();
	            string filePath = System.IO.Path.Combine(path, name + "." + extension);
	
	            System.IO.FileStream fs = new System.IO.FileStream(filePath, System.IO.FileMode.Create);
	            this.streams.Add(fs);
	            return fs;
	        }
	
````
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\ReportProcessorSnippets.vb region=Export_CreateStream_Callback_Snippet}}
````VB
	
	    Dim streams As New System.Collections.Generic.List(Of System.IO.Stream)()
	
	    Public Function RenderReport(reportSource As ReportSource) As Boolean
	        Dim reportProcessor As New Telerik.Reporting.Processing.ReportProcessor()
	        Dim documentName As String = ""
	
	        'specify the output format of the produced image.
	        Dim deviceInfo As New System.Collections.Hashtable()
	        deviceInfo("OutputFormat") = "JPEG"
	
	        Dim result As Boolean = reportProcessor.RenderReport("IMAGE", reportSource, deviceInfo, AddressOf Me.CreateStream, documentName)
	        Me.CloseStreams()
	
	        Return result
	    End Function
	
	    Private Sub CloseStreams()
	        For Each stream As System.IO.Stream In Me.streams
	            stream.Close()
	        Next
	        Me.streams.Clear()
	    End Sub
	
	    Private Function CreateStream(name As String, extension As String, encoding As System.Text.Encoding, mimeType As String) As System.IO.Stream
	        Dim path As String = System.IO.Path.GetTempPath()
	        Dim filePath As String = System.IO.Path.Combine(path, name + "." + extension)
	
	        Dim fs As New System.IO.FileStream(filePath, System.IO.FileMode.Create)
	        Me.streams.Add(fs)
	        Return fs
	    End Function
	
````



# See Also
 * [RenderReport](/reporting/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) 
