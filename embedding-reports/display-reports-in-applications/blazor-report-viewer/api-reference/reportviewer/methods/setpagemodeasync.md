---
title: SetPageModeAsync
page_title: The SetPageModeAsync method of the Blazor Report Viewer explained
description: "Learn more about the SetPageModeAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/setpagemodeasync
tags: setpagemodeasync
published: True
reportingArea: BlazorWrapper
position: 15
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

# The `SetPageModeAsync` method of the Blazor Report Viewer

Sets the [`Telerik.ReportViewer.Blazor.PageMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/pagemode%}) and automatically reloads the current report (if any) into the new view.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| pageMode | `Telerik.ReportViewer.Blazor.PageMode` | No | - |

## Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetPageMode">Set Page Mode to Single Page</button>

@code {
    ReportViewer reportViewer;
    async void SetPageMode()
    {
        await reportViewer.SetPageModeAsync(PageMode.SinglePage);
    }
}
````

