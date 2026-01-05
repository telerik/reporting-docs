---
title: ParameterDateTimeTemplate
page_title: ParameterDateTimeTemplate property
description: "Template used to render DateTime report viewer parameter editors. Allows for declaring custom DateTime report viewer parameter editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parameterdatetimetemplate
published: True
reportingArea: NativeBlazor
---

# The `ParameterDateTimeTemplate` option of the Native Blazor Report Viewer

Template used to render DateTime report viewer parameter editors. Allows for declaring custom DateTime report viewer parameter editors.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

## Examples

````C#
<ReportViewer>
    <ParameterDateTimeTemplate>
        <TelerikDatePicker Value="@((DateTime)context.Value)"
                        ValueChanged="@((DateTime value) => context.Value = value)">
        </TelerikDatePicker>
    </ParameterDateTimeTemplate>
</ReportViewer>
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
* [ReportParameterContext]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparametercontext%})
