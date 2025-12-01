---
title: ParametersAreaVisibleChanged
page_title: ParametersAreaVisibleChanged property
description: "Gets or sets a value for the callback that will be called when the value of ParametersAreaVisible changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/parametersareavisiblechanged
published: True
reportingArea: NativeBlazor
---

# ParametersAreaVisibleChanged

Gets or sets a value for the callback that will be called when the value of ParametersAreaVisible changes.

## Type

`Microsoft.AspNetCore.Components.EventCallback{System.Boolean}`

## Examples

````JavaScript
<ReportViewer 
    ParametersAreaVisibleChanged="@OnParametersAreaVisibleChanged">
</ReportViewer>

@code {
    private void OnParametersAreaVisibleChanged(bool visible)
    {
    }
}
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
