---
title: SetScaleModeAsync
page_title: The SetScaleModeAsync method of the Blazor Report Viewer explained
description: "Learn more about the SetScaleModeAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/setscalemodeasync
tags: setscalemodeasync
published: True
reportingArea: BlazorWrapper
position: 18
---

# The `SetScaleModeAsync` method of the Blazor Report Viewer

Sets the report viewer's [`Telerik.ReportViewer.Blazor.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/scalemode%}).

## Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetScaleMode">Set Scale Mode to Fit Page Width</button>

@code {
    ReportViewer reportViewer;
    async void SetScaleMode()
    {
        await reportViewer.SetScaleModeAsync(ScaleMode.FitPageWidth);
    }
}
````


