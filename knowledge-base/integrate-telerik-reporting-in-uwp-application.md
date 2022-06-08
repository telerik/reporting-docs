---
title: How to integrate Telerik Reporting in UWP application
description: How to integrate report viewer or create report documents in UWP application
type: how-to
page_title: How to integrate Telerik Reporting in UWP application
slug: integrate-telerik-reporting-in-uwp-application
position: 
tags: Reporting, UWP
ticketid: 1356591
res_type: kb
---

## Environment
<table>
	<tbody>
		<tr>
			<td>Product</td>
			<td>Progress® Telerik® Reporting</td>
		</tr>
	</tbody>
</table>


## Description
Utilizing reporting solution in UWP both with a WebView with integrated fully functional [Telerik HTML5 Report Viewer](https://docs.telerik.com/reporting/html5-report-viewer) and creating report document by invoking [Telerik Reporting REST Service](https://docs.telerik.com/reporting/telerik-reporting-rest-conception) endpoints.
## Solution
Download the example projects from this [link](https://github.com/telerik/reporting-docs/raw/master/knowledge-base/resources/Telerik.Reporting.UWP.Examples.zip) or review the [GitHub report](https://github.com/telerik/reporting-samples/tree/master/Telerik.Reporting.UWP.Examples). The projects require the latest official Telerik Reporting R2 2020.

The solution contains 5 projects:

1. Common (Universal Windows Class Library) - contains Utilities that are used in the other projects.

2. RuntimeComponent (Universal Window) - contains native Windows Runtime object that is provided to the viewer.html as a global parameter in the context of the top-level document inside of a WebView.  For more information on the approach see [WebView.AddWebAllowedObject(String, Object) Method.](https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.webview.addweballowedobject?view=winrt-19041#Windows_UI_Xaml_Controls_WebView_AddWebAllowedObject_System_String_System_Object_).

3. ReportingServiceHost (ASP.NET Core project) - hosts a Telerik Reporting REST Service, that renders the report documents and viewer.html that contains an HTML5 Report Viewer with handled ExportEnd and PrintEnd events in which I am invoking a Native Runtime Component methods to handle the print and export on the UWP side. This project is required from the other projects and needs to start with any other project. In production, this should be hosted on a server to serve the report documents to the viewer or other service clients. 

4. ReportViewer (Universal Window) - hosts a [WebView](https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.webview?view=winrt-19041) that renders the viewer.html and provides the Native Runtime Component to the JS side.

5. ServiceClient - a simple client for the Telerik Reporting REST service to export a PDF document on a button click.

## See Also
[Example solution GitHub report](https://github.com/telerik/reporting-samples/tree/master/Telerik.Reporting.UWP.Examples)

[Example solution archive](https://github.com/telerik/reporting-docs/raw/master/knowledge-base/resources/Telerik.Reporting.UWP.Examples.zip)

[WebView](https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.webview?view=winrt-19041)

[WebView.AddWebAllowedObject(String, Object) Method.](https://docs.microsoft.com/en-us/uwp/api/windows.ui.xaml.controls.webview.addweballowedobject?view=winrt-19041#Windows_UI_Xaml_Controls_WebView_AddWebAllowedObject_System_String_System_Object_)

[Telerik Reporting REST Service](https://docs.telerik.com/reporting/telerik-reporting-rest-conception)

[Telerik HTML5 Report Viewer](https://docs.telerik.com/reporting/html5-report-viewer)
