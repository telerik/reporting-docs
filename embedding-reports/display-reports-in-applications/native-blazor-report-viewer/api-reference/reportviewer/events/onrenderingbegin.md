---
title: OnRenderingBegin
page_title: OnRenderingBegin event
description: "Occurs when the report rendering process begins, allowing for custom actions or logic to be executed prior to the rendering of the report."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/onrenderingbegin
published: True
reportingArea: NativeBlazor
---

# The `OnRenderingBegin` event of the Native Blazor Report Viewer

Occurs when the report rendering process begins, allowing for custom actions or logic to be executed prior to the rendering of the report.

## Example

````C#
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

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/overview%})
* [OnRenderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/onrenderingend%})
* [ParametersAreaVisibleChanged]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/parametersareavisiblechanged%})

