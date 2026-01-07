---
title: ready
page_title: ready event
description: "Callback function executed when the viewer content has been loaded and is ready. The function is executed in the context of the ReportViewer object.  ready"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/ready
published: True
reportingArea: AngularWrapper
---

# The `ready` event of the Angular Report Viewer

Callback function executed when the viewer content has been loaded and is ready. The function is executed in the context of the ReportViewer object.  ready

## Example

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

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/overview%})
* [renderingBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/renderingbegin%})
* [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/renderingend%})

