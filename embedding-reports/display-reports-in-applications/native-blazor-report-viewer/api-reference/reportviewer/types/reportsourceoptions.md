---
title: Telerik.ReportViewer.BlazorNative.ReportSourceOptions
page_title: Telerik.ReportViewer.BlazorNative.ReportSourceOptions Type
description: "Specifies a report and initial report parameter values."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions
published: True
reportingArea: NativeBlazor
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `ReportSourceOptions` type of the Native Blazor Report Viewer

Specifies a report and initial report parameter values.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| Parameters | `System.Collections.Generic.IDictionary{System.String,System.Object}` | Gets or sets an object with properties name/value equal to the report parameters names and values used in the report definition. |
| Report | `System.String` | Gets or sets a string that uniquely identifies a report from the Reporting REST service or the Telerik Report Server.<br>On the server side this string will be converted to a ReportSource through an IReportResolver. |

## Example

````C#
@code{
    public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Report Name.trdp",
        new Dictionary<string, object>
        {
            { "ParameterName1", "Value" },
            { "ParameterName2", 2 },
            { "ParameterName3", false },
        }
    );
}
````

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/overview%})
* [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/executecommand%})
* [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/executecommand%})
* [GetReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/getreportparameters%})

