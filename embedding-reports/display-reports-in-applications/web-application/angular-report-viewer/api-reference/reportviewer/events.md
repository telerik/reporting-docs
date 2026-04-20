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

Callback function executed when an error occurs in the report viewer. The event handler receives the event object and an arguments object containing error details.

### Example

```HTML
<tr-viewer
  [error]="error">
</tr-viewer>
```

```TypeScript
error(e: any, args: any) {
  console.error('Report viewer error:', args);
}
```


## exportBegin

Callback function executed prior to starting the report export command. The event handler receives the event object and an arguments object containing export arguments.

### Example

```HTML
<tr-viewer
  [exportBegin]="exportBegin">
</tr-viewer>
```

```TypeScript
exportBegin(e: any, args: any) {
  console.log('Export is about to begin:', args);
}
```


## exportEnd

Callback function executed when the exported document is ready for download, but prior to the actual downloading. The event handler receives the event object and an arguments object containing export arguments.

### Example

```HTML
<tr-viewer
  [exportEnd]="exportEnd">
</tr-viewer>
```

```TypeScript
exportEnd(e: any, args: any) {
  console.log('Export has ended:', args);
}
```


## interactiveActionEnter

Callback function executed when the mouse cursor enters the area of an interactive action. The event handler receives the event object and an arguments object containing interactive action arguments.

### Example

```HTML
<tr-viewer
  [interactiveActionEnter]="interactiveActionEnter">
</tr-viewer>
```

```TypeScript
interactiveActionEnter(e: any, args: any) {
  console.log('Hovering over interactive action area:', args);
}
```


## interactiveActionExecuting

Callback function executed before an interactive action is executed, providing the ability to cancel the execution. The event handler receives the event object and an arguments object containing interactive action arguments.

### Example

```HTML
<tr-viewer
  [interactiveActionExecuting]="interactiveActionExecuting">
</tr-viewer>
```

```TypeScript
interactiveActionExecuting(e: any, args: any) {
  console.log('Interactive action is executing:', args);
}
```


## interactiveActionLeave

Callback function executed when the mouse cursor leaves the area of an interactive action. The event handler receives the event object and an arguments object containing interactive action arguments.

### Example

```HTML
<tr-viewer
  [interactiveActionLeave]="interactiveActionLeave">
</tr-viewer>
```

```TypeScript
interactiveActionLeave(e: any, args: any) {
  console.log('Leaving interactive action area:', args);
}
```


## pageReady

Callback function executed every time a page from the report is rendered and ready for display. The event handler receives the event object and an arguments object containing page ready arguments.

### Example

```HTML
<tr-viewer
  [pageReady]="pageReady">
</tr-viewer>
```

```TypeScript
pageReady(e: any, args: any) {
  console.log('Page is ready:', args);
}
```


## printBegin

Callback function executed prior to starting the print report command. The event handler receives the event object and an arguments object containing print arguments.

### Example

```HTML
<tr-viewer
  [printBegin]="printBegin">
</tr-viewer>
```

```TypeScript
printBegin(e: any, args: any) {
  console.log('Print is about to begin:', args);
}
```


## printEnd

Callback function executed when the print document (PDF) is ready for download, but prior to being sent to the printer. The event handler receives the event object and an arguments object containing print arguments.

### Example

```HTML
<tr-viewer
  [printEnd]="printEnd">
</tr-viewer>
```

```TypeScript
printEnd(e: any, args: any) {
  console.log('Print has ended:', args);
}
```


## ready

Callback function executed when the viewer content has been loaded and is ready. The function is executed in the context of the ReportViewer object.

### Example

```HTML
<tr-viewer
  [ready]="ready">
</tr-viewer>
```

```TypeScript
ready() {
  console.log('Report viewer is ready');
}
```


## renderingBegin

Callback function executed when the rendering of the report begins. The event handler receives the event object and an arguments object containing rendering arguments. The arguments object has a deviceInfo property which is a dictionary containing information used for rendering.

### Example

```HTML
<tr-viewer
  [renderingBegin]="renderingBegin">
</tr-viewer>
```

```TypeScript
renderingBegin(e: any, args: any) {
  // The deviceInfo property can be used to pass a specific culture to the REST Service so it renders the report with it.
  const culture = "yourCulture";
  args.deviceInfo["CurrentCulture"] = culture;
  args.deviceInfo["CurrentUICulture"] = culture;
  console.log('Rendering has begun:', args);
}
```


## renderingEnd

Callback function executed when the rendering of the report ends. The event handler receives the event object and an arguments object containing rendering arguments.

### Example

```HTML
<tr-viewer
  [renderingEnd]="renderingEnd">
</tr-viewer>
```

```TypeScript
renderingEnd(e: any, args: any) {
  console.log('Rendering has ended:', args);
}
```


## sendEmailBegin

Callback function executed before the report is exported and the email message is sent. The event handler receives the event object and an arguments object containing send email arguments.

### Example

```HTML
<tr-viewer
  [sendEmailBegin]="sendEmailBegin">
</tr-viewer>
```

```TypeScript
sendEmailBegin(e: any, args: any) {
  console.log('Send email is about to begin:', args);
}
```


## sendEmailEnd

Callback function executed after the report is exported and before the email message is sent. The event handler receives the event object and an arguments object containing send email arguments.

### Example

```HTML
<tr-viewer
  [sendEmailEnd]="sendEmailEnd">
</tr-viewer>
```

```TypeScript
sendEmailEnd(e: any, args: any) {
  console.log('Send email has ended:', args);
}
```


## updateUi

Callback function executed every time the UI needs an update. Can be used for changing the UI of the report viewer while interacting with reports. The event handler receives the event object.

### Example

```HTML
<tr-viewer
  [updateUi]="updateUi">
</tr-viewer>
```

```TypeScript
updateUi(e: any) {
  console.log('Update UI:', e);
}
```


## viewerToolTipOpening

Callback function executed when a tooltip is being opened. The event handler receives the event object and a tooltip arguments object containing containing tooltip information.

### Example

```HTML
<tr-viewer
  [viewerToolTipOpening]="viewerToolTipOpening">
</tr-viewer>
```

```TypeScript
viewerToolTipOpening(e: any, args: any) {
  console.log('Opening tooltip:', args);
}
```

