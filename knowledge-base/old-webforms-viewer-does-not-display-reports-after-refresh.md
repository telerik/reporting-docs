---
title: The Old ASP.NET Webforms ReportViewer Does Not Display Reports after Refresh
page_title: The Old ASP.NET Webforms ReportViewer Does Not Display Reports after Refresh
description: "Learn how to display reports after refreshing the old ASP.NET WebForms ReportViewer."
slug: old-webforms-viewer-does-not-display-reports-after-refresh
tags: telerik, reporting, troubleshoot, asp, net, webforms, old, reportviewer, does, not, display, reports, after, refresh
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
			<td>Legacy ASP.NET WebForms Viewer</td>
		</tr>
	</tbody>
</table>

## Description

>The described scenario and suggested solution relate to the legacy ASP.NET WebForms ReportViewer. It is recommended that you migrate to the [HTML5 ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}).  

The old ASP.NET WebForms ReportViewer does not display reports after refresh.

## Cause

The old ASP.NET WebForms ReportViewer displays content delivered by its `Telerik.ReportViewer.axd` handler.

## Solution  

To solve the issue, try the following approaches:

* Verify that the `Telerik.ReportViewer.axd` handler is [registered in both the `system.Web` and `system.webServer` sections]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/how-to-add-report-viewer-to-a-web-page%}).

* Make sure that the viewer is added in a valid [AJAX scenario]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/ajax-support%}).         

* If you are using Visual Studio 2013 or later, [disable the BrowserLink feature](http://www.asp.net/visual-studio/overview/2013/using-browser-link).
