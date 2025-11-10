---
title: Referencing Report Definitions
page_title: Specifying the Report Definition to be Displayed in an Application
description: "Learn more about referencing the definition of your reports in applications when working with Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/reference-report-definitions-in-applications
previous_url: /using-reports-in-applications/reference-report-definitions-in-applications, /report-sources-report-engine-api
tags: telerik, reporting, embedding, reports, referencing, report, definitions, in, applications
published: True
position: 1
reportingArea: General
---

# Referencing Report Definitions in Applications

The article elaborates on how to specify which report definition to be used by the report engine when rendering the report in an application.

## Report Source

To specify and pass a report definition to the report engine it is required to use a wrapper in the form of a report source object. This wrapper contains information about how to fetch the report definition and what parameter values to use when the report is processed. It is important to know the different report source types and when/how to use them. Please refer to [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%}) for detailed information.

## Reference Reports in Report Viewers

The report viewer is a UI component which is used to specify a report definition via a report source, send the report source for processing and rendering to the report engine, and then display the rendered report document in the application. Depending on the application type the report viewer can be communicating with a remote report engine via a service, or directly with a report engine embedded in the same application as the report viewer control. Regardless of this, the report to be displayed is specified by setting a report source property of the report viewer.

When working with an embedded report engine, the report source property accepts objects of the [ReportSource](/api/Telerik.Reporting.ReportSource) type.

When working with a remote report engine via a service, the [ReportSource](/api/Telerik.Reporting.ReportSource) type might not be available, especially in client-server scenarios where the report engine is hosted in a different application. In such scenarios an intermediate report source has to be described (JSON object, custom C# type, etc). The service which is responsible for accessing the report engine will try to translate this intermediate report source to an actual [ReportSource](/api/Telerik.Reporting.ReportSource) object.

For more details and examples on the different report sources, please refer to [How to Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%}).

## Reference Reports in Report Processor

When the report engine is embedded in the current application (i.e. the *Telerik.Reporting* assembly is referenced) it is possible to use the Report Processor to manually render ([RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_)) or print ([PrintReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_PrintReport_Telerik_Reporting_ReportSource_System_Drawing_Printing_PrinterSettings_)) a report. For this purpose it is required to pass an argument of ReportSource type which uniquely identifies the report.

For this example we will use a TypeReportSource (section -1-). The TypeReportSource specifies the report by its [Assembly Qualified Name](https://learn.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?view=net-7.0). The Reporting Engine uses [Reflection](https://learn.microsoft.com/en-us/dotnet/api/system.reflection?view=net-7.0) to create an instance of the report class through its default parameterless constructor.

The examples with the UriReportSource (section -2-) that specifies the path to a declarative report definition (TRDP, TRDX or TRBP file) and the InstanceReportSource (section -3-) that passed a Report instance to the Reporting Engine are commented out in the snippets.

{{source=CodeSnippets\CS\API\Telerik\Reporting\Processing\ReportProcessorSnippets.cs region=Export_Single_Stream_Snippet}}
{{source=CodeSnippets\VB\API\Telerik\Reporting\Processing\ReportProcessorSnippets.vb region=Export_Single_Stream_Snippet}}


## See Also

* [Report Sources]({%slug telerikreporting/designing-reports/report-sources/overview%})
