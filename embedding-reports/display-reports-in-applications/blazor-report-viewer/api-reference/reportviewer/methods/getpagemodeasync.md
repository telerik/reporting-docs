---
title: GetPageModeAsync
page_title: The GetPageModeAsync method of the Blazor Report Viewer explained
description: "Learn more about the GetPageModeAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getpagemodeasync
tags: getpagemodeasync
published: True
reportingArea: BlazorWrapper
position: 6
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

    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `GetPageModeAsync` method of the Blazor Report Viewer

Gets the current [`Telerik.ReportViewer.Blazor.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/pagemode%}).

## Example

````C#
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

