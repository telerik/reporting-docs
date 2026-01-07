---
title: Telerik.ReportViewer.Blazor.CommandBase
page_title: Telerik.ReportViewer.Blazor.CommandBase Type
description: "Specifies a report viewer command."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/commandbase
published: True
reportingArea: BlazorWrapper
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

# The `CommandBase` type of the Blazor Report Viewer

Specifies a report viewer command.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| GetCheckedStatusAsync | `System.Threading.Tasks.ValueTask{System.Boolean}` | Returns a bool value which indicates the checked state of the UI associated with the command. |
| GetEnabledStatusAsync | `System.Threading.Tasks.ValueTask{System.Boolean}` | Returns a bool value which indicates the enabled state of the UI associated with the command. |

## See Also

* [Types Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/overview%})
* [BindAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/bindasync%})
* [ClearReportSourceAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/clearreportsourceasync%})
* [GetAccessibilityKeyMapAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/getaccessibilitykeymapasync%})

