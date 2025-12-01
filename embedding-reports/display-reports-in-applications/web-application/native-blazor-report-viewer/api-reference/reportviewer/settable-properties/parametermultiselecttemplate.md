---
title: ParameterMultiSelectTemplate
page_title: ParameterMultiSelectTemplate property
description: "Template used to render multi-select report viewer parameter editors. Allows for declaring custom multi-select report viewer parameter editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/parametermultiselecttemplate
published: True
reportingArea: NativeBlazor
---

# ParameterMultiSelectTemplate

Template used to render multi-select report viewer parameter editors. Allows for declaring custom multi-select report viewer parameter editors.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

## Examples

````JavaScript
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

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
