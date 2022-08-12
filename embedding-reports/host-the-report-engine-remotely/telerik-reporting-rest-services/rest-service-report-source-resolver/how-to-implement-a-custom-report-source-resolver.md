---
title: How to Implement a Custom Report Source Resolver
page_title: How to Implement a Custom Report Source Resolver 
description: How to Implement a Custom Report Source Resolver
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver
tags: how,to,implement,a,custom,report,source,resolver
published: True
position: 1
previous_url: /telerik-reporting-rest-custom-report-resolver
---

# How to Implement a Custom Report Source Resolver

This article explains how to create a custom report source resolver for the __Telerik Reporting REST service__. In this example, the resolver purpose will be to return a [XmlReportSource](/reporting/api/Telerik.Reporting.XmlReportSource) with an XML report definition obtained from an SQL Server database. 

## How to implement a custom report source resolver:

1. Create a class which implements the  [IReportSourceResolver](/reporting/api/Telerik.Reporting.Services.IReportSourceResolver) interface. Its [Resolve](/reporting/api/Telerik.Reporting.Services.IReportSourceResolver#Telerik_Reporting_Services_IReportSourceResolver_Resolve_System_String_Telerik_Reporting_Services_OperationOrigin_System_Collections_Generic_IDictionary{System_String_System_Object}_) method will be called whenever the engine needs to create a [ReportSource](/reporting/api/Telerik.Reporting.ReportSource) instance based on the parameter named *report*. The value of the *report* parameter will be initialized with the value of the __Report__ property of the report viewer's ReportSource object. 

	{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportResolver_Implementation}}
	{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportResolver_Implementation}}

1. Find the __ReportSourceResolver property__ in the [ReportServiceConfiguration](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_ReportServiceConfiguration) settings of the implementation of the [ReportsControllerBase](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase) class, and set it to an instance of the custom report source resolver or to a chain of resolver instances including the custom one: 

	{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportResolver_ReportsController_Implementation}}
	{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportResolver_ReportsController_Implementation}}

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

	where x.x.x.x is the version of the HTML5 ReportViewer/Telerik Reporting (e.g. 8.1.14.618). 

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

1. Add to the ReportServiceConfiguration the IReportSourceResolver implementations in a chain. Thus the custom one will be executed first, if it fails the second one and so on. 

	{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomResolverWithFallback_ReportsController_Implementation}}
	{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomResolverWithFallback_ReportsController_Implementation}}

	You can use for fallback the default IReportSourceResolver implementations: 
	
	+ TypeReportSourceResolver - Resolves IReportDocument from assembly qualified name

	+ UriReportSourceResolver - Resolves IReportDocument from physical path to trdp or trdx file 
