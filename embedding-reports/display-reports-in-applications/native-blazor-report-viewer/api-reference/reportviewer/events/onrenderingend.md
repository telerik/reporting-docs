---
title: OnRenderingEnd
page_title: OnRenderingEnd event
description: "Occurs when the rendering of the report has ended. This event can be used to perform actions after the report has been rendered, such as updating the user interface or logging the rendering status."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/onrenderingend
published: True
reportingArea: NativeBlazor
---

# The `OnRenderingEnd` event of the Native Blazor Report Viewer

Occurs when the rendering of the report has ended. This event can be used to perform actions after the report has been rendered, such as updating the user interface or logging the rendering status.

## Example

````C#
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

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/overview%})
* [ParametersAreaVisibleChanged]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/parametersareavisiblechanged%})
* [ReportSourceChanged]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/reportsourcechanged%})

