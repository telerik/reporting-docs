---
title: Deploying Web Applications
page_title: Deploying Web Applications with ASP.NET WebForms Report Viewer
description: "Learn what are the required and optional assemblies for deploying Web Application with embedded ASP.NET WebForms Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/deploying-web-applications
tags: deploying,web,applications
published: True
position: 7
previous_url: /installation-deploying-on-web-application
---

# Deploying Web Application Projects

> This is a legacy report viewer and for new projects our recommendation is to use the latest WebForms Report Viewer - [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})

This article describes how to deploy Web Applications that use Telerik Reporting on a production server.

During the installation of Telerik Reporting on your machine, the Telerik assemblies were added to [`GAC`](https://learn.microsoft.com/en-us/dotnet/framework/app-domains/gac). When deploying a Web Application project the assemblies from the GAC are not copied automatically so you need to make sure the assemblies physically exist in the __bin__ folder of your application. 

__Required assemblies:__

* `Telerik.Reporting.dll`
* `Telerik.ReportViewer.WebForms.dll`

__Optional assemblies:__

These assemblies add up to the core reporting functionality and should be used only if you need the specific feature. They are responsible for additional support formats, database session, or retrieving data from an OLAP cube.

* XPS rendering extension requires the __Telerik.Reporting.XpsRendering__ assembly (`Telerik.Reporting.XpsRendering.dll`).
* DOCX/PPTX/XLSX rendering extensions require `Telerik.Reporting.OpenXmlRendering.dll` and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (`DocumentFormat.OpenXml.dll v.2.0.5022.0` or above with [binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element?redirectedfrom=MSDN).
* [Database Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%}) requires `Telerik.Reporting.Cache.Database.dll` and `Telerik Data Access`.
* [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) requires `Telerik.Reporting.Adomd.dll` and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (`Microsoft.AnalysisServices.AdomdClient.dll v.10.0.0.0` or above with proper [binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%})).
