---
title: REST Service Report Source Resolver Overview
page_title: Overview | for Telerik Reporting Documentation
description: Overview
slug: telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview
tags: overview
published: True
position: 0
---

# REST Service Report Source Resolver Overview



When implementing the ReportsController you need to provide an  [IReportSourceResolver](/reporting/api/Telerik.Reporting.Services.IReportSourceResolver)  implementation,         which is used in the Reporting REST Service  [ReportServiceConfiguration](/reporting/api/Telerik.Reporting.Services.WebApi.ReportsControllerBase#Telerik_Reporting_Services_WebApi_ReportsControllerBase_ReportServiceConfiguration)  -         __ReportSourceResolver property__ . This article elaborates on the Reporting REST Service's ReportSourceResolver purpose, usage,         built-in implementations and the option for adding a custom implementation.       

## Purpose and Usage of the Reporting REST Service Report Source Resolver

The Reporting REST Service's ReportSourceResolver handles reports on the server.

 [IReportSourceResolver](/reporting/api/Telerik.Reporting.Services.IReportSourceResolver)  defines the behavior of an object which takes a string as an argument           and resolves it to a valid __server-side__ [ReportSource]({%slug telerikreporting/designing-reports/report-sources/overview%}) object.           The format of this string argument is a matter of imlpementation, which should contain rules for collaboration between the service clients and the report resolver on the server.           For example, if the resolver implementation expects a string containing a path relative to the application root directory, then the client should send a string containing such path.           If the resolver is built to resolve reports from a type name, then a type name should be provided from the service client.           Other scenario might require a resolver implementation which expects a report id and pulls the XML report definition from a database storage by that report id,           then returns it as an  [XmlReportSource](/reporting/api/Telerik.Reporting.XmlReportSource) .         

The Reporting REST Service's resolver is used when resolving information for a report on the server,           which includes:         

* Getting information about the report's __ReportParameters__  collection;             

* Returning a valid __server-side Report Source__ ;             

* Applying client-side parameters' values;

* Exporting the report in a selected format;

* Printing the report which is based on export in PDF file with additional Adobe JavaScript secttings -               [Printing Reports]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/printing-reports%});             

* Refresh calls;

* Navigation to other report that is considered as a request for a new report.

## Available built-in Report Source Resolver implementations:

1.  [UriReportSourceResolver](/reporting/api/Telerik.Reporting.Services.UriReportSourceResolver)                - resolves absolute path UriReportSource from relative path to report document created in [Overview]({%slug telerikreporting/designing-reports/report-designer-tools/desktop-designers/standalone-report-designer/overview%})).             

1.  [TypeReportSourceResolver](/reporting/api/Telerik.Reporting.Services.TypeReportSourceResolver)                - resolves TypeReportSource from report type's  [assembly qualified name](http://msdn.microsoft.com/en-us/library/30wyt9tk)  (reports created in Visual Studio Report Designer).             

>important When working with other types of report sources for which there is no built-in report source resolver implementation, use a              [Custom Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}) implementation.             For example, when using [Drillthrough Report Action]({%slug telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action%}) with  [XmlReportSource](/reporting/api/Telerik.Reporting.XmlReportSource)              the action will not work unless a custom report source resolver which can handle  [XmlReportSource](/reporting/api/Telerik.Reporting.XmlReportSource)               has been implemented.           


## Custom Report Source Resolver implementations:

Implementing the  [IReportSourceResolver](/reporting/api/Telerik.Reporting.Services.IReportSourceResolver)            interface allows you to include custom logic for creating, modifying, or accessing existing reports on the server,           and to use any of the available [report sources]({%slug telerikreporting/designing-reports/report-sources/overview%}).           An example implementation is available in [How To Implement a Custom Report Source Resolver]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-implement-a-custom-report-source-resolver%}).         

>note The              [Telerik.Reporting.Services.IReportSourceResolver.Resolve](/reporting/api/Telerik.Reporting.Services.IReportSourceResolver#Telerik_Reporting_Services_IReportSourceResolver_Resolve_System_String_Telerik_Reporting_Services_OperationOrigin_System_Collections_Generic_IDictionary{System_String_System_Object}_)              method will be called each time when the Reporting engine needs the report source. This can happen serveral times  until the report document is             completely rendered. It is important that when the method is invoked multiple times it returns exactly the same             report source for a given value of the passed string argument.           


# See Also


 * [How to Set ReportSource for Report Viewers]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/how-to-set-reportsource-for-report-viewers%})
