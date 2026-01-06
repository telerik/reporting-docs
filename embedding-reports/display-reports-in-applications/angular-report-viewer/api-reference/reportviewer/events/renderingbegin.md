---
title: renderingBegin
page_title: renderingBegin event
description: "Callback function executed when the rendering of the report begins. The event handler receives the event object and an arguments object containing rendering arguments. The arguments object has a deviceInfo property which is a dictionary containing information used for rendering.  renderingBegin"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/renderingbegin
published: True
reportingArea: AngularWrapper
---

# The `renderingBegin` event of the Angular Report Viewer

Callback function executed when the rendering of the report begins. The event handler receives the event object and an arguments object containing rendering arguments. The arguments object has a deviceInfo property which is a dictionary containing information used for rendering.  renderingBegin

## Example

    ````html
<tr-viewer
  [renderingBegin]="renderingBegin">
</tr-viewer>
````


    ````typescript
renderingBegin(e: any, args: any) {
  // The deviceInfo property can be used to pass a specific culture to the REST Service so it renders the report with it.
  const culture = "yourCulture";
  args.deviceInfo["CurrentCulture"] = culture;
  args.deviceInfo["CurrentUICulture"] = culture;
  console.log('Rendering has begun:', args);
}
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.

