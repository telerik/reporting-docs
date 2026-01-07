---
title: interactiveActionLeave
page_title: interactiveActionLeave event
description: "Callback function executed when the mouse cursor leaves the area of an interactive action. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionLeave"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/interactiveactionleave
published: True
reportingArea: AngularWrapper
---

# The `interactiveActionLeave` event of the Angular Report Viewer

Callback function executed when the mouse cursor leaves the area of an interactive action. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionLeave

## Example

````html
<tr-viewer
  [interactiveActionLeave]="interactiveActionLeave">
</tr-viewer>
````

````typescript
interactiveActionLeave(e: any, args: any) {
  console.log('Leaving interactive action area:', args);
}
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/overview%})
* [pageReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/pageready%})
* [printBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/printbegin%})

