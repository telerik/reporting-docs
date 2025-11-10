---
title: Deploying Silverlight Application
page_title: Deploying Silverlight Application 
description: Deploying Silverlight Application
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/deploying-silverlight-application
tags: deploying,silverlight,application
published: True
position: 5
previous_url: /installation-deploying-on-silverlight-application
reportingArea: General
---

# Deploying Silverlight Application

> The Silverlight Report Viewer and its WCF Reporting Service are no longer supported and deployed with the installation of Telerik Reporting. The last release of Telerik Reporting with included Silverlight Report Viewer is [R1 2023](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r1-2023-17-0-23-118).

The deployment of a Silverlight application that utilizes Telerik Reporting can be divided in three steps:

1. Deploying the __Silverlight report viewer__ : All referenced assemblies in the Silverlight application are embedded at compile time into the XAP file, which should be deployed along with the application that hosts the Silverlight application.
1. Deploying the __Telerik Reporting WCF Service__ : As the Silverlight report viewer uses the __Telerik Reporting WCF Service__ to access the __Telerik Reporting Engine__, you should deploy (__Telerik.Reporting.Service.dll__) with the application that hosts the WCF service.
1. Deploying the __Telerik Reporting Engine__ : The Reporting engine (__Telerik.Reporting.dll__) should be deployed along with the application that hosts the __Telerik Reporting WCF Service__.

__*Optional assemblies*__:

These assemblies add up to the __Telerik Reporting Engine__ functionality and should be used only if you need the specific feature. They are responsible for additional support formats, database cache or retrieving data from an OLAP cube. The asseblies must be deployed along with the application that hosts the __Telerik Reporting WCF Service__.

* XPS rendering extension requires __Telerik.Reporting.XpsRendering__ assembly (Telerik.Reporting.XpsRendering.dll).

* DOCX/PPTX/XLSX rendering extensions require __Telerik.Reporting.OpenXmlRendering.dll__ and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (_DocumentFormat.OpenXml.dll_ v.2.0.5022.0 or above with [binding redirect](http://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx)).

* [Database Cache Provider]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/other-reportviewer-controls/configuring-the-database-cache-provider%}) requires __Telerik.Reporting.Cache.Database.dll__ and __Telerik Data Access__.

* [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) requires __Telerik.Reporting.Adomd.dll__ and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (_Microsoft.AnalysisServices.AdomdClient.dll_ v.10.0.0.0 or above with [proper binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%})).

## See Also

* [Telerik Reporting WCF Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/overview%})
* [How to Add Telerik Reporting WCF Service to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-add-telerik-reporting-wcf-service-to-web-application%})
