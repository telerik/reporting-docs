---
title: ParametersAreaVisibleChanged
page_title: ParametersAreaVisibleChanged event
description: "Gets or sets a value for the callback that will be called when the value of ParametersAreaVisible changes."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/events/parametersareavisiblechanged
published: True
reportingArea: NativeBlazor
---

# The `ParametersAreaVisibleChanged` event of the Native Blazor Report Viewer

Gets or sets a value for the callback that will be called when the value of ParametersAreaVisible changes.

## Example

````C#
<ReportViewer 
    ParametersAreaVisibleChanged="@OnParametersAreaVisibleChanged">
</ReportViewer>

@code {
    private void OnParametersAreaVisibleChanged(bool visible)
    {
    }
}
````

