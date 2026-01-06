---
title: ScaleModeChanged
page_title: ScaleModeChanged event
description: "Gets or sets a value for the callback that will be called when the value of ScaleMode changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/scalemodechanged
published: True
reportingArea: NativeBlazor
---

# The `ScaleModeChanged` event of the Native Blazor Report Viewer

Gets or sets a value for the callback that will be called when the value of ScaleMode changes.

## Example

````C#
<ReportViewer 
    ScaleModeChanged="@OnScaleModeChanged">
</ReportViewer>

@code {
    private void OnScaleModeChanged(ScaleMode mode)
    {
    }
}
````



