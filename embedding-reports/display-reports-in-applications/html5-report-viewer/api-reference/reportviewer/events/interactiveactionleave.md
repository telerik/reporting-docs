---
title: interactiveActionLeave
page_title: interactiveActionLeave event
description: "Called when leaving an interactive action area.   Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)   and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/interactiveaction%})))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionleave
published: True
reportingArea: HTML5
---

# The `interactiveActionLeave` event of the HTML5 Report Viewer

Called when leaving an interactive action area.   Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)   and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/interactiveaction%}))).

## Example

    ````JavaScript
$("#reportViewer1").telerik_ReportViewer({  interactiveActionLeave: function(e, args) {    // args.action is an InteractiveAction object    if (args.action.Type === "toggleVisibility") {      // Custom logic for toggleVisibility action    }  }});
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.

