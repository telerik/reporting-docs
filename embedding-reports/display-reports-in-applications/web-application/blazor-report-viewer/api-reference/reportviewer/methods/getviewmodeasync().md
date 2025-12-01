---
title: GetViewModeAsync()
page_title: The GetViewModeAsync() method of the Blazor Report Viewer explained
description: "Learn more about the GetViewModeAsync() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getviewmodeasync()
tags: getviewmodeasync
published: True
reportingArea: BlazorWrapper
position: 11
---

# The `GetViewModeAsync()` method of the Blazor Report Viewer

Gets the current <xref href="Telerik.ReportViewer.Blazor.ViewMode" data-throw-if-not-resolved="false"></xref>.

Returns: the current *System.Threading.Tasks.ValueTask{Telerik.ReportViewer.Blazor.ViewMode}* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="GetViewMode">Get View Mode</button>
<p>View Mode: @viewMode</p>

@code {
    ReportViewer reportViewer;
    ViewMode viewMode;
    async void GetViewMode()
    {
        viewMode = await reportViewer.GetViewModeAsync();
        StateHasChanged();
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

