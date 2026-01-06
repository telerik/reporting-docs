---
title: OnExportStart
page_title: OnExportStart event
description: "Occurs when the export process is starting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/onexportstart
published: True
reportingArea: NativeBlazor
---

# The `OnExportStart` event of the Native Blazor Report Viewer

Occurs when the export process is starting.

## Example

````C#
<ReportViewer 
    OnExportStart="@OnExportStart">
</ReportViewer>

@code {
    private void OnExportStart(ExportStartEventArgs args)
    {
    }
}
````

