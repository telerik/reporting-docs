---
title: GetReportParameters
page_title: The GetReportParameters method of the Blazor Report Viewer explained
description: "Learn more about the GetReportParameters method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getreportparameters
tags: getreportparameters
published: True
reportingArea: BlazorWrapper
position: 7
---

# The `GetReportParameters` method of the Blazor Report Viewer

Gets the report viewer's current parameters as a dictionary of parameter name and value pairs.

## Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="GetParameters">Get Report Parameters</button>

@code {
    ReportViewer reportViewer;
    async void GetParameters()
    {
        var parameters = await reportViewer.GetReportParameters();
        // Use parameters as needed
    }
}
````


