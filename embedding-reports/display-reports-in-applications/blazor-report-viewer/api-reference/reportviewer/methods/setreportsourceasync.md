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

# The `SetReportSourceAsync` method of the Blazor Report Viewer

Sets the [`Telerik.ReportViewer.Blazor.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%}) and reloads the report.

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


