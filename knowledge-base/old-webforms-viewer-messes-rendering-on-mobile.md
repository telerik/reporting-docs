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

The old ASP.NET Webforms ReportViewer does not display reports or the page area is messed on iPad and other mobile devices.

## Cause

The old ASP.NET WebForms ReportViewer displays content in the browser by using `iframe` and `table` elements, which may break the layout in modern HTML5-compliant browsers.

## Solution  

To solve this issue, [use an older `DOCTYPE` declaration]({% slug blank-report-in-asp.net-reportviewer-on-ipad-iphone %}).         
