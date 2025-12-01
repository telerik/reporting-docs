---
title: ScaleMode)()
page_title: The ScaleMode)() method of the Blazor Report Viewer explained
description: "Learn more about the ScaleMode)() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/scalemode)()
tags: scalemode)
published: True
reportingArea: BlazorWrapper
position: 18
---

# The `ScaleMode)()` method of the Blazor Report Viewer

Sets the report viewer's <xref href="Telerik.ReportViewer.Blazor.ScaleMode" data-throw-if-not-resolved="false"></xref>.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
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


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

