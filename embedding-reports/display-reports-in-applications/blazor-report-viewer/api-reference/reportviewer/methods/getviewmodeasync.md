---
title: GetViewModeAsync
page_title: The GetViewModeAsync method of the Blazor Report Viewer explained
description: "Learn more about the GetViewModeAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getviewmodeasync
tags: getviewmodeasync
published: True
reportingArea: BlazorWrapper
position: 11
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `GetViewModeAsync` method of the Blazor Report Viewer

Gets the current [`Telerik.ReportViewer.Blazor.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/viewmode%}).

## Example

````C#
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

