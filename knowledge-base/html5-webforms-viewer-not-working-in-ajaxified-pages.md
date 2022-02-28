---
title: HTML5 WebForms Report Viewer Does Work on AJAXified Pages
page_title: HTML5 WebForms Report Viewer Does Work on AJAXified Pages
description: "Learn how to make the Telerik Reporting HTML5 WebForms ReportViewer in AJAXified pages."
slug: html5-webforms-viewer-not-working-in-ajaxified-pages
tags: telerik, reporting, troubleshoot, html5, webforms, reportviewer, not, working, in, ajaxified, pages
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
			<td>Q2 2012 and later</td>
		</tr>
	  <tr>
			<td>Report Viewers</td>
			<td>HTML5 WebForms</td>
		</tr>
	</tbody>
</table>

## Description

The HTML5 WebForms Report Viewer does not work in an AJAXified page.

## Cause

The HTML5 WebForms Report Viewer is a wrapper of the HTML5 JavaScript Report Viewer. The wrapper renders the JavaScript object on the page and registers the scripts at the end of the page.

## Solution  

To solve this issue, update the viewer in the page by using ite [exposed Client-Side API]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%}).

Alternatively, make a full post-back to recreate the viewer object.         
