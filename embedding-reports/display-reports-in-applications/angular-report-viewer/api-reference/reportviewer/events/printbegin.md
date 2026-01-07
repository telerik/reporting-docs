---
title: printBegin
page_title: printBegin event
description: "Callback function executed prior to starting the print report command. The event handler receives the event object and an arguments object containing print arguments.  printBegin"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/printbegin
published: True
reportingArea: AngularWrapper
---

# The `printBegin` event of the Angular Report Viewer

Callback function executed prior to starting the print report command. The event handler receives the event object and an arguments object containing print arguments.  printBegin

## Example

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

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/overview%})
* [printEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/printend%})
* [ready]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/ready%})

