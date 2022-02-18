---
title:
page_title:
description:
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/troubleshooting/html5-viewer-troubleshooting
previous_url: troubleshooting/installation
tags: telerik, reporting, troubleshoot,
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

An `Error loading the report viewer's templates. (Template = /api/reports/resources/templates/telerikReportViewerTemplate-html)` occurs.

## Cause

The error message indicates that the [Reporting REST service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) is not responding.

## Solution  

Check the HTML5 Viewer [`serviceUrl`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) and adjust the relative path.
Try [adding `~` or remove the first `.`](https://msdn.microsoft.com/en-us/library/ms178116.aspx). It is recommended to test the service by address in browser - *step 8* of           [How To: Add Telerik Reporting REST Web API to Web Application]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/asp.net-web-api-implementation/how-to-add-telerik-reporting-rest-web-api-to-web-application%}).           The issue might be related to WebAPI controllers duplicating routes, which can be avoided by  [changing the registered by default Telerik Reporting REST Web API routes](http://www.telerik.com/support/kb/reporting/details/how-to-change-reporting-rest-web-api-routes-registered-by-default).         

## Report Parameters are not updated on refreshing the HTML5 Viewer

The HTML5 Viewer sends information about the client's reportSource.parameters in a JSON-formatted string.           Test updating JSON.NET NuGet package to the latest official version through the  [Visual Studio NuGet Package Manager Dialog](https://docs.nuget.org/consume/package-manager-dialog). Also verify that the HTML5 Viewer's [persisSession]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%})           is set to __false__.         

## Error Client with ID 'xxxxxx-xxxx' not found. Expired.

The error message indicates that the viewer's ID cannot be found in the cache storage.           Such error can occur if the time set as Reporting REST service's __ClientSessionTimeout__ has expired - [Cache Management]({%slug telerikreporting/using-reports-in-applications/export-and-configure/cache-management/html5-report-viewer-and-reporting-rest-services%}),           or if the Reporting REST service's Storage is not set accordingly the hosting enviroment - [REST Service Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-report-source-resolver/overview%}).         

## Access to the path 'xxxxxx\value.dat' is denied.

The error message indicates that the Reporting REST service cannot access the configured file storage.           Verify the Reporting REST service has an unique  [HostAppId](/reporting/api/Telerik.Reporting.Services.ReportServiceConfiguration#Telerik_Reporting_Services_ReportServiceConfiguration_HostAppId)            in its configuration and the application has read/write access to the folder specified by the FileStorage instance in the Reporting REST service configuration           - [REST Service Storage]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-service-storage/overview%}).         

## The HTML5 Report Viewer does not display a report that uses Table/List/Crosstab item in Internet Explorer.

In case data visualized by the [Table/List/Crosstab item]({%slug telerikreporting/designing-reports/report-structure/table-crosstab-list/overview%})           results in a great number of HTML elements, Internet Explorer may fail to visualize the content. solutions are suggested in           [Design Considerations for HTML Rendering (Browsers Limitations)]({%slug telerikreporting/designing-reports/rendering-and-paging/design-considerations-for-report-rendering/html-rendering-design-considerations%}).         

## The HTML5 Report Viewer's styles are messed or there is a JavaScript 'undefined' error.

Errors on loading CSS, JS files can be seen in the browser's Console.           Inspecting the rendered HTML will give you more details if external CSS and JavaScript causes issues in the page.           Relative paths may need adjustment -  [ASP.NET Web Project Paths](https://msdn.microsoft.com/en-us/library/ms178116.aspx).         

In general, the page with the HTML5 Viewer must load only once jQUERY of version greater than 1.9.1,           considered with Telerik Kendo UI JavaScript requirements, and there must be linked Telerik Kendo UI CSS           and JS files of the same version - [HTML5 Viewer Requirements]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/requirements-and-browser-support%}).         

## The HTML5 Report Viewer does not display a report specified via InstanceReportSource.

The HTML5 Viewer is an HTML/CSS/JS widget, which gets content produced on the server by the Reporting REST service.           Data objects and report instances cannot be submitted to the server in a request.           Details how to use an InstanceReportSource with the HTML5 Viewer are avaialble in the  [How to display a report via InstanceReportSource in the HTML5 Viewer](http://www.telerik.com/support/kb/reporting/details/how-to-display-a-report-via-instancereportsource-in-the-html5-viewer)  KB article.         

## The HTML5 WebForms Report Viewer does not work in an AJAXified page.

The HTML5 WebForms ReportViewer is a wrapper of the HTML5 JavaScript Viewer.           The wrapper renders the JavaScript object in the page and registers scipts at the end of the page.           To update the viewer in the page, you can use its [exposed Client-Side API]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/reportsource(rs)%})           or you can make a full post-back to recreate the viewer object.         
