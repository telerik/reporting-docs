---
title: Telerik.ReportViewer.BlazorNative.ExportStartEventArgs
page_title: Telerik.ReportViewer.BlazorNative.ExportStartEventArgs Type
description: "Represents the event arguments for the ExportStart event in the Telerik ReportViewer component."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/exportstarteventargs
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

# The `ExportStartEventArgs` type of the Native Blazor Report Viewer

Represents the event arguments for the ExportStart event in the Telerik ReportViewer component.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| DeviceInfo | [`Telerik.ReportViewer.BlazorNative.DeviceInfo`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/deviceinfo%}) | Represents device information settings used during the report export process. |
| Format | `System.String` | Gets or sets the format the report should be exported to. |
| IsCancelled | `System.Boolean` | Gets or sets a value indicating whether the export operation has been canceled. |

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/overview%})
* [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/executecommand%})
* [ExecuteCommand]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/executecommand%})
* [GetReportParameters]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/methods/getreportparameters%})

