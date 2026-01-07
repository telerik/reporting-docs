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

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/overview%})
* [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/executecommand%})
* [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/executecommand%})

