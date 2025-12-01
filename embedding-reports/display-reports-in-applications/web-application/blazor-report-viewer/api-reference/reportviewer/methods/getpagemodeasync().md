---
title: GetPageModeAsync()
page_title: The GetPageModeAsync() method of the Blazor Report Viewer explained
description: "Learn more about the GetPageModeAsync() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getpagemodeasync()
tags: getpagemodeasync
published: True
reportingArea: BlazorWrapper
position: 6
---

# The `GetPageModeAsync()` method of the Blazor Report Viewer

Gets the current <xref href="Telerik.ReportViewer.Blazor.PageMode" data-throw-if-not-resolved="false"></xref>.

Returns: the current *System.Threading.Tasks.ValueTask{Telerik.ReportViewer.Blazor.PageMode}* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="GetPageMode">Get Page Mode</button>
<p>Page Mode: @pageMode</p>

@code {
    ReportViewer reportViewer;
    PageMode pageMode;
    async void GetPageMode()
    {
        pageMode = await reportViewer.GetPageModeAsync();
        StateHasChanged();
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

