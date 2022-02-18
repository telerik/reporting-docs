---
title: HTML5 Report Viewer Styles Are Messed Up
page_title: HTML5 Report Viewer Styles Are Messed Up
description: "Learn how to fix the styles of the Telerik Reporting HTML5 ReportViewer and when an undefined error is thrown."
slug: html5-reportviewer-styles-messed-up
tags: telerik, reporting, troubleshoot, html5, reportviewer, styles, messed, up, undefined, error, thrown
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
			<td>Q2 2012 and newer</td>
		</tr>
	        <tr>
			<td>Report Viewers</td>
			<td>WinForms, WPF, ASP.NET</td>
		</tr>
	</tbody>
</table>

## Description

The HTML5 Report Viewer styles are messed or a JavaScript `undefined` error is thrown.

## Cause

A possible cause about the occurrence of this issue is that relative paths may need adjustment.

## Solution  

You can see errors related to loading CSS and JavaScript files in the browser console. Inspect the rendered HTML to obtain more details if external CSS and JavaScript causes similar issues on the page and [fix any relative paths that may need adjustment](https://msdn.microsoft.com/en-us/library/ms178116.aspx).         

Generally, [according to the Telerik Kendo UI JavaScript requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}), the page with the HTML5 Report Viewer must load jQuery v. 1.9.1 or later only once. In addition, the linked Telerik Kendo UI CSS and JS files have to be of the same version.         
