---
title: Access to Path Denied Error Occurs
page_title: Access to Path Denied Error Occurs
description: "Learn how to fix the error about a denied access to a path occurs when working with the Telerik Reporting HTML5 ReportViewer."
slug: denied-access-to-path-error
tags: telerik, reporting, troubleshoot, html5, reportviewer, denied, access, to, path, error, occurs
published: False
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
			<td>Viewers working with the Telerik Reporting REST services</td>
		</tr>
	</tbody>
</table>

## Description

An `Access to the path 'xxxxxx\value.dat' is denied.` error occurs when using the HTML5 Telerik Reporting ReportViewer.

## Cause

The error message indicates that the Reporting REST service cannot access the configured file storage.

## Solution  

To solve this issue, use the following approaches:

* Verify the Reporting REST service has an unique [`HostAppId`](/reporting/api/Telerik.Reporting.Services.ReportServiceConfiguration#Telerik_Reporting_Services_ReportServiceConfiguration_HostAppId) in its configuration.

* Make sure that the application has read-and-write access to the folder [specified by the `FileStorage` instance]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}) in the Reporting REST service configuration.         
