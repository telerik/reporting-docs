---
title: GetReportParameters
page_title: The GetReportParameters method of the Native Blazor Report Viewer explained
description: "Learn more about the GetReportParameters method of the Native Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/getreportparameters
tags: getreportparameters
published: True
reportingArea: NativeBlazor
position: 3
---

# The `GetReportParameters` method of the Native Blazor Report Viewer

Retrieves the report parameters for the currently loaded report.

## Example

````C#
<ReportViewer 
    @ref="reportViewer">
</ReportViewer>
<button @onclick="GetParameters">Get Parameters</button>

@code {
    private ReportViewer reportViewer;
    private void GetParameters()
    {
        IDictionary<string, ReportParameterInfo> parameters = reportViewer.GetReportParameters();
    }
}
````


## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})

