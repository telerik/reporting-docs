---
title: OnExportStart
page_title: OnExportStart property
description: "Occurs when the export process is starting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/onexportstart
published: True
reportingArea: NativeBlazor
---

# OnExportStart

Occurs when the export process is starting.

## Type

`Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ExportStartEventArgs}`

## Examples

````JavaScript
<ReportViewer 
    OnExportStart="@OnExportStart">
</ReportViewer>

@code {
    private void OnExportStart(ExportStartEventArgs args)
    {
    }
}
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
