---
title: ParameterDoubleTemplate
page_title: ParameterDoubleTemplate property
description: "Template used to render double report viewer parameter editors. Allows for declaring custom double report viewer parameter editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parameterdoubletemplate
published: True
reportingArea: NativeBlazor
---

# The `ParameterDoubleTemplate` option of the Native Blazor Report Viewer

Template used to render double report viewer parameter editors. Allows for declaring custom double report viewer parameter editors.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

## Examples

````C#
<ReportViewer>
    <ParameterDoubleTemplate>
        <TelerikNumericTextBox Value="@((double)context.Value)"
                            ValueChanged="@((double value) => context.Value = value)">
        </TelerikNumericTextBox>
    </ParameterDoubleTemplate>
</ReportViewer>
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
* [ReportParameterContext]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparametercontext%})
