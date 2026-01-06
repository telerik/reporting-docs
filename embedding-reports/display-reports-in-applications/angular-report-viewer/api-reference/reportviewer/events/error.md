---
title: error
page_title: error event
description: "Callback function executed when an error occurs in the report viewer. The event handler receives the event object and an arguments object containing error details.  error"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/error
published: True
reportingArea: AngularWrapper
---

# The `error` event of the Angular Report Viewer

Callback function executed when an error occurs in the report viewer. The event handler receives the event object and an arguments object containing error details.  error

## Example

````html
<tr-viewer
  [error]="error">
</tr-viewer>
````

````typescript
error(e: any, args: any) {
  console.error('Report viewer error:', args);
}
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.



