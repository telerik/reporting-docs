---
title: ScaleModeChanged
page_title: ScaleModeChanged property
description: "Gets or sets a value for the callback that will be called when the value of ScaleMode changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/scalemodechanged
published: True
reportingArea: NativeBlazor
---

# ScaleModeChanged

Gets or sets a value for the callback that will be called when the value of ScaleMode changes.

## Type

`Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ScaleMode}`

## Examples

````JavaScript
<ReportViewer 
    ScaleModeChanged="@OnScaleModeChanged">
</ReportViewer>

@code {
    private void OnScaleModeChanged(ScaleMode mode)
    {
    }
}
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
