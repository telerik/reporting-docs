---
title: interactiveActionExecuting
page_title: interactiveActionExecuting event
description: "Called before an interactive action executes, allowing cancellation.   Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)   and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/interactiveaction%})), and `cancel` (boolean, set to true to cancel the action))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting
published: True
reportingArea: HTML5
---

# The `interactiveActionExecuting` event of the HTML5 Report Viewer

Called before an interactive action executes, allowing cancellation.   Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)   and `args` (an object with properties: `element` (DOM element), `action` ([InteractiveAction]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/types/interactiveaction%})), and `cancel` (boolean, set to true to cancel the action)).

## Example

    ````JavaScript
$("#reportViewer1").telerik_ReportViewer({  interactiveActionExecuting: function(e, args) {    // args.action is an InteractiveAction object    if (args.action.Type === "navigateToUrl") {      var url = args.action.Value.Url;      var target = args.action.Value.Target;    }    if (args.action.Type === "navigateToReport") {      var report = args.action.Value.report;      var parameters = args.action.Value.parameters;    }  }});
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.

