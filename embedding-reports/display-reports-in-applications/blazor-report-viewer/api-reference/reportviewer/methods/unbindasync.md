---
title: UnbindAsync
page_title: The UnbindAsync method of the Blazor Report Viewer explained
description: "Learn more about the UnbindAsync method of the Blazor Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/unbindasync
tags: unbindasync
published: True
reportingArea: BlazorWrapper
position: 21
---

<style>
    table {
        display: grid;
        grid-template-columns: min-content min-content min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# The `UnbindAsync` method of the Blazor Report Viewer

Unbinds event handlers from the specified [`Telerik.ReportViewer.Blazor.Event`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/event%}).

## Parameters

| Parameter | Type | Optional | Description |
|-----------|------|----------|-------------|
| eventName | [`Telerik.ReportViewer.Blazor.Event`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/enumerations/event%}) | No | - |
| eventHandlerName | `System.String` | No | - |

## Example

````C#
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

* [Methods Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/overview%})
* [UnbindAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/unbindasync%})
* [BindAsync]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/methods/bindasync%})

