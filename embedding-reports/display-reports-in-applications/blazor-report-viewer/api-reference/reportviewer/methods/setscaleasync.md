---
title: SetScaleAsync
page_title: The SetScaleAsync method of the Blazor Report Viewer explained
description: "Learn more about the SetScaleAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/setscaleasync
tags: setscaleasync
published: True
reportingArea: BlazorWrapper
position: 17
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

# The `SetScaleAsync` method of the Blazor Report Viewer

Sets the report viewer's scale factor.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| scale | `System.Double` | No | - |

## Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetScale">Set Scale to 150%</button>

@code {
    ReportViewer reportViewer;
    async void SetScale()
    {
        await reportViewer.SetScaleAsync(1.5);
    }
}
````

