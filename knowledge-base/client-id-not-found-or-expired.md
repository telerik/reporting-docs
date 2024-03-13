---
title: Client ID Is Not Found or Has Expired Error Occurs
page_title: Client ID Is Not Found or Has Expired Error Occurs
description: "Learn how to fix the error about a client ID that was not found or has expired when working with the Telerik Reporting HTML5 ReportViewer."
slug: cannot-find-client-id-expired
tags: telerik, reporting, troubleshoot, html5, reportviewer, cannot, find, client, id, or, expired
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
			<td>Viewers working with the Telerik Reporting REST services</td>
		</tr>
	</tbody>
</table>

## Description

An `Error Client with ID 'xxxxxx-xxxx' not found. Expired.` occurs when using the HTML5 Telerik Reporting ReportViewer.

## Cause

The error message indicates that the ID of the Report Viewer cannot be found in the cache storage.

## Solution  

To solve this issue, use the following approaches:

* Check if the [time set as the `ClientSessionTimeout` of the Reporting REST service has expired]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%}).

* Alternatively, fix the [`Storage` of the Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}), if it is not set according to the hosting environment.         
