---
title: Implementing a Custom ReportSource Resolver
page_title: Implementing a Custom ReportSource Resolver Explained with Example
description: "Learn how to Implement a Custom ReportSource Resolver for the Telerik Reporting REST Service and how to chaing it with other resolvers through the fallback mechanism."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver
tags: how,to,implement,a,custom,report,source,resolver
published: True
position: 1
previous_url: /telerik-reporting-rest-custom-report-resolver,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver
---

# Steps for Implementing a Custom ReportSource Resolver

This article explains how to create a custom report source resolver for the __Telerik Reporting REST service__. In this example, the resolver purpose will be to return a [XmlReportSource](/api/Telerik.Reporting.XmlReportSource) with an XML report definition obtained from an SQL Server database.

1. Create a class which implements the  [IReportSourceResolver](/api/Telerik.Reporting.Services.IReportSourceResolver) interface. Its [Resolve](/api/Telerik.Reporting.Services.IReportSourceResolver#Telerik_Reporting_Services_IReportSourceResolver_Resolve_System_String_Telerik_Reporting_Services_OperationOrigin_System_Collections_Generic_IDictionary{System_String_System_Object}_) method will be called whenever the engine needs to create a [ReportSource](/api/Telerik.Reporting.ReportSource) instance based on the parameter named *report*. The value of the *report* parameter will be initialized with the value of the __Report__ property of the report viewer's ReportSource object.

	{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportResolver_Implementation}}
	{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportResolver_Implementation}}


1. Find the `ReportSourceResolver` property of the [ReportServiceConfiguration](/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_ReportServiceConfiguration), and set it to an instance of the custom report source resolver or to a chain of resolver instances including the custom one:

	* In `.NET Framework` the property is in the implementation of the [ReportsControllerBase](/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase) class

		{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportResolver_ReportsController_Implementation}}
		{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportResolver_ReportsController_Implementation}}


	* In `.NET` and `.NET Core` the `ReportServiceConfiguration` is usually added as a Singleton in the DI Container in the starting point of the application:

		````C#
// Configure dependencies for ReportsController.
		builder.Services.TryAddSingleton<IReportServiceConfiguration>(sp =>
			new ReportServiceConfiguration
			{
				// The default ReportingEngineConfiguration will be initialized from appsettings.json or appsettings.{EnvironmentName}.json:
				ReportingEngineConfiguration = sp.GetService<IConfiguration>(),

				HostAppId = "ReportingNet6",
				Storage = new FileStorage(),
				ReportSourceResolver = new TypeReportSourceResolver()
					.AddFallbackResolver(new UriReportSourceResolver(reportsPath)
						.AddFallbackResolver(new CustomReportSourceResolver()));
			});
````


1. Request the report from the HTML5 Report Viewer on the client:

	````JavaScript
<script type="text/javascript">
		$(document).ready(function () {
				$("#reportViewer1").telerik_ReportViewer({
					serviceUrl: "api/reports/",
					reportSource: { report: 1 }
			});
		});
	</script>
````


1. To create the database use the following script:

	````SQL
USE [master]
	GO
	CREATE DATABASE [Reports]
	CONTAINMENT = NONE
	ON PRIMARY
	(NAME = N'Reports', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Reports.mdf', SIZE = 4096KB, MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB)
	LOG ON
	(NAME = N'Reports_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Reports_log.ldf', SIZE = 1024KB, MAXSIZE = 2048GB, FILEGROWTH = 10%)
	GO
	USE [Reports]
	GO
	CREATE TABLE [dbo].[Reports](
	[ID] [int] NOT NULL,
	[Definition] [nvarchar](max) NOT NULL
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	GO
````


1. To enter some data into the database you can manually edit the __Reports__ table. XML report definitions can be obtained from the sample __.trdx__ report files installed together with the product and are located in __[Telerik_Reporting_Install_Dir]\Report Designer\Examples__. In newer versions, all sample reports of the Standalone Report Designer are in TRDP format. You can use the *Standalone Report Designer - File - Save As* option to convert them to TRDX files.

## How to implement and use custom IReportSourceResolver with fallback mechanism:

1. Add to your IReportSourceResolver implementation a constructor with parameter IReportSourceResolver parentResolver. Then use the parentResolver if the custom report source resolving mechanism fails.

	{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportSourceResolverFallBack_Implementation}}
	{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportSourceResolverFallBack_Implementation}}

1. Add to the `ReportServiceConfiguration` the `IReportSourceResolver` implementations in a chain. Thus the custom one will be executed first, if it fails the second one and so on.

	* In `.NET Framework` the `ReportServiceConfiguration` is configured in the implementation of the [ReportsControllerBase](/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase) class

		{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomResolverWithFallback_ReportsController_Implementation}}
		{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomResolverWithFallback_ReportsController_Implementation}}


	* In `.NET` and `.NET Core` the `ReportServiceConfiguration` is usually added as a Singleton in the DI Container in the starting point of the application:

		````C#
// Configure dependencies for ReportsController.
		builder.Services.TryAddSingleton<IReportServiceConfiguration>(sp =>
			new ReportServiceConfiguration
			{
				// The default ReportingEngineConfiguration will be initialized from appsettings.json or appsettings.{EnvironmentName}.json:
				ReportingEngineConfiguration = sp.GetService<IConfiguration>(),

				HostAppId = "ReportingNet6",
				Storage = new FileStorage(),
				ReportSourceResolver = new CustomReportSourceResolverWithFallBack(new TypeReportSourceResolver()
					.AddFallbackResolver(new UriReportSourceResolver(reportsPath)));
			});
````


	You can use for fallback the default IReportSourceResolver implementations:

	+ TypeReportSourceResolver - Resolves IReportDocument from Assembly Qualified Name of a Report or ReportBook class
	+ UriReportSourceResolver - Resolves IReportDocument from physical path to `TRDP`, `TRDX` or `TRBP` file
