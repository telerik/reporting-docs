---
title: Telerik Reporting WCF Service Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/overview
tags: overview
published: True
position: 0
---

# Telerik Reporting WCF Service Overview



## Overview

Telerik Reporting WCF Service enables the           remote access to the  [ReportProcessor](/reporting/api/Telerik.Reporting.Processing.ReportProcessor) . The service           acts as a communication interface between the client programs and the reporting engine. The service is responsible for managing the reports state and resources.           

  ![](images/WCFService.png)

Telerik Reporting WCF Service exposes two contracts:

* The  [Telerik.Reporting.Service.IReportService](/reporting/api/Telerik.Reporting.Service.IReportService)                - meant for basic report operations, which can be used by client               viewer applications: render, page navigation, parameters etc.             

* The  [Telerik.Reporting.Service.IResourceService](/reporting/api/Telerik.Reporting.Service.IResourceService)                - all its exposed operations should be accessed through HTTP GET request only             

>warning The default  __Telerik Reporting WCF Service__  implementation uses ASP.NET Session in order to store various resources such as report pages             and images. When ran out of web context (e.g. self-hosted service), it uses internal session storage. To make your own implementation, create your own service class derived from  [ReportServiceBase](/reporting/api/Telerik.Reporting.Service.ReportServiceBase)              and override its  [GetState](/reporting/api/Telerik.Reporting.Service.ReportServiceBase#Telerik_Reporting_Service_ReportServiceBase_GetState_System_String_)  and  [SetState](/reporting/api/Telerik.Reporting.Service.ReportServiceBase#Telerik_Reporting_Service_ReportServiceBase_SetState_System_String_System_Object_)  methods.           


The service main purpose is to provide access for the Silverlight Report Viewer to the reporting engine. There are 3 methods of Telerik.Reporting.Service.IReportService that may be of interest to you:         

* __IList```<ReportInfo>```__  [Telerik.Reporting.Service.IReportService.ListAvailableReports](/reporting/api/Telerik.Reporting.Service.IReportService#Telerik_Reporting_Service_IReportService_ListAvailableReports)                - returns a list of all available for the report service hosting               application Report types. That is all types implementing the               The  [Telerik.Reporting.IReportDocument](/reporting/api/Telerik.Reporting.IReportDocument)                interface that are available for the application hosting the               report service.             

* __IList```<ExtensionInfo>```__  [Telerik.Reporting.Service.IReportService.ListRenderingExtensions](/reporting/api/Telerik.Reporting.Service.IReportService#Telerik_Reporting_Service_IReportService_ListRenderingExtensions)                - returns all rendering extensions available for the report service.             

*  [Telerik.Reporting.Service.IReportService.Render](/reporting/api/Telerik.Reporting.Service.IReportService#Telerik_Reporting_Service_IReportService_Render_System_String_System_String_Telerik_Reporting_Service_NameValueDictionary_Telerik_Reporting_Service_NameValueDictionary_) __(string format, string report, NameValueDictionary deviceInfo, NameValueDictionary parameters)__                - renders the specified __report__  (assembly               qualified type name) in the specified __format__                (see ListRenderingExtensions operation above), with the given               __[deviceInfo]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-export-formats/overview%})__                settings and __parameter values__ .             

## Deploying the service

The __Telerik Reporting WCF Service__  is a standard WCF service and is compatible with all hosted models described in the  [Hosting Services](http://msdn.microsoft.com/en-us/library/ms730158) .         

[Telerik Reporting configuration settings]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}) must be applied in the service project configuration file.

For more information on deploying a Silverlight application that utilizes Telerik Reporting, refer to [Deploying Silverlight Application]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/silverlight-application/deploying-silverlight-application%}) article.         

# See Also


 * [How to Add Telerik Reporting WCF Service to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-add-telerik-reporting-wcf-service-to-web-application%})

 * [How to Self Host the Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-self-host-the-service%})

 * [How to Enable SSL for Telerik Reporting WCF service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-enable-ssl-for-telerik-reporting-wcf-service%})

 * [How to Implement and use custom IReportResolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-wcf-service/how-to-implement-and-use-custom-ireportresolver%})
