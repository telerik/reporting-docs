---
title: How to import reports created with Standalone Report Designer
page_title: How to import reports created with Standalone Report Designer | for Telerik Reporting Documentation
description: How to import reports created with Standalone Report Designer
slug: telerikreporting/designing-reports/report-designer-tools/desktop-designers/visual-studio-report-designer/how-to-import-reports-created-with-standalone-report-designer
tags: how,to,import,reports,created,with,standalone,report,designer
published: True
position: 1
---

# How to import reports created with Standalone Report Designer



Should you need to import your existing reports created with the [Standalone Report Designer]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})         our recommendation is to use the TRDX|TRDP converter available in the [Import Report Wizard]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/tools/report-wizards/import-report-wizard%}).       

The result will be a class inheriting *Telerik.Reporting.Report* , that can be loaded in Visual Studio Report Designer.       

>important In general, Telerik Reports are  *Telerik.Reporting.Report*  objects which can be serialized in TRDX files, or compressed TRDP files.           The XML definition has a schema version that is updated in case of API changes in the released reporting functionality.           It is important to use a version of Standalone Report Designer that matches the version of Telerik Reporting assemblies used to create the .NET report definition.           For more information, please refer to [XML Report Definition]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/xml-report-definition%}) ( *XML Schema Versioning*  section).           This guarantees that you are using the same version of Telerik Reporting engine to create and process reports.         


# See Also


 * [Report Designers]({%slug telerikreporting/designing-reports/report-designer-tools/overview%})
