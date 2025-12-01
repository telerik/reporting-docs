---
title: ScaleChanged
page_title: ScaleChanged property
description: "Gets or sets a value for the callback that will be called when the value of Scale changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/scalechanged
published: True
reportingArea: NativeBlazor
---

# ScaleChanged

Gets or sets a value for the callback that will be called when the value of Scale changes.

## Type

`Microsoft.AspNetCore.Components.EventCallback{System.Double}`

## Examples

````JavaScript
<ReportViewer 
    ScaleChanged="@OnScaleChanged">
</ReportViewer>

@code {
    void OnScaleChanged(double scale)
    {
    }
}
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
