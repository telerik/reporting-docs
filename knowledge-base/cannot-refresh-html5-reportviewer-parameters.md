---
title: The HTML5 Report Viewer Parameters Are Not Updated on Refreshing
page_title: The HTML5 Report Viewer Parameters Are Not Updated on Refreshing
description: "Learn how to fix the issues when the HTML5 ReportViewer parameters are not updated on refreshing."
slug: cannot-refresh-html5-reportviewer-parameters
tags: telerik, reporting, troubleshoot, html5, reportviewer, cannot, refresh, parameters
published: False
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

The parameters of the report are not updated on refreshing the HTML5 Report Viewer.

## Cause

The HTML5 Report Viewer sends information about the `reportSource.parameters` of the client in a JSON-formatted string.

## Solution  

To solve this issue, use the following approaches:

* Try to update the JSON.NET NuGet package to the latest official version through the [Visual Studio NuGet Package Manager Dialog](https://docs.nuget.org/consume/package-manager-dialog).

* Verify that the HTML5 Viewer [`persisSession`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) is set to `false`.         
