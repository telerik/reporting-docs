---
title: BindAsync
page_title: The BindAsync method of the Blazor Report Viewer explained
description: "Learn more about the BindAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/bindasync
tags: bindasync
published: True
reportingArea: BlazorWrapper
position: 1
---

# The `BindAsync` method of the Blazor Report Viewer

Binds event handlers to the specified [`Telerik.ReportViewer.Blazor.Event`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/event%}).

## Example

````C#
<ReportViewer @ref="reportViewer" />
<button @onclick="BindEvent">Bind Event Handler</button>

@code {
    ReportViewer reportViewer;
    async void BindEvent()
    {
        await reportViewer.BindAsync(Event.ExportBegin, "myExportBeginHandler");
    }
}
````


