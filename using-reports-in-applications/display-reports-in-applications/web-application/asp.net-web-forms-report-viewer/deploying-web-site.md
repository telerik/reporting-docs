---
title: Deploying Web Site
page_title: Deploying Web Site | for Telerik Reporting Documentation
description: Deploying Web Site
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/deploying-web-site
tags: deploying,web,site
published: True
position: 8
---

# Deploying Web Site



>note This is a legacy report viewer and for new projects our recommendation is to use the latest web forms report viewer -           [HTML5 Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%})


This article describes how to deploy Web Sites that use Telerik Reporting on a production server.

## 

During the installation of Telerik Reporting on your machine, the Telerik assemblies           were added to GAC. When deploying a Web Site project the assemblies from the GAC           are not copied automatically so you need to make sure the assemblies physically exist in the           __bin__  folder of your application.         

__Required assemblies:__ 

* __Telerik.Reporting.dll__ 

* __Telerik.ReportViewer.WebForms.dll__ 

__Optional assemblies:__ 

These assemblies add up to the core reporting functionality and should be used only if you need the specific feature.           They are responsible for additional support formats, database session, retrieving data from an OLAP cube or using the           Silverlight report viewer.         

* XPS rendering extension requires __Telerik.Reporting.XpsRendering__  assembly (Telerik.Reporting.XpsRendering.dll).             

* DOCX/PPTX/XLSX rendering extensions require __Telerik.Reporting.OpenXmlRendering.dll__                and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (*DocumentFormat.OpenXml.dll*                v.2.0.5022.0 or above with                [binding redirect](http://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx) ).             

* The Telerik Reporting WCF Service (if needed) requires               __Telerik.Reporting.Service__  assembly (Telerik.Reporting.Service.dll)             

* [Database Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%})               requires __Telerik.Reporting.Cache.Database.dll__  and __Telerik Data Access__ .             

* [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) requires               __Telerik.Reporting.Adomd.dll__  and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%})               (*Microsoft.AnalysisServices.AdomdClient.dll*  v.10.0.0.0 or [above with proper binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%})).             

# See Also

