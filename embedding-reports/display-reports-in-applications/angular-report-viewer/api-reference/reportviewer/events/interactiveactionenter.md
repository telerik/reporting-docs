---
title: interactiveActionEnter
page_title: interactiveActionEnter event
description: "Callback function executed when the mouse cursor enters the area of an interactive action. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionEnter"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/interactiveactionenter
published: True
reportingArea: AngularWrapper
---

# The `interactiveActionEnter` event of the Angular Report Viewer

Callback function executed when the mouse cursor enters the area of an interactive action. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionEnter

## Example

````html
<tr-viewer
  [interactiveActionEnter]="interactiveActionEnter">
</tr-viewer>
````

````typescript
interactiveActionEnter(e: any, args: any) {
  console.log('Hovering over interactive action area:', args);
}
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.



