---
title: ViewModeChanged
page_title: ViewModeChanged event
description: "Gets or sets a value for the callback that will be called when the value of ViewMode changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/viewmodechanged
published: True
reportingArea: NativeBlazor
---

# The `ViewModeChanged` event of the Native Blazor Report Viewer

Gets or sets a value for the callback that will be called when the value of ViewMode changes.

## Example

````C#
<ReportViewer
    ViewModeChanged="@OnViewModeChanged">
</ReportViewer>

@code {
    private void OnViewModeChanged(ViewMode mode)
    {
    }
}
````

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/overview%})
* [DocumentMapVisibleChanged]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/documentmapvisiblechanged%})
* [OnExportEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/onexportend%})

