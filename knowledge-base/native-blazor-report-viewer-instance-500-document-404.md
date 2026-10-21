---
title: Troubleshooting Instance 500 and Document 404 Errors in Native Blazor Viewer
description: "Diagnose Native Blazor Report Viewer document-generation failures by distinguishing missing scripts from Reporting REST Service instance 500 and document 404 responses."
type: troubleshooting
page_title: Native Blazor Report Viewer Instance 500 and Document 404 Errors
slug: native-blazor-report-viewer-instance-500-document-404
tags: Blazor, NativeBlazorViewer, REST, HTTP500, HTTP404, reporting-blazor-viewer.js
res_type: kb
---

## Environment

| Version | Product | Author | 
| ---- | ---- | ---- | 
| 20.2.26.1007| Native Blazor Report Viewer |[Desislava Yordanova](https://www.telerik.com/blogs/author/desislava-yordanova)| 

## Description

The Native Blazor Report Viewer displays `Error creating report document`. The browser's Network tab shows a report-instance request returning HTTP 500 and a document request returning HTTP 404, with `reporting-blazor-viewer.js` listed as the initiator.

## Solution

Inspect the failed request's **Request URL** in the browser developer tools before changing viewer scripts. If `reporting-blazor-viewer.js` appears in the **Initiator** column, it identifies the script making the request. It does not mean that the JavaScript file itself failed to load.

Distinguish the following requests:

| Request | What to investigate |
| --- | --- |
| `GET _content/Telerik.ReportViewer.BlazorNative/js/reporting-blazor-viewer.js` returns 404 | The viewer script is unavailable at the requested URL. Check the asset references and static file serving against the [Native Blazor Report Viewer setup](slug:telerikreporting/embedding-reports/display-reports-in-applications/web-application/native-blazor-report-viewer/how-to-use-native-blazor-report-viewer). |
| A request for `reporting-blazor-viewer.js.map` returns 404 | This request is for a debugging source map, not the viewer script or a report document. Do not treat it as evidence of a failed report-generation request. |
| `POST {serviceUrl}/clients/{clientID}/instances` returns 500 | The report-instance request failed with a server error. Inspect its response body and the corresponding server-side exception. |
| A request under `{serviceUrl}/clients/{clientID}/instances/{instanceID}/documents` returns 404 | Inspect the full URL, HTTP method, and response body to distinguish an unavailable route from unavailable report state. This is not a request for the viewer script. |

In these paths, `{serviceUrl}` represents the viewer's configured Reporting REST Service URL. The client and instance IDs identify the report session and instance used by the request.

To investigate failures in the REST requests:

1. Open the browser developer tools, select **Network**, enable **Preserve log**, and reproduce the error. Select the first failed request and record its Request URL, HTTP method, status, request payload, and response body.
1. Correlate that request with the [server-side tracing and traffic capture](slug:how-to-troubleshoot-errors-in-asp-net-core-applications#steps-to-troubleshoot) from the same reproduction. Use the returned error details to identify the next diagnostic step instead of assuming a missing script or changing the NuGet feed.
1. If an instance request returns 500 and a document request returns 404, compare their timestamps and client and instance IDs. A document request uses a report instance, but these two status codes alone do not prove that the 500 caused the 404.
1. If you need support, provide the captured traffic and matching server log, the Telerik Reporting and .NET versions, and the hosting configuration. If the problem started after a Windows update, include the update identifier and reproduction steps; timing alone does not establish the cause.

> caution Before sharing HAR files, request payloads, or server logs, remove credentials, authorization headers, cookies, connection strings, and sensitive report data.

## See Also

* [Error Handling in Reports and Report Viewers](slug:error-handling-in-reports-and-report-viewers)