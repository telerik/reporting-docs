---
title: Event)()
page_title: The Event)() method of the Blazor Report Viewer explained
description: "Learn more about the Event)() method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/event)()
tags: event)
published: True
reportingArea: BlazorWrapper
position: 20
---

# The `Event)()` method of the Blazor Report Viewer

Unbinds all event handlers from the specified <xref href="Telerik.ReportViewer.Blazor.Event" data-throw-if-not-resolved="false"></xref> including anonymous ones.

Returns: the current *System.Threading.Tasks.ValueTask* object.

````JavaScript
<ReportViewer @ref="reportViewer" />
<button @onclick="UnbindEvent">Unbind All Event Handlers</button>

@code {
    ReportViewer reportViewer;
    async void UnbindEvent()
    {
        await reportViewer.UnbindAsync(Event.ExportBegin);
    }
}

````


## See Also

* [Blazor Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/overview%})

