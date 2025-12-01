---
title: GetCurrentPageAsync()
page_title: The GetCurrentPageAsync() method of the Blazor Report Viewer explained
description: "Learn more about the GetCurrentPageAsync() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getcurrentpageasync()
tags: getcurrentpageasync
published: True
reportingArea: BlazorWrapper
position: 4
---

# The `GetCurrentPageAsync()` method of the Blazor Report Viewer

Gets the page number of the report page currently displayed in the viewer.

Returns: the current *System.Threading.Tasks.ValueTask{System.Int32}* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="GetCurrentPage">Get Current Page</button>
<p>Current Page: @currentPage</p>

@code {
    ReportViewer reportViewer;
    int currentPage = 0;
    async void GetCurrentPage()
    {
        currentPage = await reportViewer.GetCurrentPageAsync();
        StateHasChanged();
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

