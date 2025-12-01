---
title: Double)()
page_title: The Double)() method of the Blazor Report Viewer explained
description: "Learn more about the Double)() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/double)()
tags: double)
published: True
reportingArea: BlazorWrapper
position: 17
---

# The `Double)()` method of the Blazor Report Viewer

Sets the report viewer's scale factor.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="SetScale">Set Scale to 150%</button>

@code {
    ReportViewer reportViewer;
    async void SetScale()
    {
        await reportViewer.SetScaleAsync(1.5);
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

