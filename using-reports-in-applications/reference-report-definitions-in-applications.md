---
title: Reference Report Definitions in Applications
page_title: Reference Report Definitions in Applications | for Telerik Reporting Documentation
description: Reference Report Definitions in Applications
slug: telerikreporting/using-reports-in-applications/reference-report-definitions-in-applications
tags: reference,report,definitions,in,applications
published: True
position: 1
---

# Reference Report Definitions in Applications



The article elaborates on how to specify which report definition to be used by the report engine when rendering the report in an application.       

## Report Source

To specify and pass a report definition to the report engine it is required to use a wrapper in the form of a           report source object. This wrapper contains information about how to fetch the           report definition and what parameter values to use when the report is processed.           It is important to know the different report source types and when/how to use them. Please refer to           [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}) for detailed information.         

## Reference Reports in Report Viewers

The report viewer is a UI component which is used to specify a report definition via a report source, send the report source for processing           and rendering to the report engine, and then display the rendered report document in the application.           Depending on the application type the report viewer can be communicating with a remote report engine via a service, or directly with a           report engine embedded in the same application as the report viewer control. Regardless of this, the report to be displayed           is specified by setting a report source property of the report viewer.         

When working with an embedded report engine, the report source property accepts objects of the            [ReportSource](/reporting/api/Telerik.Reporting.ReportSource)  type.         

When working with a remote report engine via a service, the            [ReportSource](/reporting/api/Telerik.Reporting.ReportSource)            type might not be available, especially in client-server scenarios where the report engine is hosted in a different application.           In such scenarios an intermediate report source has to be described (JSON object, custom C# type, etc.).           The service which is responsible for accessing the report engine will try to translate this intermediate report source to an actual            [ReportSource](/reporting/api/Telerik.Reporting.ReportSource)  object.         

For more details and examples on the different report sources, please refer to           [How to Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%}).         

## Reference Reports in Report Processor

When the report engine is embedded in the current application (i.e. the *Telerik.Reporting*  assembly is referenced)           it is possible to use the Report Processor to manually render           ( [RenderReport](/reporting/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) )           or print           ( [PrintReport](/reporting/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_PrintReport_Telerik_Reporting_ReportSource_System_Drawing_Printing_PrinterSettings_) )           a report. For this purpose it is required to pass an argument of ReportSource type which uniquely identifies the report.         

For this example we will use a TypeReportSource. The TypeReportSource specifies the report by its  [Assembly Qualified Name](https://docs.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname) . The Reporting Engine uses  [Reflection](https://docs.microsoft.com/en-us/dotnet/api/system.reflection)  to create an instance of the report class through its default parameterless constructor.         

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



# See Also


 * [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
