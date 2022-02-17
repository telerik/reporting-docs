---
title: ReportViewer Styles and Images Are All Messed Up
page_title: The ReportViewer Styles and Images Are All Messed Up
description: "Learn how to fix the rendering of the styles and images in the ReportViewer when working with Telerik Reporting."
slug: reportviewer-styles-images-messedup
tags: telerik, reporting, run, time, reportviewer, styles, and, images, messed, up, rendering
previous_url:
published: True
component:
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

My ASP.NET Web Forms ReportViewer looks messed up because its styles and images are missing.

## Cause

The possible reason for this issue is that the global styles defined in the application may affect the page with the ReportViewer.

## Solution  

To solve the occurred issue:

1. Check if `runat="server"` is present in the head tag of your web page.

1. Check if the web HTTP handler of your ReportViewer is registered in the `web.config` file. If the application is deployed on IIS7 and set up to work in the integrated mode, make sure that the `preCondition` attribute is present at the end of the `Telerik.ReportViewer` handler:             

      ````XML
<add
    name="Telerik.ReportViewer.axd_*"
    type="Telerik.ReportViewer.WebForms.HttpHandler, Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
    path="Telerik.ReportViewer.axd" verb="*"
    preCondition="integratedMode"
/>
````

1. Check if the styles of the ReportViewer are registered on the page. This can be accomplished with an HTTP debugging proxy like Telerik Fiddler.

1. Check for global styles defined in the application which affect the page with the ReportViewer and conflict with its styles. Remove any style declarations from the page. Make sure the global style rules do not affect HTML elements directly, but are applied through the `CssClass` property.
