---
title: ClientEvents
page_title: ClientEvents property
description: "Gets or sets the viewer's event handler function names as strings. The function name should be fully qualified, e.g. \"window.trvEventHandlers.exportBegin\", or just \"trvEventHandlers.exportBegin\" (\"window\" qualifier is optional). The event handler functions should be implemented inside wwwroot/index.html (Blazor WebAssembly) or Pages/_Host.cshtml (Blazor Server). The JavaScript API of the event handlers is available in  https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-events-ready."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/clientevents
published: True
reportingArea: BlazorWrapper
---

# The `ClientEvents` option of the Blazor Report Viewer

Gets or sets the viewer's event handler function names as strings. The function name should be fully qualified, e.g. "window.trvEventHandlers.exportBegin", or just "trvEventHandlers.exportBegin" ("window" qualifier is optional). The event handler functions should be implemented inside wwwroot/index.html (Blazor WebAssembly) or Pages/_Host.cshtml (Blazor Server). The JavaScript API of the event handlers is available in  https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-events-ready.

## Type

[`Telerik.ReportViewer.Blazor.ClientEventsOptions`]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/clienteventsoptions%})

## Examples

````C#
<ReportViewer ClientEvents="@(new ClientEventsOptions
              {
                  Ready = "onReady",
                  Error = "onError"
              })" />

<script>
    function onReady() {
        console.log("Ready");
    }
    function onError(e, args) {
        console.log("Error:", e);
        console.log(args);
    }
</script>
````

## See Also

* [Options Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/overview%})
* [Commands]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/commands%})
* [DisabledButtonClass]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/options/disabledbuttonclass%})
* [ClientEventsOptions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/api-reference/reportviewer/types/clienteventsoptions%})

