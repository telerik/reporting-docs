---
title: Implementing a Custom ReportSource Resolver
page_title: Implementing a Custom ReportSource Resolver Explained with Example
description: "Learn how to implement a Custom ReportSource Resolver for the Telerik Reporting REST Service and how to chain it with other resolvers through the fallback mechanism."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver
tags: implement, custom, reportsource, resolver
published: True
reportingArea: RESTService, RESTServiceCore
position: 1
previous_url: /telerik-reporting-rest-custom-report-resolver,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver
---

# Implementing a Custom ReportSource Resolver Explained with Example

This article explains how to create a custom report source resolver for the **Telerik Reporting REST Service**. In this example, the resolver's purpose is to return an [XmlReportSource](/api/telerik.reporting.xmlreportsource) with an XML report definition obtained from a SQL Server database.

> tip The report sources passed from the [Report Viewers using Reporting REST Service](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers#set-up-report-viewers-that-operate-via-telerik-reporting-services) and [Navigate To Report action](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action) are resolved by the ReportSource Resolver of the service. The ReportSource of the [SubReport item](slug:telerikreporting/designing-reports/report-structure/subreport) is resolved in the context of the Reporting Engine and doesn't use the ReportSource Resolver of the REST Service.
>
> Use the ReportDocument Resolver to resolve them with custom code as explained in [Implementing Custom ReportSource and ReportDocument Resolvers To Fully Control the Report in Run Time](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-use-custom-report-source-resolver-and-custom-report-document-resolver).

1. Create a class that implements the [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver) interface. Its [Resolve](/api/telerik.reporting.services.ireportsourceresolver#telerik_reporting_services_ireportsourceresolver_resolve_system_string_telerik_reporting_services_operationorigin_system_collections_generic_idictionary_system_string_system_object_) method is called whenever the engine needs to create a [ReportSource](/api/telerik.reporting.reportsource) instance based on the parameter named `report`. The value of the `report` parameter is initialized with the value of the **Report** property of the report viewer's `ReportSource` object.

	{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportResolver_Implementation}}
	{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportResolver_Implementation}}

1. Find the `ReportSourceResolver` property of the [ReportServiceConfiguration](/api/telerik.reporting.services.webapi.reportscontrollerbase#telerik_reporting_services_webapi_reportscontrollerbase_reportserviceconfiguration), and set it to an instance of the custom report source resolver or to a chain of resolver instances, including the custom one. In the following examples, the REST Service tries to resolve the report in the sequence:

	1. Declarative report definition (`TRDP`/`TRDX`/`TRBP` file), through the `UriReportSourceResolver`.
	1. Type report definition (`CS` or `VB` type inheriting `Telerik.Reporting.Report`), through the `TypeReportSourceResolver`.
	1. Custom report identifier, through the `CustomReportSourceResolver`.

	- In .NET Framework, the `ReportServiceConfiguration` property is in the implementation of the [ReportsControllerBase](/api/telerik.reporting.services.webapi.reportscontrollerbase) class:

		{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportResolver_ReportsController_Implementation}}
		{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportResolver_ReportsController_Implementation}}

	- In .NET, the `ReportServiceConfiguration` is usually added as a singleton in the DI container at the starting point of the application:

		{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=ReportsControllerRestFileStorageWithCustomReportSourceResolver}}

1. Request the report from the HTML5 Report Viewer on the client:

	{{source=CodeSnippets\Blazor\Docs\ReportViewers\Html5Viewer.html region=RequestCustomReportIdentifierFromHtml5Viewer}}

1. To create the database, use the following script:

	{{source=CodeSnippets\Blazor\Docs\QueryCustomResolver.sql}}

1. To enter some data into the database, manually edit the **Reports** table. XML report definitions can be obtained from the sample `.trdx` report files installed together with the product and located in `[Telerik_Reporting_Install_Dir]\Report Designer\Examples`. In newer versions, all sample reports of the Standalone Report Designer are in TRDP format. Use the **Standalone Report Designer** > **File** > **Save As** option to convert them to TRDX files.

## How to Implement and Use a Custom IReportSourceResolver with a Fallback Mechanism

1. Add to your `IReportSourceResolver` implementation a constructor with the parameter `IReportSourceResolver parentResolver`. Then use the `parentResolver` if the custom report source resolving mechanism fails.

	{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomReportSourceResolverFallBack_Implementation}}
	{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomReportSourceResolverFallBack_Implementation}}

1. Add to the `ReportServiceConfiguration` the `IReportSourceResolver` implementations in a chain. Thus, the custom one is executed first, and if it fails, the second one is invoked, and so on.

	- In .NET Framework, the `ReportServiceConfiguration` is configured in the implementation of the [ReportsControllerBase](/api/telerik.reporting.services.webapi.reportscontrollerbase) class:

		{{source=CodeSnippets\MvcCS\Controllers\CustomResolverReportsController.cs region=CustomResolverWithFallback_ReportsController_Implementation}}
		{{source=CodeSnippets\MvcVB\Controllers\CustomResolverReportsController.vb region=CustomResolverWithFallback_ReportsController_Implementation}}

	- In .NET, the `ReportServiceConfiguration` is usually added as a singleton in the DI container at the starting point of the application:

		{{source=CodeSnippets\Blazor\Docs\ProgramWithRestConfig.cs region=ReportsControllerRestFileStorageWithCustomReportSourceResolverWithFallback}}

	For the fallback, you can use the default `IReportSourceResolver` implementations:

	- `TypeReportSourceResolver`—resolves `IReportDocument` from the assembly-qualified name of a `Report` or `ReportBook` class.
	- `UriReportSourceResolver`—resolves `IReportDocument` from the physical path to a `TRDP`, `TRDX`, or `TRBP` file.