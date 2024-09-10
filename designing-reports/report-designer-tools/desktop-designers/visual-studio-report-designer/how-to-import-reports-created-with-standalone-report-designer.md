---
title: Importing Declarative Report Definitions
page_title: Importing Declarative Reports created with Standalone or Web Designer
description: "Learn how to use the Import Report Wizard Visual Studio item template to turn TRDP and TRDX reports into type reports that can be designed with the Visual Studio Report Designer."
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/how-to-import-reports-created-with-standalone-report-designer
tags: how,to,import,reports,created,with,standalone,report,designer,trdp,trdx
published: True
position: 1
previous_url: /how-to-import-reports-created-with-standalone-report-designer
---

# Importing Reports Created with the Standalone or Web Report Designer

Should you need to import your existing reports created with the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%}) or [Web Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview%}) our recommendation is to use the TRDX|TRDP converter available in the [Import Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/import-report-wizard%}).

The Names of Report Items, Sections, Groups, and Components are converted to Report properties during conversion to CS/VB type. For that reason they must comply with the [C# identifier naming rules and conventions](https://learn.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/identifier-names). The failure to meet these name requirements will result in an error like "Identifier '_ItemName_' is not valid".

The Standalone and Web Report Designers allow report item names to contain special symbols, like spaces, that may not be valid in C# names. You must ensure the Names of Report Items, Sections, Groups, and Components contain only allowed characters to avoid conversion problems.

The result will be a class inheriting `Telerik.Reporting.Report`, that can be loaded in [Visual Studio Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/overview%}).

> In general, Telerik Reports are `Telerik.Reporting.Report` objects that can be serialized in `TRDX` files, or compressed `TRDP` files. The XML definition has a schema version that is updated in case of API changes in the released reporting functionality. It is important to use a version of Standalone Report Designer that matches the version of Telerik Reporting assemblies used to create the .NET report definition. For more information, please refer to [XML Report Definition]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/xml-report-definition%}) (*XML Schema Versioning* section). This guarantees that you are using the same version of the Telerik Reporting engine to create and process reports.

## See Also

* [Report Designer Tools]({%slug telerikreporting/designing-reports/report-designer-tools/overview%})
