---
title: SetViewModeAsync
page_title: The SetViewModeAsync method of the Blazor Report Viewer explained
description: "Learn more about the SetViewModeAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/setviewmodeasync
tags: setviewmodeasync
published: True
reportingArea: BlazorWrapper
position: 19
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

# The `SetViewModeAsync` method of the Blazor Report Viewer

Sets the [`Telerik.ReportViewer.Blazor.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/viewmode%}) and automatically reloads the current report (if any) into the new view.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| viewMode | [`Telerik.ReportViewer.Blazor.ViewMode`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/viewmode%}) | No | - |

## Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetViewMode">Set View Mode to Print Preview</button>

@code {
    ReportViewer reportViewer;
    async void SetViewMode()
    {
        await reportViewer.SetViewModeAsync(ViewMode.PrintPreview);
    }
}
````

## See Also

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/overview%})
* [UnbindAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/unbindasync%})
* [UnbindAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/unbindasync%})

