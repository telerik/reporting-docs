---
title: sendEmailEnd
page_title: sendEmailEnd event
description: "Callback function executed after the report is exported and before the email message is sent. The event handler receives the event object and an arguments object containing send email arguments.  sendEmailEnd"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/sendemailend
published: True
reportingArea: AngularWrapper
---

# The `sendEmailEnd` event of the Angular Report Viewer

Callback function executed after the report is exported and before the email message is sent. The event handler receives the event object and an arguments object containing send email arguments.  sendEmailEnd

## Example

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

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

