---
title: ParameterMultiSelectTemplate
page_title: ParameterMultiSelectTemplate property
description: "Template used to render multi-select report viewer parameter editors. Allows for declaring custom multi-select report viewer parameter editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parametermultiselecttemplate
published: True
reportingArea: NativeBlazor
---

# The `ParameterMultiSelectTemplate` option of the Native Blazor Report Viewer

Template used to render multi-select report viewer parameter editors. Allows for declaring custom multi-select report viewer parameter editors.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

## Examples

````C#
<ReportViewer>
    <ParameterMultiSelectTemplate>
        @{ var selectedValue = ((IEnumerable<object>)context.Parameter.Value).Cast<object>().ToList(); }

        <TelerikMultiSelect Data="@context.Parameter.AvailableValues"
                            Value="@selectedValue"
                            Filterable="true"
                            FilterOperator="@StringFilterOperator.Contains"
                            TItem="ReportParameterValue"
                            TValue="object"
                            TextField="Name"
                            ValueField="Value"
                            ClearButton="false"
                            OnChange="@((object value) => context.Value = value)">
        </TelerikMultiSelect>
    </ParameterMultiSelectTemplate>
</ReportViewer>
````

## See Also

* [ReportParameterContext]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparametercontext%})


