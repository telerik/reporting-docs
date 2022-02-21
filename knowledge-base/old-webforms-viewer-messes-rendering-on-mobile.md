---
title: The Old ASP.NET Webforms ReportViewer Messes Up Reports Rendering on iPad and Other Mobile Devices
page_title: The Old ASP.NET Webforms ReportViewer Messes Up Reports Rendering on iPad and Other Mobile Devices
description: "Learn how to handle the situation when the old ASP.NET Webforms ReportViewer messes up the rendering of the reports on iPad and other mobile devices."
slug: old-webforms-viewer-messes-rendering-on-mobile
tags: telerik, reporting, troubleshoot, asp, net, webforms, old, reportviewer, messes, up, rendering, reports, on, ipad, mobile
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

The old ASP.NET Webforms ReportViewer does not display reports or the page area is messed on iPad and other mobile devices.

## Cause

The old ASP.NET WebForms ReportViewer displays content in the browser by using `iframe` and `table` elements, which may break the layout in modern HTML5-compliant browsers.

## Solution  

To solve this issue, [use an older `DOCTYPE` declaration]({% slug blank-report-in-asp.net-reportviewer-on-ipad-iphone %}).         
