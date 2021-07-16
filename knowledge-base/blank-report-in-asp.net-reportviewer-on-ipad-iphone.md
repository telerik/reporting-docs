---
title: Blank report in ASP.NET ReportViewer on iPad/iPhone
description: Blank report in ASP.NET ReportViewer on iPad/iPhone.
type: how-to
page_title: Blank report in ASP.NET ReportViewer on iPad/iPhone
slug: blank-report-in-asp.net-reportviewer-on-ipad-iphone
res_type: kb
---

> **Note**
> <br/>
> This article relates to the [Legacy ASP<span>.</span>NET Report Viewer](../asp-net-report-viewer).
 
## Description  
 
 The ASP<span>.</span>NET ReportViewer is empty when trying to show a report on iPad or iPhone device.  
   
 ## Solution

 The reason reports may not be displayed on iPad is because the document is rendered within an iframe and the page uses HTML5 [DOCTYPE](http://www.w3schools.com/tags/tag_doctype.asp). Using an older DOCTYPE declaration as **HTML4.1** resolves the issue with the ASP<span>.</span>NET ReportViewer.  
   
 The [HTML5 Report Viewer](../html5-report-viewer) introduced in **Telerik Reporting Q3 2013** also provides solution for the issue. The viewer uses HTML5/JS/CSS3 technologies and is HTML5 browsers compliant.

