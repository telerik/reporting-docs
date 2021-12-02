---
title: Event Binding
page_title: Event Binding | for Telerik Reporting Documentation
description: Event Binding
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/blazor-report-viewer/event-binding
tags: event,binding
published: True
position: 2
---

# Event Binding



The Blazor Report Viewer exposes events as properties of the __ClientEventsOptions__  object. The JavaScript API of the event handlers is available in          [HTML5 Report Viewer Events](https://docs.telerik.com/reporting/html5-report-viewer-reportviewer-events-ready) .       

## Bind to a report viewer event

To attach an event handler to the viewer, specify the name of the event handler function in the __ClientEventsOptions__  object.           The function name should be fully qualified, e.g. "*window.trvEventHandlers.exportBegin* ",           or just "*trvEventHandlers.exportBegin* " (the "*window* " qualifier is optional).           The event handler functions should be implemented inside *wwwroot/index.html*  (Blazor WebAssembly) or           *Pages/_Host.cshtml*  (Blazor Server).           For example, we can attach handlers to the __ExportBegin__  and           __ExportEnd__  events of the viewer:         

	
````c#
<ReportViewer
    ...
    ClientEvents="@(new ClientEventsOptions() {
        ExportBegin = "trvEventHandlers.exportBegin",
        ExportEnd = "trvEventHandlers.exportEnd"
    })" />
````



Then we create the event handler functions in the *wwwroot/index.html*  (Blazor WebAssembly) or           *Pages/_Host.cshtml*  (Blazor Server):         

	
````html
...
<body>
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
</body>
</html>
````

