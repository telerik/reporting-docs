---
title: sendEmailBegin
page_title: sendEmailBegin event
description: "Callback function executed before the report is exported and the email message is sent. The event handler receives the event object and an arguments object containing send email arguments.  sendEmailBegin"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/sendemailbegin
published: True
reportingArea: AngularWrapper
---

# The `sendEmailBegin` event of the Angular Report Viewer

Callback function executed before the report is exported and the email message is sent. The event handler receives the event object and an arguments object containing send email arguments.  sendEmailBegin

## Example

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

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

