---
title: OnExportEnd
page_title: OnExportEnd event
description: "Event triggered when the export process has finished."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/onexportend
published: True
reportingArea: NativeBlazor
---

# The `OnExportEnd` event of the Native Blazor Report Viewer

Event triggered when the export process has finished.

## Example

    ````C#
<ReportViewer 
    OnExportEnd="@OnExportEnd">
</ReportViewer>

@code {
    private void OnExportEnd(ExportEndEventArgs args)
    {
    }
}
````


