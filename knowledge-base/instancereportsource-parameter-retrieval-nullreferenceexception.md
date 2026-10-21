---
title: Diagnosing InstanceReportSource Errors During Parameter Retrieval
page_title: Diagnose NullReferenceException During GetParameters with InstanceReportSource
description: "Investigate NullReferenceException in DocumentParametersManager during GetParameters when using a server-side InstanceReportSource with the Telerik Reporting REST Service."
type: troubleshooting
slug: instancereportsource-parameter-retrieval-nullreferenceexception
tags: instancereportsource, reportdocument, getparameters, documentparametersmanager, nullreferenceexception, resolver, mvc
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 

| 20.2.26.1007 | Reporting REST Service |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

If a report works locally but fails on the server with a `NullReferenceException` in `DocumentParametersManager` during `GetParameters`, inspect the report source returned by the service's custom resolver. The stack trace identifies the failing stage, but it does not identify the exact null value or establish an environment-specific cause.

## Solution

Returning an `InstanceReportSource` from a server-side resolver is a documented approach. See [Using InstanceReportSource with the HTML5 Report Viewer](slug:how-to-display-a-report-via-instancereportsource-in-the-html5-viewer) for the setup and an example. To investigate a parameter-retrieval failure:

1. Confirm where the report source is created. The MVC or HTML5 viewer sends a report identifier and parameter values. Create or load the report instance in the Reporting REST Service, and return it through the resolver rather than trying to send the report object from the viewer.
1. Verify that the returned `InstanceReportSource.ReportDocument` contains an initialized report when the resolver is called with `OperationOrigin.ResolveReportParameters`. Parameter retrieval occurs before document generation, so do not initialize the report only in the `OperationOrigin.GenerateReportDocument` branch. If your class derives from `InstanceReportSource`, inspect its inherited `ReportDocument` property. Deriving from the class does not initialize a report instance. See [ReportSource resolver operations](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/how-to-use-custom-report-source-resolver-and-custom-report-document-resolver) for the purpose of each resolver call.
1. Capture the resolver's input report identifier, operation origin, and whether the returned source or its `ReportDocument` is null during the failing request. Keep the full exception and any inner exceptions. Do not log credentials or sensitive parameter values. Use the [custom resolver error-handling guidance](slug:handling-errors-occurring-in-a-custom-resolver-used-by-a-reporting-rest-service) to distinguish errors that occur before processing from errors raised while processing report items.
1. For a server-only failure, compare the deployed Telerik Reporting and runtime versions, configuration, and custom resolver behavior with the development environment.

These checks do not establish that `ReportDocument` caused a particular exception. Do not infer that changing storage providers, deleting the service cache, or changing the server operating system will resolve the issue without evidence identifying that cause.