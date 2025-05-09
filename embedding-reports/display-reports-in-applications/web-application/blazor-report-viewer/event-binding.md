---
title: Event Binding
page_title: Handling Blazor Report Viewer Events
description: "Learn about what events are exposed by the Telerik Reporting Blazor Report Viewer and how to attach handlers to them."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/event-binding
tags: event,binding
published: True
position: 2
previous_url: /blazor-report-viewer-event-binding
---

# Event Binding Overview

The Blazor Report Viewer exposes events as properties of the `ClientEventsOptions` object. The JavaScript API of the event handlers is available in [HTML5 Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready()%}).

## Bind to a report viewer event

To attach an event handler to the viewer, specify the name of the event handler function in the `ClientEventsOptions` object. The function name should be fully qualified, e.g., `window.trvEventHandlers.exportBegin`, or just `trvEventHandlers.exportBegin` (the "*window* " qualifier is optional). The event handler functions should be implemented inside **wwwroot/index.html** (Blazor WebAssembly) or **Pages/\_Host.cshtml** (Blazor Server).

For example, we can attach handlers to the `ExportBegin` and `ExportEnd` events of the viewer:

{{source=CodeSnippets\BlazorAppSnippets\Components\Shared\_ViewerAddEvent.cshtml}}

Then, we can create the event handler functions in the **wwwroot/index.html** (Blazor WebAssembly) or **Pages/\_Host.cshtml** (Blazor Server):

{{source=CodeSnippets\BlazorAppSnippets\Components\Shared\_EventsScirpts.cshtml}}

