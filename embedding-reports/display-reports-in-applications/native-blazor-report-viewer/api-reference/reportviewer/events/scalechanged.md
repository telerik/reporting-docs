---
title: ScaleChanged
page_title: ScaleChanged event
description: "Gets or sets a value for the callback that will be called when the value of Scale changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/scalechanged
published: True
reportingArea: NativeBlazor
---

# The `ScaleChanged` event of the Native Blazor Report Viewer

Gets or sets a value for the callback that will be called when the value of Scale changes.

## Example

````C#
<ReportViewer 
    ScaleChanged="@OnScaleChanged">
</ReportViewer>

@code {
    void OnScaleChanged(double scale)
    {
    }
}
````



