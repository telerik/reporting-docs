---
title: Deploying
page_title: Deploying Windows Forms Applications Explained
description: "Find out more about deploying Windows Forms applications that use Telerik Reporting. Learn what the required and optional assemblies are."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/deploying-windows-forms-applications
tags: deploying, windows, forms, applications
published: True
reporting_area: WinForms
position: 5
previous_url: /installation-deploying-on-windows-forms
---

# Deploying Windows Forms Applications

This article describes how to deploy Windows Forms Application that use Telerik Reporting.

During the installation of Telerik Reporting on your machine, the Telerik assemblies were added to GAC. When deploying a Windows Forms Application project the assemblies from the GAC are not copied automatically so you need to make sure the assemblies physically exist in the bin folder of your application:

__Required assemblies:__

* __Telerik.Reporting.dll__
* __Telerik.ReportViewer.WinForms.dll__

__*Optional assemblies*__:

These assemblies add up to the core reporting functionality and should be used only if you need the specific feature. They are responsible for additional support formats, database session or retrieving data from an OLAP cube.

* XPS rendering extension requires __Telerik.Reporting.XpsRendering__ assembly (Telerik.Reporting.XpsRendering.dll)
* DOCX/PPTX/XLSX rendering extensions require __Telerik.Reporting.OpenXmlRendering.dll__ and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (_DocumentFormat.OpenXml.dll_ v.2.0.5022.0 or above with [binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element))
* [Database Session State Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%}) requires __Telerik.Reporting.Cache.Database.dll__ and __Telerik Data Access__
* [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) requires __Telerik.Reporting.Adomd.dll__ and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (_Microsoft.AnalysisServices.AdomdClient.dll_ v.10.0.0.0 or above with [proper binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%}))
