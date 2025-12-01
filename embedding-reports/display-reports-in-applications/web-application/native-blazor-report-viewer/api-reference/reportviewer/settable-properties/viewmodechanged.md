---
title: ViewModeChanged
page_title: ViewModeChanged property
description: "Gets or sets a value for the callback that will be called when the value of ViewMode changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/viewmodechanged
published: True
reportingArea: NativeBlazor
---

# ViewModeChanged

Gets or sets a value for the callback that will be called when the value of ViewMode changes.

## Type

`Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.ViewMode}`

## Examples

````JavaScript
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

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
