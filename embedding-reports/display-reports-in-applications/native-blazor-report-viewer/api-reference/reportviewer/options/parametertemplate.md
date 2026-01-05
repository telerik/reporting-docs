---
title: ParameterTemplate
page_title: ParameterTemplate property
description: "Generic template used to render report viewer parameter editors. Allows for declaring custom report viewer parameter editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/parametertemplate
published: True
reportingArea: NativeBlazor
---

# The `ParameterTemplate` option of the Native Blazor Report Viewer

Generic template used to render report viewer parameter editors. Allows for declaring custom report viewer parameter editors.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

## Examples

````C#
<ReportViewer>
    <ParameterTemplate>
        @if (context.Parameter.AvailableValues?.Count > 0)
        {
            if (context.Parameter.Multivalue)
            {
                var selectedValue = ((IEnumerable<object>)context.Parameter.Value).Cast<object>().ToList();

                <TelerikMultiSelect Data="@context.Parameter.AvailableValues" Value="@selectedValue" Filterable="true"
                    FilterOperator="@StringFilterOperator.Contains" TItem="ReportParameterValue" TValue="object"
                    TextField="Name" ValueField="Value" ShowClearButton="false"
                    OnChange="@((object value) => context.Value = value)">
                </TelerikMultiSelect>
            }
            else
            {
                <TelerikDropDownList Data="@context.Parameter.AvailableValues" Value="@context.Value" DefaultText=""
                    TItem="ReportParameterValue" TValue="object" TextField="Name" ValueField="Value"
                    OnChange="@((object value) => context.Value = value)">
                </TelerikDropDownList>
            }
        }
        else
        {
            if (context.Parameter.Type == "System.DateTime")
            {
                <TelerikDatePicker Value="@((DateTime)context.Value)"
                    ValueChanged="@((DateTime value) => context.Value = value)">
                </TelerikDatePicker>
            }
            else if (context.Parameter.Type == "System.Int64")
            {
                <TelerikNumericTextBox Value="@((long)context.Value)" ValueChanged="@((long value) => context.Value = value)">
                </TelerikNumericTextBox>
            }
            else if (context.Parameter.Type == "System.Double")
            {
                <TelerikNumericTextBox Value="@((double)context.Value)"
                    ValueChanged="@((double value) => context.Value = value)">
                </TelerikNumericTextBox>
            }
            else if (context.Parameter.Type == "System.Boolean")
            {
                <TelerikCheckBox Value="@((bool)context.Value)" ValueChanged="@((bool value) => context.Value = value)">
                </TelerikCheckBox>
            }
            else if (context.Parameter.Type == "System.String")
            {
                <TelerikTextBox Value="@((string)context.Value)" ValueChanged="@((string value) => context.Value = value)">
                </TelerikTextBox>
            }
        }
    </ParameterTemplate>
</ReportViewer>
````

## See Also

* [ReportParameterContext]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportparametercontext%})
