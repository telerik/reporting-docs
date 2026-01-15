---
title: Telerik Reporting in .NET MAUI and .NET MAUI Blazor
description: "Learn how to integrate a Telerik Report Viewer and preview a report into a .NET MAUI and .NET MAUI Blazor application."
type: how-to
page_title: Displaying Telerik Report in .NET MAUI/.NET MAUI Blazor application
slug: displaying-telerik-report-in-net-maui-and-maui-blazor-applications
position:
tags: mobile, reporting, .netmaui, telerikreporting
ticketid: 1579640
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
			<td>Project Type</td>
			<td>.NET MAUI and .NET MAUI Blazor</td>
		</tr>
		<tr>
			<td>Report Viewer</td>
			<td>HTML5 and Blazor Report Viewer</td>
		</tr>
	</tbody>
</table>

## Description

In this article, you will see how to display a Telerik Reporting report into a .NET MAUI and .NET MAUI Blazor applications by using the [Html5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%}) and the [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%}).

> note You may preview but cannot print or export the reports with this solution. The reason for the limitations is that the `MAUI WebView` is not a full-blown browser and printing and downloading do not come out-of-the-box. For the supported functionality, you can check the [WebView description in the MS documentation](https://learn.microsoft.com/en-us/dotnet/maui/user-interface/controls/webview?pivots=devices-android).

## Visual Studio Requirements

If you develop on `Windows`, you will need the **Visual Studio 2022 version 17.3 or higher**. You can make a new installation of Visual Studio or modify your current installation and install the .NET Multi-platform App UI development workload with its default installation options.

If you develop on `Mac`, then you will need **Visual Studio 2022 for Mac 17.4 Preview or newer**.

> .NET MAUI apps that target Windows can only be launched and debugged using Visual Studio 2022.

## Telerik Reporting REST Service and Telerik Report Server

Our HTML-based Report Viewers require a running instance of the [Telerik Reporting REST Service]({%slug telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/overview%}) or the [Telerik Report Server](https://www.telerik.com/report-server) to display reports. Keep in mind that the report service should be hosted outside of the mobile app.

The project that hosts the Telerik Reporting REST service can target .NET Framework, .NET or .NET Core. You can find demos of the service in the installation folder of Telerik Reporting - `Examples\CSharp` subfolder.

If you are not much familiar with .NET, you can use the [Telerik Report Server](https://www.telerik.com/report-server). It is a server-based reporting platform that provides comprehensive reports management, as well as a centralized storage for the reports and various ways to organize and preview them.

## Embedding Telerik Reporting into .NET MAUI App

1. Firstly, you need to create the .NET MAUI app.
1. Then you can directly add the pure Html5 Report Viewer through a Web View. For example:

   ```RAZOR
   <WebView HeightRequest="600" WidthRequest="800">
   	<WebView.Source>
   		<HtmlWebViewSource>
   			<HtmlWebViewSource.Html>
   				<![CDATA[
   <html xmlns="http://www.w3.org/1999/xhtml">
   	<head>
   		<title>Telerik HTML5 Report Viewer Demo</title>
   		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
   		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
   		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   		<link href="https://kendo.cdn.telerik.com/{{site.kendosubsetversion}}/styles/kendo.common.min.css" rel="stylesheet" id="common-css" />
   		<link href="https://kendo.cdn.telerik.com/{{site.kendosubsetversion}}/styles/kendo.blueopal.min.css" rel="stylesheet" id="skin-css" />
   		<script src="https://demos.telerik.com/reporting/api/reports/resources/js/telerikReportViewer"></script>
   		<style>
   			body {
   				font-family: Verdana, Arial, sans-serif;
   				margin: 5px;
   			}

   			#reportViewer1 {
   			. . .
   			}
   		</style>
   	</head>
   	<body>

   		<div id="reportViewer1">
   			loading...
   		</div>

   		<script type="text/javascript">
   			$(document).ready(function () {
   				$("#reportViewer1")
   					.telerik_ReportViewer({
   						serviceUrl: "https://demos.telerik.com/reporting/api/reports/",
   						reportSource: {
   							//parameters: {}
   							//parameters: { Year: [2001, 2003, 2004] }
   						},
   						// Report Server connection configuration
   						// If Report Server is used instead of hosting a REST Service, comment out 'serviceUrl' and 'reportSource' above
   						// uncomment 'reportServer' and 'reportSource' below
   						//reportServer: {
   						//    url: "http://report-server-host:83",
   						//    username: "admin",
   						//    password: "adminpass"
   						//},
   						//reportSource: {
   						//    // For Report Server, use "{Category}/{ReportName}"
   						//    report: "Samples/Dashboard"
   						//},
   					});
   			});
   		</script>

   	</body>
   </html>
   ]]>
   			</HtmlWebViewSource.Html>
   		</HtmlWebViewSource>
   	</WebView.Source>
   </WebView>
   ```

You can also put the page of the viewer into a separate html file and refer it into the web view.

## Embedding Telerik Reporting into a .NET MAUI Blazor App

In this scenario, we will use the Blazor wrapper of the Html5 Report Viewer. For details, check the article [How to Use Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/how-to-use-blazor-report-viewer%}).

You may also check our Native Blazor Report Viewer released in [R3 2022](https://www.telerik.com/support/whats-new/reporting/release-history/progress-telerik-reporting-r3-2022-16-2-22-914).

An example can be found in the installation folder of Telerik Reporting, by default: `C:\Program Files (x86)\Progress\Telerik Reporting {{site.suiteversion}}\Examples\CSharp\CSharp.BlazorNativeExample.VS2022.sln`.

1. Create the MAUI Blazor app.
1. Add the `Telerik.ReportViewer.Blazor NuGet` package.
1. In the `wwwroot\index.html`, add the following scripts

   ```HTML
   <head>
   	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   	<script src="https://kendo.cdn.telerik.com/{{site.kendosubsetversion}}/js/kendo.all.min.js"></script>
   	<script src="https://demos.telerik.com/reporting/api/reports/resources/js/telerikReportViewer"></script>
   </head>
   <body>
   	...
   	<script src="_content/Telerik.ReportViewer.Blazor/interop.js" defer></script>
   </body>
   ```

1. Add the viewer to the `Index.razor` page:

   ```RAZOR
   @page "/"
   @using Telerik.ReportViewer.Blazor

   <h1>Telerik Reporting Blazor Report Viewer</h1>

   <style>
   	.trv-report-viewer {
   		width: 85%;
   		height: 600px;
   		padding-right: 50px;
   	}
   </style>

   <link rel="stylesheet" href="https://unpkg.com/@@progress/kendo-theme-default@5.0.1/dist/all.css" />

   <ReportViewer @ref="reportViewer1"
   	ViewerId="rv1"
   	ServiceUrl="https://demos.telerik.com/reporting/api/reports"
   	ReportSource="@(new ReportSourceOptions
   					{
   						Report = "Conference report.trdx",
   										})"
   	Parameters="@(new ParametersOptions { Editors = new EditorsOptions { MultiSelect = EditorType.ComboBox, SingleSelect = EditorType.ComboBox } })"
   	ScaleMode="@(ScaleMode.FitPage)"
   	Scale="1.0" />

   @code {
   	ReportViewer reportViewer1;
   }
   ```

## Source Code

The two projects can be found in our GitHub repository:

- [Telerik Reporting in .NET MAUI project](https://github.com/telerik/reporting-samples/tree/master/TelerikReportingMaui)
- [Telerik Reporting in .NET MAUI Blazor project](https://github.com/telerik/reporting-samples/tree/master/TelerikReportingMauiBlazor)
