---
title: ParameterIntegerTemplate
page_title: ParameterIntegerTemplate property
description: "Template used to render integer report viewer parameter editors. Allows for declaring custom integer report viewer parameter editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parameterintegertemplate
published: True
reportingArea: NativeBlazor
---

# The `ParameterIntegerTemplate` option of the Native Blazor Report Viewer

Template used to render integer report viewer parameter editors. Allows for declaring custom integer report viewer parameter editors.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

## Examples

````C#
<ReportViewer>
    <ParameterIntegerTemplate>
        <TelerikNumericTextBox Value="@((long)context.Value)"
                            ValueChanged="@((long value) => context.Value = value)">
        </TelerikNumericTextBox>
    </ParameterIntegerTemplate>
</ReportViewer>
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/overview%})
* [ParameterMultiSelectTemplate]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parametermultiselecttemplate%})
* [ParametersAreaVisible]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parametersareavisible%})
* [ReportParameterContext]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparametercontext%})

