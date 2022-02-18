---
title: HTML5 Report Viewer Does Not Display InstanceReportSource Reports
page_title: HTML5 Report Viewer Does Not Display InstanceReportSource Reports
description: "Learn how to display reports with the Telerik Reporting HTML5 ReportViewer specified with the InstanceReportSource."
slug: html5-reportviewer-not-displaying-instancereportsource-reports
tags: telerik, reporting, troubleshoot, html5, reportviewer, not, displaying, instacereportsource, reports
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
			<td>Q2 2012 and newer</td>
		</tr>
	        <tr>
			<td>Report Viewers</td>
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

The HTML5 Report Viewer does not display a report specified through `InstanceReportSource`.

## Cause

The HTML5 Report Viewer is an HTML, CSS, and JavaScript control, which gets the content produced on the server by the Reporting REST service. Data objects and report instances cannot be submitted to the server in a request.

## Solution  

To solve this issue, refer to the article on [using the `InstanceReportSource` property with the HTML5 Report Viewer]({% slug how-to-display-a-report-via-instancereportsource-in-the-html5-viewer %}).
