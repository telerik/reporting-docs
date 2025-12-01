---
title: ParameterStringTemplate
page_title: ParameterStringTemplate property
description: "Template used to render string report viewer parameter editors. Allows for declaring custom string report viewer parameter editors."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/read-only-properties/parameterstringtemplate
published: True
reportingArea: NativeBlazor
---

# ParameterStringTemplate

Template used to render string report viewer parameter editors. Allows for declaring custom string report viewer parameter editors.

## Type

`Microsoft.AspNetCore.Components.RenderFragment{Telerik.ReportViewer.BlazorNative.ReportParameterContext}`

## Examples

````JavaScript
<ReportViewer>
    <ParameterStringTemplate>
        <TelerikTextBox Value="@((string)context.Value)"
                        ValueChanged="@((string value) => context.Value = value)">
        </TelerikTextBox>
    </ParameterStringTemplate>
</ReportViewer>
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
