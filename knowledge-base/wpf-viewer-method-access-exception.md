---
title: The WPF ReportViewer Throws a MethodAccessException
page_title: The WPF ReportViewer Throws a MethodAccessException
description: "Learn how to handle a method access exception when working with the WPF ReportViewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/troubleshooting/wpf-reportviewer-troubleshooting
previous_url: /using-reports-in-applications/display-reports-in-applications/wpf-application/troubleshooting/wpf-reportviewer-troubleshooting.html#wpf-reportviewer-troubleshooting
tags: telerik, reporting, troubleshoot, wpf, reportviewer, method, access, exception, thrown, connecting, rest, service, report, server 
published: True
res_type: kb
type: troubleshooting
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

When connecting the WPF Report Viewer to the Telerik Report Server or Telerik Reporting REST API Service, a `MethodAccessException` error is thrown.

## Error Message

`Attempt by method 'Telerik.Reporting.Services.HttpClient.HttpRequestHelper.GetResponseFromPost(System.Net.Http.HttpResponseMessage)'
to access method 'Telerik.Reporting.Services.HttpClient.HttpRequestHelper.GetResponseFromPost<T>
(System.Net.Http.HttpResponseMessage, System.Collections.Generic.IEnumerable 1<System.Net.Http.Formatting.MediaTypeFormatter>)' failed.`

## Cause

The most common reason for this exception is an incorrect version of the web client assemblies. The WPF viewer requires the [`Microsoft.AspNet.WebApi.Client`](https://www.nuget.org/packages/Microsoft.AspNet.WebApi.Client/4.0.30506) NuGet package.

## Solution  

Install the assemblies required by the WPF viewer through the Visual Studio NuGet Package Manager or  with the [Visual Studio Package Manager Console](https://docs.nuget.org/consume/package-manager-console). For more details, refer to the article on [using the WPF ReportViewer with the Report Server]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/wpf-application/how-to-use-wpf-report-viewer-with-report-server%}).         
