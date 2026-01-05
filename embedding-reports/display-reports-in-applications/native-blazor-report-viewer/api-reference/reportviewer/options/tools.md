---
title: Tools
page_title: Tools property
description: "Represents the collection of tools available in the report viewer's toolbar. Allows for customizing which tools from the viewer's toolbar are visible and which ones are hidden."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/api-reference/reportviewer/options/tools
published: True
reportingArea: NativeBlazor
---

# The `Tools` option of the Native Blazor Report Viewer

Represents the collection of tools available in the report viewer's toolbar. Allows for customizing which tools from the viewer's toolbar are visible and which ones are hidden.

## Type

`System.Collections.Generic.List{Telerik.ReportViewer.BlazorNative.Tools.IReportViewerTool}`

## Examples

````C#
<ReportViewer
    Tools="@Tools">
</ReportViewer>

@code {
    public List<IReportViewerTool> Tools = new List<IReportViewerTool>
    {
        new Refresh(),
        new NavigateBackward(),
        new NavigateForward(),
        new StopRendering(),
        new FirstPage(),
        new PreviousPage(),
        new PageNumber(),
        new NextPage(),
        new LastPage(),
        new ToggleViewMode(),
        new Export(),
        new Print(),
        new ToggleDocumentMap(),
        new ToggleParametersArea()
    };
}
````

## See Also

* [Native Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-blazor-report-viewer/overview%})
