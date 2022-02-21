---
title: WebForms Reports Do Not Display Data or Applied Changes in Events
page_title: WebForms Reports Do Not Display Data or Applied Changes in Events
description: "Learn how to fix the error about reports that do not display data or applied changes in the events when using the ASP.NET WebForms ReportViewer."
slug: webforms-reports-do-not-display-changes-in-events
tags: telerik, reporting, troubleshoot, asp, net, webforms, reportviewer, reports, do, not, display, data, changes, in, events
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

The ASP.NET WebForms ReportViewer report does not display data or changes that are made in the events.

## Cause

The old ASP.NET WebForms ReportViewer depends on the ASP.NET Session.

## Solution  

Depending on the  [session state mode](https://msdn.microsoft.com/en-us/library/ms178586.aspx)  of the application, the report may require additional settings as described in the [Design Considerations for Out-proc Session State]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/using-out-proc-session-state/overview%}) article.
