---
title: SetReportSourceAsync
page_title: The SetReportSourceAsync method of the Blazor Report Viewer explained
description: "Learn more about the SetReportSourceAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/setreportsourceasync
tags: setreportsourceasync
published: True
reportingArea: BlazorWrapper
position: 16
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

# The `SetReportSourceAsync` method of the Blazor Report Viewer

Sets the [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%}) and reloads the report.

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| reportSourceOptions | `Telerik.ReportViewer.Blazor.ReportSourceOptions` | No | - |

## Example

    ````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="SetReportSource">Set New Report Source</button>

@code {
    ReportViewer reportViewer;
    async void SetReportSource()
    {
        var newReportSource = new ReportSourceOptions("NewReport.trdp");
        await reportViewer.SetReportSourceAsync(newReportSource);
        // Refresh the report viewer to display the new report
        await reportViewer.RefreshReportAsync();
    }
}
````
