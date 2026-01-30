---
title: Run Time Problems. My ASP.NET Web Forms ReportViewer looks messed up
description: The obsolete ASP.NET Web Forms ReportViewer looks messed up - its styles and images are missing
page_title: My ASP.NET Web Forms ReportViewer looks messed up
slug: troubleshooting-runtime-my-asp-net-web-forms-reportviewer-looks-messed-up-its-styles-and-images-are-missing
position:
tags:
ticketid:
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Important

This article is related to the obsolete [ASP.NET Web Forms Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/asp.net-web-forms-report-viewer/overview%}).

We strongly advice to [Migrate to the HTML5 Viewer](https://www.telerik.com/support/kb/reporting/details/migrate-to-the-html5-viewer-from-the-old-asp.net-webforms-reportviewer-control).

## Description

The obsolete ASP.NET Web Forms ReportViewer looks messed up - its styles and images are missing.

## Solution

1. Check if runat="server" is present in your web page's head tag.
2. Check if the web report viewer's http handler is registered in the _web.config_ file. If the app is deployed on IIS7 and setup to work in integrated mode, make sure _preCondition_ attribute is present at the end of Telerik.ReportViewer handler:

   ```XML
   <add
   	name="Telerik.ReportViewer.axd_*"
   	type="Telerik.ReportViewer.WebForms.HttpHandler, Telerik.ReportViewer.WebForms, Version=x.x.x.x, Culture=neutral, PublicKeyToken=a9d7983dfcc261be"
   	path="Telerik.ReportViewer.axd" verb="*"
   	preCondition="integratedMode"
   />
   ```

3. Check if the report viewer's styles are registered on the page. This can be accomplished with http debugging proxy like [Fiddler](https://www.telerik.com/download/fiddler).
4. Check for global styles defined in the application which affect the page with the report viewer and conflict with the report viewer's styles. Remove any style declarations from the page. Make sure the global style rules do not affect HTML elements directly, but are applied through the _CssClass_ property.
