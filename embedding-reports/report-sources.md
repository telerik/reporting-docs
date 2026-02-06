---
title: Report Sources
page_title: Report Sources at a Glance
description: "Learn what is a server-side ReportSource in the context of Telerik Reporting and how to use it to pass report definition and parameter values to the Reporting engine."
previous_url: /designing-reports/report-sources/overview, /report-sources, /report-sources-navigatetoreport
slug: telerikreporting/designing-reports/report-sources/overview
tags: telerik, reporting, embedding, reports, report, sources, overview
published: True
position: 2
reportingArea: General
---

# Report Sources Overview

The article provides information how to specify which report to be processed, and on the available option based on the report format (Visual Studio report or XML content).

## Purpose of Report Sources

Reports can be stored in different locations and in different formats so there should be a uniform way to access them. This is achieved through the various report sources that the Reporting engine provides.

The report sources are utilized by:

- The **report viewers** when specifying the source for a report to view. For more details check [How to: Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%}).
- The [SubReport item]({%slug telerikreporting/designing-reports/report-structure/subreport%}).
- For any report item that would use **drill-through** action ([NavigateToReport action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%})).
- When you render or print reports programmatically, through the `ReportProcessor` corresponding methods:

  - [RenderReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) - for exporting reports programmatically on the server-machine;
  - [PrintReport](/api/Telerik.Reporting.Processing.ReportProcessor#Telerik_Reporting_Processing_ReportProcessor_PrintReport_Telerik_Reporting_ReportSource_System_Drawing_Printing_PrinterSettings_) - for printing reports from the server machine.

  For more details, check [Set ReportSource for ReportProcessor]({%slug telerikreporting/using-reports-in-applications/reference-report-definitions-in-applications%}).

## Available Report Sources

- `UriReportSource` The URI report source allows you to load a report document, usually produced by the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) or the [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) from a physical TRDP, TRDX or TRBP file. The absolute or relative path to the physical file should be indicated in the `Uri` property.
  An example is illustrated in the API Reference: [UriReportSource](/api/Telerik.Reporting.UriReportSource).
- `TypeReportSource` The reports created with [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}) are usually stored as.NET classes inheriting _Telerik.Reporting.Report|ReportBook_. To access a.NET class declaratively you can use the [assembly qualified name](https://learn.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?view=net-7.0#System_Type_AssemblyQualifiedName) of the report's type. The Reporting engine will use [Reflection](<https://learn.microsoft.com/en-us/previous-versions/visualstudio/visual-studio-2012/ms173183(v=vs.110)>) to create an instance of the report class by using its default parameterless constructor.
  An example is illustrated in the API Reference: [TypeReportSource](/api/Telerik.Reporting.TypeReportSource).
- `InstanceReportSource` This report source is used when you have a reference to an already instantiated report (_Telerik.Reporting.Report_ instance), and you want to pass it to the reporting engine. Typical scenarios include reports created or modified in code, dynamically generated ReportBook objects or report instances result of [deserializing]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}) or [unpackaging]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%}) content produced by the Standalone Report Designer.
  An example is illustrated in the API Reference: [InstanceReportSource](/api/Telerik.Reporting.InstanceReportSource).

> note For reports created in Visual Studio Report Designer without further modifications in code, we recommend the usage of the TypeReportSource.

- `XmlReportSource` The XML report source can be used if the report is serialized in XML and stored in a string.The primary intent for this report source is to be used with database fields where the report is stored as pure XML. In order to access it set the Xml property of the report source to the field that contains the report xml. For example: xmlReportSource.Xml = "=Fields.ReportXml".
  An example is illustrated in the API Reference: [XmlReportSource](/api/Telerik.Reporting.XmlReportSource).

> note The created report source inherits `Telerik.Reporting.ReportSource`.

## Report Source Parameters

Report parameters values can be passed from the report source object. Each report source has a Parameters collection which determines the parameter values that are passed to the report when it is initialized. Please, note that the name of the parameter should match the names of the [Report Parameters]({%slug telerikreporting/designing-reports/connecting-to-data/report-parameters/overview%}) as the report source's Parameters collection is mapped by key to the report's ReportParameters collection.

> note The Report Source is not aware of the currently displayed report and its ReportParameters collection. To send a value from the report source object, you need to know the report parameter's key (Name).

## See Also

- [Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%})
- [Set ReportSource for ReportProcessor]({%slug telerikreporting/using-reports-in-applications/reference-report-definitions-in-applications%})
- [ReportSource](/api/Telerik.Reporting.ReportSource)
- [ReportProcessor](/api/Telerik.Reporting.Processing.ReportProcessor)
