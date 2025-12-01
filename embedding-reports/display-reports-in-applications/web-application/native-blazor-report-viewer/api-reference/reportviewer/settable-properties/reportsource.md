---
title: ReportSource
page_title: ReportSource property
description: "Gets or sets the <xref href=\"Telerik.ReportViewer.BlazorNative.ReportSourceOptions\" data-throw-if-not-resolved=\"false\"></xref> used to determine which report will be displayed by the viewer."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/settable-properties/reportsource
published: True
reportingArea: NativeBlazor
---

# ReportSource

Gets or sets the <xref href="Telerik.ReportViewer.BlazorNative.ReportSourceOptions" data-throw-if-not-resolved="false"></xref> used to determine which report will be displayed by the viewer.

## Type

`Telerik.ReportViewer.BlazorNative.ReportSourceOptions`

## Examples

````JavaScript
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

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
