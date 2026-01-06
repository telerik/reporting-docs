---
title: exportEnd
page_title: exportEnd event
description: "Callback function executed when the exported document is ready for download, but prior to the actual downloading. The event handler receives the event object and an arguments object containing export arguments.  exportEnd"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/exportend
published: True
reportingArea: AngularWrapper
---

# The `exportEnd` event of the Angular Report Viewer

Callback function executed when the exported document is ready for download, but prior to the actual downloading. The event handler receives the event object and an arguments object containing export arguments.  exportEnd

## Example

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

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.



