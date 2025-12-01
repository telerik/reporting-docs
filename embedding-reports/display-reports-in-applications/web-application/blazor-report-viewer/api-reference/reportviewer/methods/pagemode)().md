---
title: PageMode)()
page_title: The PageMode)() method of the Blazor Report Viewer explained
description: "Learn more about the PageMode)() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/pagemode)()
tags: pagemode)
published: True
reportingArea: BlazorWrapper
position: 15
---

# The `PageMode)()` method of the Blazor Report Viewer

Sets the <xref href="Telerik.ReportViewer.Blazor.PageMode" data-throw-if-not-resolved="false"></xref> and automatically reloads the current report (if any) into the new view.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="SetPageMode">Set Page Mode to Single Page</button>

@code {
    ReportViewer reportViewer;
    async void SetPageMode()
    {
        await reportViewer.SetPageModeAsync(PageMode.SinglePage);
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

