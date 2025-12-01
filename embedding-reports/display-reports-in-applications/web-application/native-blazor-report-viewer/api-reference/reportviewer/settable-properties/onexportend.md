---
title: OnExportEnd
page_title: OnExportEnd property
description: "Event triggered when the export process has finished."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/onexportend
published: True
reportingArea: NativeBlazor
---

# OnExportEnd

Event triggered when the export process has finished.

## Type

`Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ExportEndEventArgs}`

## Examples

````JavaScript
<ReportViewer 
    OnExportEnd="@OnExportEnd">
</ReportViewer>

@code {
    private void OnExportEnd(ExportEndEventArgs args)
    {
    }
}
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
