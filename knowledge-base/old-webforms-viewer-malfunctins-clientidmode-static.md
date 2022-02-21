---
title: The Old ASP.NET Webforms ReportViewer Malfunctions When ClientIDMode Is Static
page_title: The Old ASP.NET Webforms ReportViewer Malfunctions When ClientIDMode Is Static
description: "Learn how to handle the situation when the ClientIDMode of the old ASP.NET Webforms ReportViewer is set to Static."
slug: old-webforms-viewer-malfunctins-clientidmode-static
tags: telerik, reporting, troubleshoot, asp, net, webforms, old, reportviewer, malfunctions, when, clientidmode, set, to, static
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

The old ASP.NET Webforms ReportViewer malfunctions when its `ClientIDMode` is set to `Static`.

## Cause

The old ASP.NET WebForms ReportViewer has a complex structure and its functionality partially depends on the JavaScript delivered by its HTTP handlers. Setting the `ClientIDMode` to `Static` may lead to improper execution of these JavaScript methods.

## Solution  

To solve this issue, refer to the solutions suggested in the [ClientIDMode in ASP.NET 4.0](https://weblog.west-wind.com/posts/2009/Nov/07/ClientIDMode-in-ASPNET-40) Web Log blog post by Rick Strahl.
