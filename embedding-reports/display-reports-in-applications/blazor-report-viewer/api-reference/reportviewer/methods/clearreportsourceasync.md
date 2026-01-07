---
title: ClearReportSourceAsync
page_title: The ClearReportSourceAsync method of the Blazor Report Viewer explained
description: "Learn more about the ClearReportSourceAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/clearreportsourceasync
tags: clearreportsourceasync
published: True
reportingArea: BlazorWrapper
position: 2
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

# The `ClearReportSourceAsync` method of the Blazor Report Viewer

Clears the current reportSource from the viewer internal state and from its persisted session in the browser.

## Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="ClearSource">Clear Report Source</button>

@code {
    ReportViewer reportViewer;
    async void ClearSource()
    {
        await reportViewer.ClearReportSourceAsync();
        // (Optional) Refresh the viewer in order to see the empty report area
        await reportViewer.RefreshReportAsync();
    }
}
````

