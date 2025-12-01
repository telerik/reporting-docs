---
title: String)(, )
page_title: The String)(, ) method of the Blazor Report Viewer explained
description: "Learn more about the String)(, ) method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/string)(,-)
tags: string)
published: True
reportingArea: BlazorWrapper
position: 21
---

# The `String)(, )` method of the Blazor Report Viewer

Unbinds event handlers from the specified <xref href="Telerik.ReportViewer.Blazor.Event" data-throw-if-not-resolved="false"></xref>.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="UnbindEvent">Unbind Event Handler</button>

@code {
    ReportViewer reportViewer;
    async void UnbindEvent()
    {
        await reportViewer.UnbindAsync(Event.ExportBegin, "myExportBeginHandler");
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

