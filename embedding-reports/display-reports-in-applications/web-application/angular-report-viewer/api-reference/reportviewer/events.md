---
title: Events
page_title: Events of the Angular Report Viewer
description: Complete list of events available in the Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events
tags: events
published: True
reportingArea: AngularWrapper
position: 4
---

# Events of the Angular Report Viewer

> The report viewer exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods%}#bind) method.

## error

Callback function executed when an error occurs in the report viewer. The event handler receives the event object and an arguments object containing error details.  error

### Example

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


## exportBegin

Callback function executed prior to starting the report export command. The event handler receives the event object and an arguments object containing export arguments.  exportBegin

### Example

````html
<tr-viewer
  [exportBegin]="exportBegin">
</tr-viewer>
````

````typescript
exportBegin(e: any, args: any) {
  console.log('Export is about to begin:', args);
}
````


## exportEnd

Callback function executed when the exported document is ready for download, but prior to the actual downloading. The event handler receives the event object and an arguments object containing export arguments.  exportEnd

### Example

````html
<tr-viewer
  [exportEnd]="exportEnd">
</tr-viewer>
````

````typescript
exportEnd(e: any, args: any) {
  console.log('Export has ended:', args);
}
````


## interactiveActionEnter

Callback function executed when the mouse cursor enters the area of an interactive action. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionEnter

### Example

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


## interactiveActionExecuting

Callback function executed before an interactive action is executed, providing the ability to cancel the execution. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionExecuting

### Example

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


## interactiveActionLeave

Callback function executed when the mouse cursor leaves the area of an interactive action. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionLeave

### Example

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


## pageReady

Callback function executed every time a page from the report is rendered and ready for display. The event handler receives the event object and an arguments object containing page ready arguments.  pageReady

### Example

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


## printBegin

Callback function executed prior to starting the print report command. The event handler receives the event object and an arguments object containing print arguments.  printBegin

### Example

````html
<tr-viewer
  [printBegin]="printBegin">
</tr-viewer>
````

````typescript
printBegin(e: any, args: any) {
  console.log('Print is about to begin:', args);
}
````


## printEnd

Callback function executed when the print document (PDF) is ready for download, but prior to being sent to the printer. The event handler receives the event object and an arguments object containing print arguments.  printEnd

### Example

````html
<tr-viewer
  [printEnd]="printEnd">
</tr-viewer>
````

````typescript
printEnd(e: any, args: any) {
  console.log('Print has ended:', args);
}
````


## ready

Callback function executed when the viewer content has been loaded and is ready. The function is executed in the context of the ReportViewer object.  ready

### Example

````html
<tr-viewer
  [ready]="ready">
</tr-viewer>
````

````typescript
ready() {
  console.log('Report viewer is ready');
}
````


## renderingBegin

Callback function executed when the rendering of the report begins. The event handler receives the event object and an arguments object containing rendering arguments. The arguments object has a deviceInfo property which is a dictionary containing information used for rendering.  renderingBegin

### Example

````html
<tr-viewer
  [renderingBegin]="renderingBegin">
</tr-viewer>
````

````typescript
renderingBegin(e: any, args: any) {
  // The deviceInfo property can be used to pass a specific culture to the REST Service so it renders the report with it.
  const culture = "yourCulture";
  args.deviceInfo["CurrentCulture"] = culture;
  args.deviceInfo["CurrentUICulture"] = culture;
  console.log('Rendering has begun:', args);
}
````


## renderingEnd

Callback function executed when the rendering of the report ends. The event handler receives the event object and an arguments object containing rendering arguments.  renderingEnd

### Example

````html
<tr-viewer
  [renderingEnd]="renderingEnd">
</tr-viewer>
````

````typescript
renderingEnd(e: any, args: any) {
  console.log('Rendering has ended:', args);
}
````


## sendEmailBegin

Callback function executed before the report is exported and the email message is sent. The event handler receives the event object and an arguments object containing send email arguments.  sendEmailBegin

### Example

````html
<tr-viewer
  [sendEmailBegin]="sendEmailBegin">
</tr-viewer>
````

````typescript
sendEmailBegin(e: any, args: any) {
  console.log('Send email is about to begin:', args);
}
````


## sendEmailEnd

Callback function executed after the report is exported and before the email message is sent. The event handler receives the event object and an arguments object containing send email arguments.  sendEmailEnd

### Example

````html
<tr-viewer
  [sendEmailEnd]="sendEmailEnd">
</tr-viewer>
````

````typescript
sendEmailEnd(e: any, args: any) {
  console.log('Send email has ended:', args);
}
````


## updateUi

Callback function executed every time the UI needs an update. Can be used for changing the UI of the report viewer while interacting with reports. The event handler receives the event object.  updateUi

### Example

````html
<tr-viewer
  [updateUi]="updateUi">
</tr-viewer>
````

````typescript
updateUi(e: any) {
  console.log('Update UI:', e);
}
````


## viewerToolTipOpening

Callback function executed when a tooltip is being opened. The event handler receives the event object and a tooltip arguments object containing containing tooltip information.  viewerToolTipOpening

### Example

````html
<tr-viewer
  [viewerToolTipOpening]="viewerToolTipOpening">
</tr-viewer>
````

````typescript
viewerToolTipOpening(e: any, args: any) {
  console.log('Opening tooltip:', args);
}
````

