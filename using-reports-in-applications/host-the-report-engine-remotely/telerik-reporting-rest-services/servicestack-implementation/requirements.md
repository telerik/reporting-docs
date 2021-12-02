---
title: Requirements
page_title: Requirements | for Telerik Reporting Documentation
description: Requirements
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/requirements
tags: requirements
published: True
position: 1
---

# Requirements



Requirements for using __Telerik Reporting REST ServiceStack service__  in an application.       

## 

1. Telerik Reports must be accessible by the application hosting the Reporting REST ServiceStack service.             

1. Telerik Reporting ASP.NET ServiceStack service implementation requires               the following ASP.NET and third party assemblies.             

   +  [Microsoft ASP.NET ](http://www.asp.net/)                    4.0                 

   + System.Web.dll (4.0.0.0)                     

   +  [                       ServiceStack                     ](                       https://servicestack.net/                     )                    V3 (3.9.70.0)                 

   +  [                       Newtonsoft.Json.dll                     ](                       http://json.codeplex.com/                     )                    4.5.1.0 (latest available via NuGet is recommended)                 

1. Optional:             These assemblies add up to the __Telerik Reporting Engine__  functionality and should be used only if you need the specific feature.               They are responsible for additional support formats or retrieving data from an OLAP cube. The asseblies must be deployed along with the               application that hosts the __Telerik Reporting REST ServiceStack Service__ .             

   + XPS rendering extension requires __Telerik.Reporting.XpsRendering__  assembly (Telerik.Reporting.XpsRendering.dll).                 

   + DOCX/PPTX/XLSX rendering extensions require __Telerik.Reporting.OpenXmlRendering.dll__                    and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (*DocumentFormat.OpenXml.dll*  v.2.0.5022.0 or above with proper  [binding redirect](http://msdn.microsoft.com/en-us/library/eftw1fys(v=vs.110).aspx) ).                 

   + [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) requires                   __Telerik.Reporting.Adomd.dll__  and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%})                   (*Microsoft.AnalysisServices.AdomdClient.dll*  v.10.0.0.0 or [above with proper binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%})).                 

>note The  __Telerik Reporting ServiceStack REST Service__  should be the only ServiceStack based Web Service in a project, as all ServiceStack services have  [a single AppHost per AppDomain](                 http://mono.servicestack.net/ServiceStack.Hello/#AppHost               ) .           


# See Also

