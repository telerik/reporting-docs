---
title: Converting .cs Reports to .trdp Format in Telerik Reporting
description: Learn how to transition from .cs report files to the .trdp format in Telerik Reporting, enabling easier report management and distribution.
type: how-to
page_title: How to Convert CSharp Report Files to TRDP Format in Telerik Reporting
slug: convert-cs-reports-to-trdp-telerik-reporting
tags: reporting, convert, import, trdp, conversion, objectdatasource
res_type: kb
ticketid: 1669949
---

## Environment

| Version | Product | Author |  
| --- | --- | ---- |  
| 18.1.24.514| Telerik Reporting|[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

This tutorial shows how to convert Telerik.Reporting.Report objects created with the Visual Studio Report Designer to `.trdp` format for various reasons, such as ease of use or distribution. This KB article also answers the following questions:
- How can I manage .cs reports in the Standalone Report Designer?
- Is it possible to convert code-based reports to the TRDP format?
- What steps should I follow to transition from .cs report files to .trdp in Telerik Reporting?

## Solution

Let's start with a Class library project that contains the reports:

![Class Library with Reports](images/reports-class-library.png)   

The project targets .NET Framework 4.6.2:

![Target Framework](images/target-framework.png)    

>note For projects targeting .NET, it is necessary to use the Standalone Report Designer for .NET. 

To convert a `.cs` report to a `.trdp` report, use the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}). This tool allows for importing `.dll` files produced from projects containing `Telerik.Reporting.Report` objects, facilitating the conversion process.

### Steps for Conversion

1. **Compile the Project**: Ensure your project containing the `.cs` report files is compiled successfully, generating a `.dll` file which includes the `Telerik.Reporting.Report` objects.

1. Copy the produced dll (e.g. ProductCatalogLibrary.dll) and paste it next to the exe of the appropriate report designer considering the Target framework of the project:

    ![Same Folder](images/same-folder.png) 

1. **Open Standalone Report Designer**: Launch the Telerik [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}).

1. **Add an Assembly Reference** to the Standalone Report Designer: [Extending Report Designer to Recognize Custom Assemblies]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%}).

    ![Assembly Reference](images/assembly-reference.png)  

1. **Import the DLL**: From the Report Designer, select to import reports, and navigate to the `.dll` file produced by your project from the first step above. The Standalone Report Designer will launch the [Import Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/import-report-wizard%}) and will list all reports available in the `.dll` for import. Follow the wizard:

    ![Start Import Report Wizard](images/select-dll.png)   

    ![Select Reports to Convert](images/select-reports-to-convert.png)   
    
    ![Output Settings](images/output-settings.png)    

    ![Import Summary](images/import-summary.png)  

1. **Save as TRDP**: After successfully importing the `.cs` reports, save them in the `.trdp` format using the Standalone Report Designer's save functionality.

    ![Converted Report](images/converted-trdp-report.png)  

## See Also

- [Standalone Report Designer Overview]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})
- [How to Import Reports Created with the VS Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/how-to-import-reports-created-with-the-vs-report-designer%})
- [Extending Report Designer at a Glance]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/configuration/extending-report-designer%})
