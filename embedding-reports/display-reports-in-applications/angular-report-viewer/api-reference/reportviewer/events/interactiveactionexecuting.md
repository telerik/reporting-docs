---
title: interactiveActionExecuting
page_title: interactiveActionExecuting event
description: "Callback function executed before an interactive action is executed, providing the ability to cancel the execution. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionExecuting"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting
published: True
reportingArea: AngularWrapper
---

# The `interactiveActionExecuting` event of the Angular Report Viewer

Callback function executed before an interactive action is executed, providing the ability to cancel the execution. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionExecuting

## Example

````html
<tr-viewer
  [interactiveActionExecuting]="interactiveActionExecuting">
</tr-viewer>
````

````typescript
interactiveActionExecuting(e: any, args: any) {
  console.log('Interactive action is executing:', args);
}
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/overview%})
* [interactiveActionLeave]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/interactiveactionleave%})
* [pageReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/pageready%})

