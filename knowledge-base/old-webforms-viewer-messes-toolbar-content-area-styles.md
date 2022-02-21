---
title: The Old ASP.NET Webforms ReportViewer Messes Up Toolbar and Content Styles
page_title: The Old ASP.NET Webforms ReportViewer Messes Up Toolbar and Content Styles
description: "Learn how to handle the situation when the old ASP.NET Webforms ReportViewer messes up the styles of its toolbar and content area."
slug: old-webforms-viewer-messes-toolbar-content-area-styles
tags: telerik, reporting, troubleshoot, asp, net, webforms, old, reportviewer, messes, up, styles, toolbar, content, area
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

The old ASP.NET Webforms ReportViewer messes up the styles of its toolbar and content area.

## Cause

The old ASP.NET WebForms ReportViewer displays content delivered by its `Telerik.ReportViewer.axd` handler.

## Solution  

To solve this issue, use the following approaches:

* Make sure that the handler is registered correctly and that the [browser proxy and security settings allow it to deliver content]({% slug the-styles-of-the-web-report-viewer-s-toolbar-are-messed-up %}).         

* If you are using authorization, verify that [the path of the `Telerik.ReportViewer.axd` handler is allowed for the user](https://support.microsoft.com/en-us/kb/316871).
