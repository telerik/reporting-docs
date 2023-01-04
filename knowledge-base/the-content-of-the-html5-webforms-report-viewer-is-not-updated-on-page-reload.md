---
title: The content of the HTML5 ASP.NET WebForms Report Viewer is not updated on page reload
description: The content of the HTML5 ASP.NET WebForms Report Viewer is not updated on page reload.
type: how-to
page_title: The content of the HTML5 ASP.NET WebForms Report Viewer is not updated on page reload
slug: the-content-of-the-html5-webforms-report-viewer-is-not-updated-on-page-reload
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
	<tr>
		<td>Report Viewers</td>
		<td>HTML5 Web Forms Report Viewer</td>
	</tr>
        <tr>
		<td>Versions</td>
		<td>Up to R1 2017</td>
	</tr>
</table>

## Description

The content of the [HTML5 ASP.NET WebForms ReportViewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-asp.net-web-forms-report-viewer/overview%}) is not updated on page reload. 

You may experience the problem in an attempt to refresh the page fully or partially.  
 
## Solution

The HTML5 ASP.NET WebForms Report Viewer has its [PersistSession property]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) hard-coded to **True**, allowing the displayed content to be preserved between requests. 

> A **fix** is available in the **R1 2017** release, so if you are experiencing this problem, please consider upgrading or use the workaround suggested below.  
  
## Workaround  

Replace the HTML5 ASP.NET WebForms ReportViewer with the pure [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}). It is the same viewer, where settings will have to be applied in JavaScript instead of C#|VB.NET.



