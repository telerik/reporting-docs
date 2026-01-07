---
title: GetReportSourceAsync
page_title: The GetReportSourceAsync method of the Blazor Report Viewer explained
description: "Learn more about the GetReportSourceAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getreportsourceasync
tags: getreportsourceasync
published: True
reportingArea: BlazorWrapper
position: 8
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

# The `GetReportSourceAsync` method of the Blazor Report Viewer

Gets the current [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%}) containing the report identifier and report parameters values.

## Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetReportSource">Get Report Source</button>

@code {
    ReportViewer reportViewer;
    async void GetReportSource()
    {
        var reportSource = await reportViewer.GetReportSourceAsync();
        // Use reportSource as needed
    }
}
````

## See Also

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/overview%})
* [GetScaleAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getscaleasync%})
* [GetScaleModeAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getscalemodeasync%})

