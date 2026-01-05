---
title: ParameterBooleanTemplate
page_title: ParameterBooleanTemplate property
description: "Template used to render boolean report viewer parameter editors. Allows for declaring custom boolean report viewer parameter editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parameterbooleantemplate
published: True
reportingArea: NativeBlazor
---

# The `ParameterBooleanTemplate` option of the Native Blazor Report Viewer

Template used to render boolean report viewer parameter editors. Allows for declaring custom boolean report viewer parameter editors.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

## Examples

````C#
<ReportViewer>
    <ParameterBooleanTemplate>
        <TelerikCheckBox Value="@((bool)context.Value)"
                        ValueChanged="@((bool value) => context.Value = value)">
        </TelerikCheckBox>
    </ParameterBooleanTemplate>
</ReportViewer>
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
* [ReportParameterContext]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparametercontext%})
