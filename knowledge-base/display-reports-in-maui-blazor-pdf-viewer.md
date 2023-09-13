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

The approach is demonstrated with a demo in our GitHub repository Reporting Samples - [MauiBlazorPdfReporting](https://github.com/telerik/reporting-samples/tree/master/MauiBlazorPdfReporting). The demo is configured to use the [Telerik Reporting online demos](https://demos.telerik.com/reporting) as a Reporting service. It may be reconfigured to utilize the built-in reporting service instead by setting the `ReportingService` property in the page with the PDF Viewer (`Index.razor` in `MauiBlazorViewer` project) to `ReportService.ReportingWebApi`.

## Solution

The PDF Viewer is hosted in a MAUI Blazor page, with its Data property bound to the `byte[] FileData` we are going to receive from the Reporting service. We have wrapped it in a conditional statement showing the [TelerikLoaderContainer](https://demos.telerik.com/blazor-ui/loadercontainer/overview) when there is no data:

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

Above the PDF Viewer component there is also a [TelerikDropDownList](https://docs.telerik.com/blazor-ui/components/dropdownlist/overview) to allow the user to select a report that is available on the service. The component should be loaded with the list of available reports from the service itself when such an endpoint is available. In the case with Reporting online demos there is no such endpoint, so we have hardcoded the list with reports. here is the code of the drop down list:

````CSHTML
<TelerikDropDownList @ref="@DropDownListRef"
						Data="@MyReports"
						Value="@SelectedReport"
						DefaultText="@( SelectedReport == null ? "<Select Report>" : null )"
						ValueChanged="@((string newValue) => OnDropDownValueChanged(newValue))">
</TelerikDropDownList>
````

On the change of the user selection, the SelectedReport and the PDF Viewer get updated:

````C#
private async Task OnDropDownValueChanged(string newValue)
{
	SelectedReport = newValue;
	await GetPdfAsync(newValue);

}
````
