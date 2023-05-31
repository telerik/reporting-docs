---
title: ReportViewer Styles and Images Are All Messed Up
description: "Learn how to fix the rendering of the styles and images in the ReportViewer when working with Telerik Reporting."
type: troubleshooting
page_title: The Styles and Images of the ReportViewer Are All Messed Up
slug: reportviewer-styles-images-messedup
tags: telerik, reporting, run, time, reportviewer, styles, and, images, messed, up, rendering
published: True
res_type: kb
---

## Environment

<table>
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
		<td>ASP.NET WebForms Report Viewer</td>
	</tr>
</table>

> This article relates only to the [Legacy Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%}). You may be looking for [HTML5 Report Viewer Troubleshooting]({%slug html5-reportviewer-styles-messed-up%})

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


1. Check if the styles of the ReportViewer are registered on the page. This can be accomplished with an HTTP debugging proxy like [Fiddler](https://www.telerik.com/fiddler/fiddler-classic).
1. Check for global styles defined in the application which affect the page with the ReportViewer and conflict with its styles. Remove any style declarations from the page. Make sure the global style rules do not affect HTML elements directly, but are applied through the `CssClass` property.
