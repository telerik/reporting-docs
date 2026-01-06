---
title: GetCurrentPageAsync
page_title: The GetCurrentPageAsync method of the Blazor Report Viewer explained
description: "Learn more about the GetCurrentPageAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getcurrentpageasync
tags: getcurrentpageasync
published: True
reportingArea: BlazorWrapper
position: 4
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

# The `GetCurrentPageAsync` method of the Blazor Report Viewer

Gets the page number of the report page currently displayed in the viewer.

## Example

````C#
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

