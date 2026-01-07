---
title: ParameterSingleSelectTemplate
page_title: ParameterSingleSelectTemplate property
description: "Template used to render single-select report viewer parameter editors. Allows for declaring custom single-select report viewer parameter editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parametersingleselecttemplate
published: True
reportingArea: NativeBlazor
---

# The `ParameterSingleSelectTemplate` option of the Native Blazor Report Viewer

Template used to render single-select report viewer parameter editors. Allows for declaring custom single-select report viewer parameter editors.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

## Examples

````C#
<ReportViewer>
    <ParameterSingleSelectTemplate>
        <TelerikDropDownList Data="@context.Parameter.AvailableValues"
                            Value="@context.Value"
                            DefaultText=""
                            TItem="ReportParameterValue"
                            TValue="object"
                            TextField="Name"
                            ValueField="Value"
                            OnChange="@((object value) => context.Value = value)">
        </TelerikDropDownList>
    </ParameterSingleSelectTemplate>
</ReportViewer>
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/overview%})
* [ParameterStringTemplate]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parameterstringtemplate%})
* [ParameterTemplate]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parametertemplate%})
* [ReportParameterContext]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparametercontext%})

