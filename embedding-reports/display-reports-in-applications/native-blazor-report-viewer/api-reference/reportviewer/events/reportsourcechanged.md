---
title: ReportSourceChanged
page_title: ReportSourceChanged event
description: "Gets or sets a value for the callback that will be called when the value of ReportSource changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/reportsourcechanged
published: True
reportingArea: NativeBlazor
---

# The `ReportSourceChanged` event of the Native Blazor Report Viewer

Gets or sets a value for the callback that will be called when the value of ReportSource changes.

## Example

````C#
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

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/overview%})
* [ScaleChanged]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/scalechanged%})
* [ScaleModeChanged]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/scalemodechanged%})

