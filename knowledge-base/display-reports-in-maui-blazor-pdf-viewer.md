---
title: Display Telerik Reports in the Telerik Blazor PDF Viewer in a Hybrid .NET MAUI Blazor Application
description: "Learn how you may render a Telerik report in PDF and display it in a Telerik Blazor PDF Viewer hosted in a .NET MAUI Blazor Application."
type: how-to
page_title: Render Telerik Reports and Show Them in Telerik Blazor PDF Viewer in .NET MAUI
slug: display-reports-in-maui-blazor-pdf-viewer
tags: maui,blazor,telerik,report,viewer,pdf
ticketid: 1619041
res_type: kb
---

## Environment

<table>
	<tr>
		<td>Product</td>
		<td>Progress® Telerik® Reporting</td>
	</tr>
</table>

## Description

The Telerik Reporting engine requires GDI+ (the [System.Drawing](https://learn.microsoft.com/en-us/dotnet/api/system.drawing?view=net-7.0) functionality) that is not available for Android and for non-Windows applications built with .NET 7. For that reason, the Telerik Reports cannot be rendered within a .NET MAUI project. However, the PDF report documents generated with Telerik Reporting may be previewed in the [Telerik UI for Blazor PDF Viewer](https://docs.telerik.com/blazor-ui/components/pdfviewer/overview). The document generated in a Reporting service may be passed to the PDF Viewer through Web requests.

The approach is demonstrated with a demo in our GitHub repository Reporting Samples - [MauiBlazorPdfReporting](https://github.com/telerik/reporting-samples/tree/master/MauiBlazorPdfReporting). The demo is configured to use the [Telerik Reporting online demos](https://demos.telerik.com/reporting) as a Reporting service. It may be reconfigured to utilize the built-in custom reporting service instead by setting the `ReportingService` property in the page with the PDF Viewer (`Index.razor` in `MauiBlazorViewer` project) to `ReportService.ReportingWebApi`.

## Solution

The PDF Viewer is hosted in the `Index.razor` page of the MAUI Blazor project, with its [Data property](https://docs.telerik.com/blazor-ui/api/Telerik.Blazor.Components.TelerikPdfViewer#Telerik_Blazor_Components_TelerikPdfViewer_Data) bound to the `byte[] FileData` we are going to receive from the Reporting service. We have wrapped it in a conditional statement showing the [TelerikLoaderContainer](https://demos.telerik.com/blazor-ui/loadercontainer/overview) when there is no data:

````CSHTML
@if (FileData != null)
{
	<TelerikPdfViewer @ref="@PdfViewerRef"
					Data="@FileData">
		<PdfViewerToolBar>
			<PdfViewerToolBarPagerTool />
			<PdfViewerToolBarSpacer />
			<PdfViewerToolBarZoomTool />
			<PdfViewerToolBarSelectionTool />
		</PdfViewerToolBar>
	</TelerikPdfViewer>
}
else
{
	<TelerikLoaderContainer />
}
````

In the web page, above the PDF Viewer component, there is a [TelerikDropDownList](https://docs.telerik.com/blazor-ui/components/dropdownlist/overview) to allow the user to select a report that is available on the service. The component should be filled with the list of available reports from the service itself when such an endpoint is available. In the case of Reporting online demos, there is no such endpoint, so we have hardcoded the list with reports. Here is the configuration code of the drop-down list component:

````CSHTML
<TelerikDropDownList @ref="@DropDownListRef"
						Data="@MyReports"
						Value="@SelectedReport"
						DefaultText="@( SelectedReport == null ? "<Select Report>" : null )"
						ValueChanged="@((string newValue) => OnDropDownValueChanged(newValue))">
</TelerikDropDownList>
````

Initially, the page loads the available reports (in the method `ConfigureForService`) and shows the first one from the corresponding Reporting service:

````C#
protected override async Task OnInitializedAsync()
{
	await ConfigureForService();
	SelectedReport = MyReports[0];
	await GetPdfAsync(SelectedReport);

	await base.OnInitializedAsync();
}
````

On the change of the user selection, the SelectedReport and the PDF Viewer get updated:

````C#
private async Task OnDropDownValueChanged(string newValue)
{
	SelectedReport = newValue;
	await GetPdfAsync(newValue);

}
````

When the user has selected the Reporting online demos as a service, the report is requested in the method `ExportReportFromServiceAsync` through multiple requests to the Reporting REST Service of the demos. The approach is explained in the KB article [Using Reporting Service API with HttpClient]({%slug how-to-use-reporting-rest-service-api-with-csharp-client%}#net-core-net).

When the Reporting service is the custom one hosted in the project `ReportingWebApi`, the viewer simpy requests the PDF bytes with the Microsoft class [System.Net.Http.HttpClient](https://learn.microsoft.com/en-us/dotnet/api/system.net.http.httpclient?view=net-7.0). The report document itself is rendered with the [ReportProcessor.RenderReport](/api/telerik.reporting.processing.reportprocessor#Telerik_Reporting_Processing_ReportProcessor_RenderReport_System_String_Telerik_Reporting_ReportSource_System_Collections_Hashtable_) method in the project `RenderReports`. For more details you may check also the article [Generating Reports Locally with Code]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%}).

````C#
private async Task GetPdfAsync(string reportName)
{
	switch (ReportingService)
	{
		// Render report in the project RenderReports
		case ReportService.ReportingWebApi:
			{
				FileData = await WebClient.GetByteArrayAsync($"{BaseAddress}/{reportName}");
				return;
			}

		// Render report in the Reporting online demo
		case ReportService.ReportingOnlineDemo:
			{
				FileData = await ExportReportFromServiceAsync(reportName);
				return;
			}
	}
}
````

## Platform Specific Settings

For Android platforms, you should consider the following:

* The Local Service (`http://localhost:5186` in Windows) runs in `http://10.0.2.2:5186` on Android. See [Connect to local web services from Android emulators and iOS simulators](https://learn.microsoft.com/en-us/dotnet/maui/data-cloud/local-web-services) for details.
* For Android you need to set `UsesCleartextTraffic` to `true` in the file `Platforms/Android/MainApplication.cs` as explained in the StackOverflow thread [How to fix 'Cleartext HTTP traffic to x not permitted' in xamarin android](https://stackoverflow.com/questions/67071052/how-to-fix-cleartext-http-traffic-to-x-not-permitted-in-xamarin-android).
* The blazor web view for Android requires a newer Android OS. It works with emulator `Pixel 5 - API 33 -> Android 13 - API 33` and doesn't work with `Pixex 5 - API 31`.

## Download Samples

Download the demo from our Reporting Samples GitHub repo: [MauiBlazorPdfReporting](https://github.com/telerik/reporting-samples/tree/master/MauiBlazorPdfReporting).

## See Also

* [Using Reporting Service API with HttpClient]({%slug how-to-use-reporting-rest-service-api-with-csharp-client%})
* [Generating Reports Locally with Code]({%slug telerikreporting/using-reports-in-applications/call-the-report-engine-via-apis/embedded-report-engine%})
* [Telerik UI for Blazor PDF Viewer](https://docs.telerik.com/blazor-ui/components/pdfviewer/overview)
* [TelerikDropDownList](https://docs.telerik.com/blazor-ui/components/dropdownlist/overview)
* [TelerikLoaderContainer](https://demos.telerik.com/blazor-ui/loadercontainer/overview)
