---
title: printEnd
page_title: printEnd event
description: "Callback function executed when the print document (PDF) is ready for download, but prior to being sent to the printer. The event handler receives the event object and an arguments object containing print arguments.  printEnd"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/printend
published: True
reportingArea: AngularWrapper
---

# The `printEnd` event of the Angular Report Viewer

Callback function executed when the print document (PDF) is ready for download, but prior to being sent to the printer. The event handler receives the event object and an arguments object containing print arguments.  printEnd

## Example

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

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/overview%})
* [ready]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/ready%})
* [renderingBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/renderingbegin%})

