---
title: Importing Type Report Definitions
page_title: Importing reports created with the Visual Studio Report Designer
description: "Learn how to import type (CSharp or Visual Basic) report definitions from DLL files, created with the Visual Studio Report Designer."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer
tags: how,to,import,reports,created,with,the,vs,report,designer
published: True
position: 6
previous_url: /standalone-report-designer-import-clr-reports
---

# Importing reports created with the VS Report Designer

Should you need to import your existing reports created with the Visual Studio Report Designer to [Overview]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) supported format, follow the approaches outlined below:

## Import reports created with VS Report Designer using Standalone Designer

> Default constructor is required and due to XML format restrictions, custom code like properties, methods, and instantiated data objects will not be serialized along with the settings of the report.

> In general, Telerik Reports are *Telerik.Reporting.Report* objects which can be serialized in TRDX files, or compressed TRDP files. The XML definition has a schema version that is updated in case of API changes in the released reporting functionality. It is important to use a version of Standalone Report Designer that matches the version of Telerik Reporting assemblies used to create the.NET report definition. For more information, please refer to [XML Report Definition]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/xml-report-definition%}) (*XML Schema Versioning* section). This guarantees that you are using the same version of the Telerik Reporting engine to create and process reports.

1. (Optional) If the target report depends on external assemblies for event handlers, data sources, user functions, or custom aggregates, first you have to reference those assemblies in the configuration file. For more information see: [Extending Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
1. Open the Report Designer and click on __Open Report...__
1. In the Open dialog window, select __.NET Report Library__ from the file type combobox. The assembly(.DLL) file of the report library, when built, should be selected here. For example: `CSharp.ReportLibrary.dll`
1. Navigate to your existing.NET report library and click __Open__. The Import Report Wizard is started.
1. In the __Select Reports to Import__ step, you will see the reflected reports from your report library.
1. Select the reports you would like to import by checking the corresponding checkboxes right next to the reports and click __Next__.
1. In the __Output Settings__ step, you can specify the output location for the imported reports, their names, or a different location if you have more than one report.
1. Click Import. Once the import is done, you are presented with the __Import Summary__ step, which shows the result of the import and presents an import log. There is an option to open the imported reports in the standalone report designer once you click on __Finish__.

>tip As of __Q3 2024__, both the __Standalone Report Designer__ and the __Standalone Report Designer for .NET__ serialize report and item event handlers in the declarative report definitions during the import process. However, the source code of the event handlers is not embedded in the report definitions. This code resides in the original assembly that the declarative report definition is imported from. The code will be executed when the event handler is invoked by the Reporting engine. In order to load the assembly that contains the code and execute the code in the event handlers, the Report Designer needs to be [extended]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}), including the assembly that contains the event handlers in the Report Designer configuration file.

## Package the CLR report object manually

The report packaging is achieved with dedicated [ReportPackager](/api/Telerik.Reporting.ReportPackager). For detailed instructions, see [Report Packaging]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/package-report-definition%})

## Serialize the CLR report object manually (legacy)

The XML serialization is achieved through the dedicated [ReportXmlSerializer](/api/Telerik.Reporting.XmlSerialization.ReportXmlSerializer). For detailed instructions, see [Serializing Report Definition in XML]({%slug telerikreporting/using-reports-in-applications/program-the-report-definition/serialize-report-definition-in-xml%}).
