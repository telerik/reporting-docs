---
title: Telerik.ReportViewer.BlazorNative.Parameters.Editors.ReportParameterBase
page_title: Telerik.ReportViewer.BlazorNative.Parameters.Editors.ReportParameterBase Type
description: "Represents the base class for all report parameter editors in the Telerik Reporting Blazor Native Report Viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparameterbase
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

# The `ReportParameterBase` type of the Native Blazor Report Viewer

Represents the base class for all report parameter editors in the Telerik Reporting Blazor Native Report Viewer.

## Properties

| Property | Type | Description |
| ------ | ------ | ------ |
| OnChange | `System.Func{System.Object,System.Threading.Tasks.Task}` | Function that is invoked when the value of the report parameter changes. |
| Parameter | [`Telerik.ReportViewer.BlazorNative.ReportParameterInfo`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparameterinfo%}) | Represents a parameter in a report, providing functionality to manage its properties and values. |

