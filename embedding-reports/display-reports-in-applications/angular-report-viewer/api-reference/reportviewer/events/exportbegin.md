---
title: exportBegin
page_title: exportBegin event
description: "Callback function executed prior to starting the report export command. The event handler receives the event object and an arguments object containing export arguments.  exportBegin"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/exportbegin
published: True
reportingArea: AngularWrapper
---

# The `exportBegin` event of the Angular Report Viewer

Callback function executed prior to starting the report export command. The event handler receives the event object and an arguments object containing export arguments.  exportBegin

## Example

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

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/overview%})
* [exportEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/exportend%})
* [interactiveActionEnter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/interactiveactionenter%})

