---
title: Requirements
page_title: Requirements for Telerik Reporting REST Service ASP.NET Web API
description: "Learn what are the basic Requirements for using Telerik Reporting REST Service ASP.NET Web API in an Application."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/requirements
tags: requirements,rest,webapi,api,asp.net,application
published: True
reporting_area: RESTService
position: 1
previous_url: /telerik-reporting-rest-service-web-api-system-requirements,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/requirements
---

## Requirements for Using the Telerik Reporting REST WebAPI Service

1. Telerik Reports must be accessible by the application hosting the Reporting REST WebAPI service.
1. Telerik Reporting ASP.NET Web API service implementation requires the following ASP.NET and third-party assemblies.

	+ [Microsoft ASP.NET](https://learn.microsoft.com/en-us/aspnet/overview) 4.0
		+ System.Web.dll (4.0.0.0)
		+ System.Net.Http.dll (4.0.0.0)
		+ System.Net.Http.Formatting.dll (4.0.0.0)
	+ [Microsoft.AspNet.WebApi](https://www.nuget.org/packages/Microsoft.AspNet.WebApi/4.0.30506) 4.0.30506
		+ System.Web.Http.dll (4.0.0.0)
		+ System.Web.Http.WebHost.dll (4.0.0.0) required for hosting in IIS
		+ System.Web.Http.SelfHost.dll (4.0.0.0) required for SelHosting
	+ [Newtonsoft.Json.dll](https://www.newtonsoft.com/json) 13.0.0.0 (latest available via NuGet is recommended) You can use a newer WebAPI version by updating the corresponding (Microsoft.AspNet.WebApi.WebHost and Microsoft.AspNet.WebApi.SelfHost) NuGet packages and applying the following bindingRedirects to your application configuration file. Just replace 5.1.0.0 with the exact version:

		````XML
<?xml version="1.0" encoding="utf-8" ?>
		<configuration>
			<runtime>
				<assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
				  <dependentAssembly>
					<assemblyIdentity name="System.Web.Http" culture="neutral" publicKeyToken="31bf3856ad364e35"/>
					<bindingRedirect oldVersion="0.0.0.0-65535.65535.65535.65535" newVersion="5.1.0.0"/>
				  </dependentAssembly>
				  <dependentAssembly>
					<assemblyIdentity name="System.Net.Http.Formatting" culture="neutral" publicKeyToken="31bf3856ad364e35"/>
					<bindingRedirect oldVersion="0.0.0.0-65535.65535.65535.65535" newVersion="5.1.0.0"/>
				  </dependentAssembly>
				</assemblyBinding>
			</runtime>
		</configuration>
````


1. __*Optional assemblies*__:

	These assemblies add up to the __Telerik Reporting Engine__ functionality and should be used only if you need the specific feature. They are responsible for additional support formats or retrieving data from an OLAP cube. The assemblies must be deployed along with the application that hosts the __Telerik Reporting REST WebAPI Service__.

	+ XPS rendering extension requires __Telerik.Reporting.XpsRendering__ assembly (Telerik.Reporting.XpsRendering.dll).
	+ DOCX/PPTX/XLSX rendering extensions require __Telerik.Reporting.OpenXmlRendering.dll__ and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (_DocumentFormat.OpenXml.dll_ v.2.0.5022.0 or above with [proper binding redirect](https://learn.microsoft.com/en-us/dotnet/framework/configure-apps/file-schema/runtime/bindingredirect-element)).
	+ [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) requires __Telerik.Reporting.Adomd.dll__ and [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}) (_Microsoft.AnalysisServices.AdomdClient.dll_ v.10.0.0.0 or above with [proper binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%})).
