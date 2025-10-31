---
title: Event Binding
page_title: Handling Blazor Report Viewer Events
description: "Learn about what are the events exposed by the Telerik Reporting Blazor Report Viewer and how to attach event handlers to said events."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/event-binding
tags: event,binding
published: True
reportingArea: BlazorWrapper
position: 2
previous_url: /blazor-report-viewer-event-binding
---

# Event Binding Overview

The Blazor Report Viewer exposes events as properties of the `ClientEventsOptions` object. The JavaScript API of the event handlers is available in [HTML5 Report Viewer Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready()%}).

## Bind to a report viewer event

To attach an event handler to the viewer, specify the name of the event handler function in the `ClientEventsOptions` object. The function name must be fully-qualified, e.g. `window.trvEventHandlers.exportBegin`, or just `trvEventHandlers.exportBegin` (the "*window* " qualifier is optional).

 The event handler functions can be implemented inside the **wwwroot/index.html** (Blazor WebAssembly) or **Pages/\_Host.cshtml** (Blazor Server) file.

For example, we can attach handlers to the `ExportBegin` and `ExportEnd` events of the viewer:

````CSHTML
<ReportViewer
	ClientEvents="@(new ClientEventsOptions() {
		ExportBegin = "trvEventHandlers.exportBegin",
		ExportEnd = "trvEventHandlers.exportEnd"
	})" />
````

Then, we can create the event handler functions in the **wwwroot/index.html** (Blazor WebAssembly) or **Pages/\_Host.cshtml** (Blazor Server):

````HTML
<script>
	window.trvEventHandlers = {
		exportBegin: function (e, args) {
			console.log("This event handler will be called before exporting the report in " + args.format + " format.");
		},
		exportEnd: function (e, args) {
			console.log("This event handler will be called after exporting the report.");
			console.log("The exported report can be found at: " + window.location.origin + args.url);
		}
	}
</script>
````
