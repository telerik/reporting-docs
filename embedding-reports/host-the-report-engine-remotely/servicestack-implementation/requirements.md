---
title: Requirements
page_title: Reporting REST ServiceStack service Requirements
description: "Learn what are the Basic Requirements for hosting the Telerik Reporting REST ServiceStack Service in an Application."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/requirements
tags: requirements
published: True
reporting_area: RESTService
position: 1
previous_url: /telerik-reporting-rest-service-service-stack-system-requirements,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/servicestack-implementation/requirements
---

# Requirements for Embedding the Telerik Reporting REST ServiceStack Service in an Application

1. Telerik Reports must be accessible by the application hosting the Reporting REST ServiceStack service.
1. Telerik Reporting ASP.NET ServiceStack service implementation requires the following ASP.NET and third party assemblies.

	+ [Microsoft ASP.NET](https://dotnet.microsoft.com/en-us/apps/aspnet) 4.0
	+ System.Web.dll (4.0.0.0)
	+ [ServiceStack](https://servicestack.net/) V3 (3.9.70.0)
	+ [Newtonsoft.Json.dll](https://www.newtonsoft.com/json) 4.5.1.0 (latest available via NuGet is recommended)

1. (_Optional_) These assemblies add up to the __Telerik Reporting Engine__ functionality and should be used only if you need the specific feature. They are responsible for additional support formats or retrieving data from an OLAP cube. The asseblies must be deployed along with the application that hosts the __Telerik Reporting REST ServiceStack Service__.

	+ XPS rendering extension requires __Telerik.Reporting.XpsRendering__ assembly (Telerik.Reporting.XpsRendering.dll).
	+ DOCX/PPTX/XLSX rendering extensions require __Telerik.Reporting.OpenXmlRendering.dll__ and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (_DocumentFormat.OpenXml.dll_ v.2.0.5022.0 or above with [proper binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element).
	+ [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) requires __Telerik.Reporting.Adomd.dll__ and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (*Microsoft.AnalysisServices.AdomdClient.dll* v.10.0.0.0 or [above with proper binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%})).

> The __Telerik Reporting ServiceStack REST Service__ should be the only ServiceStack based Web Service in a project, as all ServiceStack services have [a single AppHost per AppDomain](https://docs.servicestack.net/modularizing-services).
