---
title: renderingEnd
page_title: renderingEnd event
description: "Callback function executed when the rendering of the report ends. The event handler receives the event object and an arguments object containing rendering arguments.  renderingEnd"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/renderingend
published: True
reportingArea: AngularWrapper
---

# The `renderingEnd` event of the Angular Report Viewer

Callback function executed when the rendering of the report ends. The event handler receives the event object and an arguments object containing rendering arguments.  renderingEnd

## Example

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

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/overview%})
* [sendEmailBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/sendemailbegin%})
* [sendEmailEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/sendemailend%})

