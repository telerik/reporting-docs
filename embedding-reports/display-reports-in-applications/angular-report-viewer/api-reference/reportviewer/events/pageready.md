---
title: pageReady
page_title: pageReady event
description: "Callback function executed every time a page from the report is rendered and ready for display. The event handler receives the event object and an arguments object containing page ready arguments.  pageReady"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/pageready
published: True
reportingArea: AngularWrapper
---

# The `pageReady` event of the Angular Report Viewer

Callback function executed every time a page from the report is rendered and ready for display. The event handler receives the event object and an arguments object containing page ready arguments.  pageReady

## Example

    ````html
<tr-viewer
  [pageReady]="pageReady">
</tr-viewer>
````


    ````typescript
pageReady(e: any, args: any) {
  console.log('Page is ready:', args);
}
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

