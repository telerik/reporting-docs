---
title: ReportSourceChanged
page_title: ReportSourceChanged property
description: "Gets or sets a value for the callback that will be called when the value of ReportSource changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/reportsourcechanged
published: True
reportingArea: NativeBlazor
---

# ReportSourceChanged

Gets or sets a value for the callback that will be called when the value of ReportSource changes.

## Type

`Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ReportSourceOptions}`

## Examples

````JavaScript
<ReportViewer 
    ReportSourceChanged="@OnReportSourceChanged">
</ReportViewer>

@code {
    private void OnReportSourceChanged(ReportSourceOptions options)
    {
    }
}
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
