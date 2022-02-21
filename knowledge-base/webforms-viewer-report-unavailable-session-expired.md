---
title: Report Is Unavailable or Session Has Expired Error Occurs
page_title: Report Is Unavailable or Session Has Expired Error Occurs
description: "Learn how to fix the error about the report being unavailable or a session has expired when using the ASP.NET WebForms ReportViewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/troubleshooting/asp.net-webforms-reportviewer-troubleshooting
previous_url: /using-reports-in-applications/display-reports-in-applications/web-application/troubleshooting/asp.net-webforms-reportviewer-troubleshooting.html
tags: telerik, reporting, troubleshoot, asp, net, webforms, reportviewer, report unavailable, session, expired, error, occurs
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
			<td>Q2 2012 and newer</td>
		</tr>
	        <tr>
			<td>Report Viewers</td>
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

An error message that the report is unavailable or that the session has expired error message occurs when using the ASP.NET WebForms ReportViewer.

## Cause

The old ASP.NEt WebForms ReportViewer depends on the ASP.NET Session.

## Solution  

If the session expires, refresh the page with the viewer.
