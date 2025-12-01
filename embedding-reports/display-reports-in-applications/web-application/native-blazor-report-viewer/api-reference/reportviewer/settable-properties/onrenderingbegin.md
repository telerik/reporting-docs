---
title: OnRenderingBegin
page_title: OnRenderingBegin property
description: "Occurs when the report rendering process begins, allowing for custom actions or logic to be executed prior to the rendering of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/onrenderingbegin
published: True
reportingArea: NativeBlazor
---

# OnRenderingBegin

Occurs when the report rendering process begins, allowing for custom actions or logic to be executed prior to the rendering of the report.

## Type

`Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.RenderingBeginEventArgs}`

## Examples

````JavaScript
<ReportViewer
    OnRenderingBegin="@OnRenderingBegin">
</ReportViewer>

@code {
    private void OnRenderingBegin(RenderingBeginEventArgs args)
    {
    }
}
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
