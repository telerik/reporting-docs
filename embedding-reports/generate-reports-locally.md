---
title: Generating Reports Locally
page_title: Generating Reports Programmatically
description: "Learn how to locally generate reports by using the embedded report engine when working with Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine
previous_url: /using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine, /programmatic-exporting-report
tags: telerik, reporting, embedding, reports, embedded, engine, generate, locally
published: True
position: 4
reportingArea: General
---

# Generating Reports Locally with Code

Telerik Reporting allows you to use the embedded report engine and generate your reports locally.

## Requirements

To export a report, you can use the __[RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_)__ method of the [ReportProcessor](/api/Telerik.Reporting.Processing.ReportProcessor) class. This method converts the contents of the report to a byte array in the specified format, which you can then use with other classes such as [MemoryStream](https://learn.microsoft.com/en-us/dotnet/api/system.io.memorystream?view=net-7.0) or [FileStream](https://learn.microsoft.com/en-us/dotnet/api/system.io.filestream?view=net-7.0).

The [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) method has two overloads, the first is used when rendering a single stream, the second when rendering multiple streams. The available extensions used as first argument of the [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) method are listed in the [Export Formats]({%slug telerikreporting/using-reports-in-applications/export-and-configure/export-formats%}) article.

## Exporting a report to a single document format

Some formats (MHTML, PDF, XLS(X), RTF, DOCX, PPTX, CSV) produce a single document which is handled by the first overload of the [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_):

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\ReportProcessorSnippets.cs region=Export_Single_Stream_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\ReportProcessorSnippets.vb region=Export_Single_Stream_Snippet}}

>note When you export programmatically to __XPS__, you should use a separate STA thread which is required by the underlying WPF UI elements that we use to create the XAML representation of the report.

## Exporting a report to a multi document format

Some formats produce multiple files, for example HTML outputs all pages and related resources (images) in separate streams. In order to render a report in a non-single document format (HTML and IMAGE except TIFF) one should use the second [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_Telerik_Reporting_Processing_CreateStream_System_String__) overload that accepts a [CreateStream](/api/Telerik.Reporting.Processing.CreateStream) callback.

> When exporting a [ReportBook]({%slug telerikreporting/designing-reports/report-book/overview%}) with the ReportProcessor in TIFF format you have to use the multi document format.

For this example we're going to render to JPEG, but you can render a report in all graphic formats that GDI+ supports natively - this includes BMP, GIF, JPEG, PNG, TIFF and metafile (EMF). The [Windows Forms Application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/overview%}) uses internally metafile for rendering the reports for viewing, and TIFF for exporting. The rest of the formats are available only through code using the ReportProcessor.Render method where you should specify "IMAGE" as export format and the additional output format that is the actual graphic format - BMP, GIF, JPEG. Here is an example that renders a report as a JPEG image:

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\ReportProcessorSnippets.cs region=Export_CreateStream_Callback_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\ReportProcessorSnippets.vb region=Export_CreateStream_Callback_Snippet}}


## See Also

* [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_)
