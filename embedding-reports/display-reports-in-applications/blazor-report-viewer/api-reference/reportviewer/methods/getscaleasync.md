---
title: GetScaleAsync
page_title: The GetScaleAsync method of the Blazor Report Viewer explained
description: "Learn more about the GetScaleAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getscaleasync
tags: getscaleasync
published: True
reportingArea: BlazorWrapper
position: 9
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

# The `GetScaleAsync` method of the Blazor Report Viewer

Gets the report viewer's scale factor.

## Example

````C#
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

