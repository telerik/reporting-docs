---
title: interactiveActionLeave
page_title: interactiveActionLeave event
description: "Called when leaving an interactive action area. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/interactiveaction%})))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/interactiveactionleave
published: True
reportingArea: React
---

# The `interactiveActionLeave` event of the React Report Viewer

Called when leaving an interactive action area. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/interactiveaction%}))).

## Example

````JavaScript
// Interactive action leave handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  interactiveActionLeave={(e, args) => {
    if (args.action.Type === "toggleVisibility") {
      // Custom logic for toggleVisibility action
    }
  }}
/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.



