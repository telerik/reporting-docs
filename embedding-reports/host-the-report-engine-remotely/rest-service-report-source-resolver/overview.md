---
title: Overview
page_title: Reporting REST Service ReportSource Resolver at a Glance
description: "Learn more about the Telerik Reporting REST Service ReportSource Resolver, what is its purpose, and what built-in implementations are available."
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview
tags: overview,report,reportsource,resolver,implementation,built-in,rest,service
published: True
reportingArea: RESTService, RESTServiceCore
position: 0
previous_url: /telerik-reporting-rest-service-report-resolver,/embedding-reports/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview, /embedding-reports/host-the-report-engine-remotely/rest-service-report-source-resolver/
---

# REST Service ReportSource Resolver Overview

When implementing the `ReportsController` you need to provide an [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver) implementation, which is used in the Reporting REST Service [ReportServiceConfiguration](/api/telerik.reporting.services.webapi.reportscontrollerbase#telerik_reporting_services_webapi_reportscontrollerbase_reportserviceconfiguration) - **ReportSourceResolver property**. This article elaborates on the Reporting REST Service's `ReportSourceResolver` purpose, usage, built-in implementations and the option for adding a custom implementation.

## Purpose and Usage of the Reporting REST Service ReportSource Resolver

The Reporting REST Service's ReportSourceResolver handles reports on the server.

[IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver) defines the behavior of an object which takes a string as an argument and resolves it to a valid **server-side** [ReportSource](slug:telerikreporting/designing-reports/report-sources/overview) object. The format of this string argument is a matter of implementation, which should contain rules for collaboration between the service clients and the report resolver on the server. For example, if the resolver implementation expects a string containing a path relative to the application root directory, then the client should send a string containing such a path. If the resolver is built to resolve reports from a type name, then a type name should be provided by the service client. Another scenario might require a resolver implementation that expects a report id and pulls the XML report definition from database storage by that report id, then returns it as an [XmlReportSource](/api/telerik.reporting.xmlreportsource).

The Reporting REST Service's resolver is used when resolving information for a report on the server, which includes:

* Getting information about the report's **ReportParameters** collection;
* Returning a valid **server-side ReportSource**;
* Applying client-side parameters' values;
* Exporting the report in a selected format;
* Printing the report which is based on export in PDF file with additional Adobe JavaScript settings - [Printing Reports](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports);
* Refresh calls;
* Navigation to another report that is considered as a request for a new report.

## Available built-in ReportSource Resolver implementations:

1. [UriReportSourceResolver](/api/telerik.reporting.services.urireportsourceresolver) - resolves absolute path UriReportSource from absolute or relative path to declarative report definition files. These are the `TRDX`, `TRDP` or `TRBP` files created in the [Standalone Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview) or [Web Report Designer](slug:telerikreporting/designing-reports/report-designer-tools/web-report-designer/overview).
1. [TypeReportSourceResolver](/api/telerik.reporting.services.typereportsourceresolver) - resolves TypeReportSource from report type's [assembly qualified name](https://learn.microsoft.com/en-us/dotnet/api/system.type.assemblyqualifiedname?view=net-7.0) (reports created in Visual Studio Report Designer).

> note
>
> When working with other types of report sources for which there is no built-in report source resolver implementation, use a [Custom ReportSource Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver) implementation. For example, when using [Drillthrough Report Action](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action) with [XmlReportSource](/api/telerik.reporting.xmlreportsource) the action will not work unless a custom report source resolver which can handle [XmlReportSource](/api/telerik.reporting.xmlreportsource) has been implemented.

## Custom ReportSource Resolver implementations:

Implementing the [IReportSourceResolver](/api/telerik.reporting.services.ireportsourceresolver) interface allows you to include custom logic for creating, modifying, or accessing existing reports on the server, and to use any of the available [report sources](slug:telerikreporting/designing-reports/report-sources/overview). An example implementation is available in [How To Implement a Custom ReportSource Resolver](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver).

> important
>
> The [Telerik.Reporting.Services.IReportSourceResolver.Resolve](/api/telerik.reporting.services.ireportsourceresolver#telerik_reporting_services_ireportsourceresolver_resolve_system_string_telerik_reporting_services_operationorigin_system_collections_generic_idictionary{system_string_system_object}_) method will be called each time when the Reporting engine needs the report source. This can happen several times until the report document is completely rendered. It is important that when the method is invoked multiple times it returns exactly the same report source for a given value of the passed string argument.

## See Also

* [How to Set ReportSource for Report Viewers](slug:telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers)
