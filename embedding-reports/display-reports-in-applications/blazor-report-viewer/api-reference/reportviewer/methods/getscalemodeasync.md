---
title: GetScaleModeAsync
page_title: The GetScaleModeAsync method of the Blazor Report Viewer explained
description: "Learn more about the GetScaleModeAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getscalemodeasync
tags: getscalemodeasync
published: True
reportingArea: BlazorWrapper
position: 10
---

# The `GetScaleModeAsync` method of the Blazor Report Viewer

Gets the report viewer's [`Telerik.ReportViewer.Blazor.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/scalemode%}).

## Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetScaleMode">Get Scale Mode</button>
<p>Scale Mode: @scaleMode</p>

@code {
    ReportViewer reportViewer;
    ScaleMode scaleMode;
    async void GetScaleMode()
    {
        scaleMode = await reportViewer.GetScaleModeAsync();
        StateHasChanged();
    }
}
````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

