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

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th {
        white-space: nowrap;
    }
</style>

# The `SetScaleModeAsync` method of the Blazor Report Viewer

Sets the report viewer's [`Telerik.ReportViewer.Blazor.ScaleMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/scalemode%}).

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| scaleMode | `Telerik.ReportViewer.Blazor.ScaleMode` | No | - |

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
