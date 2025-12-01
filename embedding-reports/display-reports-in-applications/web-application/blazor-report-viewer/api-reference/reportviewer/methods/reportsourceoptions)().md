---
title: ReportSourceOptions)()
page_title: The ReportSourceOptions)() method of the Blazor Report Viewer explained
description: "Learn more about the ReportSourceOptions)() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/reportsourceoptions)()
tags: reportsourceoptions)
published: True
reportingArea: BlazorWrapper
position: 16
---

# The `ReportSourceOptions)()` method of the Blazor Report Viewer

Sets the <xref href="Telerik.ReportViewer.Blazor.ReportSourceOptions" data-throw-if-not-resolved="false"></xref> and reloads the report.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
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


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

