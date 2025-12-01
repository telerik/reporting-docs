---
title: ParameterIntegerTemplate
page_title: ParameterIntegerTemplate property
description: "Template used to render integer report viewer parameter editors. Allows for declaring custom integer report viewer parameter editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/parameterintegertemplate
published: True
reportingArea: NativeBlazor
---

# ParameterIntegerTemplate

Template used to render integer report viewer parameter editors. Allows for declaring custom integer report viewer parameter editors.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

## Examples

````JavaScript
<ReportViewer>
    <ParameterIntegerTemplate>
        <TelerikNumericTextBox Value="@((long)context.Value)"
                            ValueChanged="@((long value) => context.Value = value)">
        </TelerikNumericTextBox>
    </ParameterIntegerTemplate>
</ReportViewer>
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
