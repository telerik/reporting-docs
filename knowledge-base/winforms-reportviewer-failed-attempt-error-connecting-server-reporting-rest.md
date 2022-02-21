---
title: Failed Attempt Error Occurs When Connecting WinForms ReportViewer to Telerik Report Server or Reporting REST Service
page_title: Failed Attempt Error Occurs When Connecting WinForms ReportViewer to Telerik Report Server or Reporting REST Service
description: "Learn how to handle a failed attempt error that occurs when connecting the WinForms ReportViewer to the Telerik Report Server or to the Reporting REST service."
slug: winforms-reportviewer-failed-attempt-error-connecting-server-reporting-rest
tags: telerik, reporting, winforms, report, viewer, failed, attempt, when, connecting, to, telerik, report, server, rest, service, error, occurs
published: True
type: troubleshooting
res_type: kb
---

## Environment

<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
		<tr>
			<td>Version</td>
			<td>Q2 2012 and later</td>
		</tr>
	        <tr>
			<td>Report Viewers</td>
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

When connecting the WinForms ReportViewer to Telerik Report Server or Reporting REST service, an error for a failed attempt occurs.

## Error

`Attempt by method 'Telerik.Reporting.Services.HttpClient.HttpRequestHelper.GetResponseFromPost(System.Net.Http.HttpResponseMessage)' to access method 'Telerik.Reporting.Services.HttpClient.HttpRequestHelper.GetResponseFromPost <T> (System.Net.Http.HttpResponseMessage, System.Collections.Generic.IEnumerable 1 <System.Net.Http.Formatting.MediaTypeFormatter>)' failed.`

## Cause

The WinForms ReportViewer requires [`Microsoft.AspNet.WebApi.Client`](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.Client/4.0.30506) that is suitable for .NET4.

## Solution  

Install the `Microsoft.AspNet.WebApi.Client` trough the [Visual Studio Package Manager Console](https://docs.nuget.org/consume/package-manager-console). For more information, refer to the article on [using the WinForms Report Viewer with the Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/windows-forms-application/how-to-use-windows-forms-report-viewer-with-report-server%}).
