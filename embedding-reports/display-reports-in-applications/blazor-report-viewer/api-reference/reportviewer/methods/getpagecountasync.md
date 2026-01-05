---
title: GetPageCountAsync
page_title: The GetPageCountAsync method of the Blazor Report Viewer explained
description: "Learn more about the GetPageCountAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getpagecountasync
tags: getpagecountasync
published: True
reportingArea: BlazorWrapper
position: 5
---

# The `GetPageCountAsync` method of the Blazor Report Viewer

Gets the total page count of the report displayed in the viewer.

## Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetPageCount">Get Page Count</button>
<p>Page Count: @pageCount</p>

@code {
    ReportViewer reportViewer;
    int pageCount = 0;
    async void GetPageCount()
    {
        pageCount = await reportViewer.GetPageCountAsync();
        StateHasChanged();
    }
}
````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

