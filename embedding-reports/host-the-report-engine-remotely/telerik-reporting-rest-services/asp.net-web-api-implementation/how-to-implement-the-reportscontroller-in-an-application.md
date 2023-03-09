---
title: ReportsController in ASP.NET
page_title: Implementing the ReportsController in an ASP.NET Application Explained
description: "Learn how to implement the ReportsController of the Telerik Reporting REST Service in an ASP.NET application."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-implement-the-reportscontroller-in-an-application
tags: how,to,implement,the,reportscontroller,in,an,application
published: True
position: 4
previous_url: /telerik-reporting-rest-implementing-http-service
---

# Implementing the ReportsController in an ASP.NET Application

The Telerik Reporting REST Web API service is represented by the abstract [ReportsControllerBase](/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase) class. This abstract class requires  [IReportSourceResolver](/api/Telerik.Reporting.Services.IReportSourceResolver) and [IStorage](/api/Telerik.Reporting.Cache.Interfaces.IStorage) implementations. In order to add the reports controller to your application follow the steps:

1. Add references to the following Telerik Reporting assemblies (required) and set their __Copy Local__ properties to true in Visual Studio:

	+ Telerik.Reporting
	+ Telerik.Reporting.Services.WebApi (located in the installation Bin folder)

1. Add references to the following Telerik Reporting assemblies (optional) and set their __Copy Local__ properties to true in Visual Studio:

	+ Telerik.Reporting.Cache.Database.dll - only if [DatabaseStorage](/api/Telerik.Reporting.Cache.Database.DatabaseStorage) caching mechanism is intended. For more details check [Reporting REST Service Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}). The assembly has dependencies on Telerik Data Access which can be checked in the version corresponding [Upgrade article]({%slug telerikreporting/upgrade/overview%});
	+ Telerik.Reporting.OpenXmlRendering - depends on [Third-Party Dependencies]({%slug telerikreporting/using-reports-in-applications/third-party-dependencies%}). Required if you need to export in OpenXML formats (DOCX, PPTX, XLSX);
	+ Telerik.Reporting.XpsRendering - required if you need to export in XPS format;
	+ Telerik.Reporting.Adomd.dll - required if you use [CubeDataSource]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/overview%}) components in reports. The assembly has dependencies on *Microsoft.AnalysisServices.AdomdClient.dll* v.10.0.0.0 or [above with proper binding redirects]({%slug telerikreporting/designing-reports/connecting-to-data/data-source-components/cubedatasource-component/configuring-your-project-for-using-microsoft-analysis-services%});

	>Without setting Telerik Reporting references' _Copy Local_ to true the assemblies may not be loaded correctly on running the application.

1. Inherit this base class in your hosting application (usually in the Controllers folder of a MVC application).

	+ __ReportsControllerBase configuration in code:__

		Set the [ReportServiceConfiguration](/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_ReportServiceConfiguration) property. The __ReportSourceResolver__ and __Storage__ configuration settings are required. See the [IReportServiceConfiguration](/api/Telerik.Reporting.Services.IReportServiceConfiguration) interface for more details.

		{{source=CodeSnippets\MvcCS\Controllers\ReportsController.cs region=ReportsControllerImplementation}}
		{{source=CodeSnippets\MvcVB\Controllers\ReportsController.vb region=ReportsControllerImplementation}}

		[ReportsControllerBase](/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase) inherits [System.Web.Http.ApiController](http://msdn.microsoft.com/en-us/library/system.web.http.apicontroller.aspx) and implements all necessary API actions. The provided sample implementation will resolve.trdx|.trdp report definitions from the Reports subfolder of the hosting ASP.NET application root. Other option is to reference a reports library and provide report [type assembly qualified name](http://msdn.microsoft.com/en-us/library/system.type.assemblyqualifiedname.aspx) from the service clients.

		>note Do not forget to add all necessary (i.e., referred from the report definitions) connection strings to the application configuration file.

		>The above implementation uses the [FileStorage](/api/Telerik.Reporting.Cache.File.FileStorage) method in order to create a storage object instance. All Visual Studio item templates for adding the Reporting REST service use the default __FileStorage__ constructor. The second overload of the FileStorage constructor allows you to specify a folder, and it is recommended for usage in production environment.

	+ __ReportsControllerBase configuration in configuration file:__

		To configure the Telerik Reporting REST service from the application configuration file, set the value of the [ReportServiceConfiguration](/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_ReportServiceConfiguration) property to an instance of the [ConfigSectionReportServiceConfiguration](/api/Telerik.Reporting.Services.ConfigSectionReportServiceConfiguration) class.

		{{source=CodeSnippets\MvcCS\Controllers\ReportsControllerConfigSection.cs region=ReportsControllerConfigSectionImplementation}}
		{{source=CodeSnippets\MvcVB\Controllers\ReportsControllerConfigSection.vb region=ReportsControllerConfigSectionImplementation}}


		Then add the __restReportService__ configuration element containing the service settings to the [Telerik Reporting Configuration Section]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/overview%}).

		{{source=CodeSnippets\MvcCS\ReportServiceConfigurationSnippets\ConfigSectionConfiguration.xml}}


		For more information see [restReportService Element]({%slug telerikreporting/using-reports-in-applications/export-and-configure/configure-the-report-engine/restreportservice-element%}).
