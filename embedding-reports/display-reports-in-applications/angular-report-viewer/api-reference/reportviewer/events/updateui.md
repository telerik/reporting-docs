---
title: updateUi
page_title: updateUi event
description: "Callback function executed every time the UI needs an update. Can be used for changing the UI of the report viewer while interacting with reports. The event handler receives the event object.  updateUi"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/updateui
published: True
reportingArea: AngularWrapper
---

# The `updateUi` event of the Angular Report Viewer

Callback function executed every time the UI needs an update. Can be used for changing the UI of the report viewer while interacting with reports. The event handler receives the event object.  updateUi

## Example

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


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

