---
title: ReportSource
page_title: ReportSource property
description: "Gets or sets the Telerik.ReportViewer.BlazorNative.ReportSourceOptions used to determine which report will be displayed by the viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/reportsource
published: True
reportingArea: NativeBlazor
---

# The `ReportSource` option of the Native Blazor Report Viewer

Gets or sets the [`Telerik.ReportViewer.BlazorNative.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%}) used to determine which report will be displayed by the viewer.

## Type

[`Telerik.ReportViewer.BlazorNative.ReportSourceOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%})

## Examples

````C#
<ReportViewer 
    @bind-ReportSource="@ReportSource">
</ReportViewer>

@code {
    public ReportSourceOptions ReportSource { get; set; } = new ReportSourceOptions("Report Name.trdp",
        new Dictionary<string, object>
        {
            { "ParameterName1", "Value" },
            { "ParameterName2", 2 },
            { "ParameterName3", false },
        }
    );
}
````

## See Also

* [ReportSourceOptions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/types/reportsourceoptions%})


