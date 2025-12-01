---
title: OnRenderingEnd
page_title: OnRenderingEnd property
description: "Occurs when the rendering of the report has ended. This event can be used to perform actions after the report has been rendered, such as updating the user interface or logging the rendering status."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/onrenderingend
published: True
reportingArea: NativeBlazor
---

# OnRenderingEnd

Occurs when the rendering of the report has ended. This event can be used to perform actions after the report has been rendered, such as updating the user interface or logging the rendering status.

## Type

`Microsoft.AspNetCore.Components.EventCallback{Telerik.ReportViewer.BlazorNative.RenderingEndEventArgs}`

## Examples

````JavaScript
<ReportViewer 
    OnRenderingEnd="@OnRenderingEnd">
</ReportViewer>

@code {
    private void OnRenderingEnd(RenderingEndEventArgs args)
    {
    }
}
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
