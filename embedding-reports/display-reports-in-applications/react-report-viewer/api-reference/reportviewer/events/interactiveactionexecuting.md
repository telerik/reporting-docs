---
title: interactiveActionExecuting
page_title: interactiveActionExecuting event
description: "Called before an interactive action executes, allowing cancellation. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/interactiveaction%})), and `cancel` (boolean, set to true to cancel the action))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting
published: True
reportingArea: React
---

# The `interactiveActionExecuting` event of the React Report Viewer

Called before an interactive action executes, allowing cancellation. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/types/interactiveaction%})), and `cancel` (boolean, set to true to cancel the action)).

## Example

````JavaScript
// Interactive action executing handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  interactiveActionExecuting={(e, args) => {
    if (args.action.Type === "navigateToUrl") {
      const url = args.action.Value.Url;
      const target = args.action.Value.Target;
    }
  }}
/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.



