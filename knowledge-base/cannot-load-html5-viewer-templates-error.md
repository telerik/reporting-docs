---
title: Cannot Load HTML5 Report Viewer Templates
page_title: Error 'Cannot Load HTML5 Report Viewer Templates' occurs
description: "Learn how to fix the error about being unable to load the Telerik Reporting ReportViewer templates in the HTML5-based viewers."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/troubleshooting/html5-viewer-troubleshooting
previous_url: /using-reports-in-applications/display-reports-in-applications/web-application/troubleshooting/html5-viewer-troubleshooting.html
tags: telerik, reporting, troubleshoot, html5, reportviewer, cannot, load, templates, error, occurs
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

An `Error loading the report viewer's templates. (Template = /api/reports/resources/templates/telerikReportViewerTemplate-html)` occurs when using the HTML5 Telerik Reporting ReportViewer.

## Cause

The error message indicates that the [Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) is not responding.

## Solution

To solve the issue, use the following approaches:

* Check the HTML5 Viewer [`serviceUrl`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) and adjust the relative path.
* Try [adding `~` or removing the first `.`](https://learn.microsoft.com/en-us/previous-versions/ms178116(v=vs.140)).
* It is recommended to test the service by address in the browser as described in the article on [adding the Telerik Reporting REST web API to web applications]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application%}).
* The issue might be related to duplicating routes of the WebAPI controllers. To avoid such a possibility, [change the Telerik Reporting REST Web API routes registered byu default]({%slug how-to-change-reporting-rest-web-api-routes-registered-by-default%}).
