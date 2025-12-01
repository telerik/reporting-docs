---
title: GetScaleAsync()
page_title: The GetScaleAsync() method of the Blazor Report Viewer explained
description: "Learn more about the GetScaleAsync() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getscaleasync()
tags: getscaleasync
published: True
reportingArea: BlazorWrapper
position: 9
---

# The `GetScaleAsync()` method of the Blazor Report Viewer

Gets the report viewer's scale factor.

Returns: the current *System.Threading.Tasks.ValueTask{System.Double}* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="GetScale">Get Scale</button>
<p>Scale: @scale</p>

@code {
    ReportViewer reportViewer;
    double scale = 0;
    async void GetScale()
    {
        scale = await reportViewer.GetScaleAsync();
        StateHasChanged();
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

