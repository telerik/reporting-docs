---
title: RefreshReportAsync()
page_title: The RefreshReportAsync() method of the Blazor Report Viewer explained
description: "Learn more about the RefreshReportAsync() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/refreshreportasync()
tags: refreshreportasync
published: True
reportingArea: BlazorWrapper
position: 12
---

# The `RefreshReportAsync()` method of the Blazor Report Viewer

Reloads/refreshes the current report.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="RefreshReport">Refresh Report</button>

@code {
    ReportViewer reportViewer;
    async void RefreshReport()
    {
        await reportViewer.RefreshReportAsync();
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

