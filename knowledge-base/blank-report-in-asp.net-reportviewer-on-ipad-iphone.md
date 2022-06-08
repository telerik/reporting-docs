---
title: Blank report in ASP.NET ReportViewer on iPad/iPhone
description: No content in the displayed report in ASP.NET ReportViewer on iPad/iPhone.
type: troubleshooting
page_title: Empty report in ASP.NET ReportViewer on iPad/iPhone
slug: blank-report-in-asp.net-reportviewer-on-ipad-iphone
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
 	<tr>
		<td>Report Viewer</td>
		<td>ASP.NET WebForms Report Viewer</td>
	</tr>
  	<tr>
		<td>OS</td>
		<td>iOS</td>
	</tr>
</table>

> This article relates to the [Legacy ASP<span>.</span>NET Report Viewer](../asp-net-report-viewer).
 
## Description  
 
 The ASP<span>.</span>NET ReportViewer is empty when trying to show a report on iPad or iPhone device. 
 
## Possible Cause

The reason reports may not be displayed on iPad is because the document is rendered within an iframe and the page uses HTML5 [DOCTYPE](http://www.w3schools.com/tags/tag_doctype.asp).

## Solution

Using an older DOCTYPE declaration such as **HTML4.1** resolves the issue with the ASP<span>.</span>NET ReportViewer.  
   
## Notes

The [HTML5 Report Viewer](../html5-report-viewer) introduced in **Telerik Reporting Q3 2013** also provides solution for the issue. The viewer uses HTML5/JS/CSS3 technologies and is HTML5 browsers compliant.

## See Also

[Migrate to the HTML5 Viewer from the old ASP.NET WebForms ReportViewer control](./migrate-to-the-html5-viewer-from-the-old-asp.net-webforms-reportviewer-control)
