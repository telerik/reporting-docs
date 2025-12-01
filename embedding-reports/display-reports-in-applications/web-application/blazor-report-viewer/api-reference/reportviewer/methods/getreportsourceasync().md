---
title: GetReportSourceAsync()
page_title: The GetReportSourceAsync() method of the Blazor Report Viewer explained
description: "Learn more about the GetReportSourceAsync() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getreportsourceasync()
tags: getreportsourceasync
published: True
reportingArea: BlazorWrapper
position: 8
---

# The `GetReportSourceAsync()` method of the Blazor Report Viewer

Gets the current <xref href="Telerik.ReportViewer.Blazor.ReportSourceOptions" data-throw-if-not-resolved="false"></xref> containing the report identifier and report parameters values.

Returns: the current *System.Threading.Tasks.ValueTask{Telerik.ReportViewer.Blazor.ReportSourceOptions}* object.

````JavaScript
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

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

