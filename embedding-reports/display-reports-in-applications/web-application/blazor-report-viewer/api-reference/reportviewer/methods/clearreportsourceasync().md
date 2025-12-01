---
title: ClearReportSourceAsync()
page_title: The ClearReportSourceAsync() method of the Blazor Report Viewer explained
description: "Learn more about the ClearReportSourceAsync() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/clearreportsourceasync()
tags: clearreportsourceasync
published: True
reportingArea: BlazorWrapper
position: 2
---

# The `ClearReportSourceAsync()` method of the Blazor Report Viewer

Clears the current reportSource from the viewer internal state and from its persisted session in the browser.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="ClearSource">Clear Report Source</button>

@code {
    ReportViewer reportViewer;
    async void ClearSource()
    {
        await reportViewer.ClearReportSourceAsync();
        // (Optional) Refresh the viewer in order to see the empty report area
        await reportViewer.RefreshReportAsync();
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

