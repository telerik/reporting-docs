---
title: ViewMode)()
page_title: The ViewMode)() method of the Blazor Report Viewer explained
description: "Learn more about the ViewMode)() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/viewmode)()
tags: viewmode)
published: True
reportingArea: BlazorWrapper
position: 19
---

# The `ViewMode)()` method of the Blazor Report Viewer

Sets the <xref href="Telerik.ReportViewer.Blazor.ViewMode" data-throw-if-not-resolved="false"></xref> and automatically reloads the current report (if any) into the new view.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="SetViewMode">Set View Mode to Print Preview</button>

@code {
    ReportViewer reportViewer;
    async void SetViewMode()
    {
        await reportViewer.SetViewModeAsync(ViewMode.PrintPreview);
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

