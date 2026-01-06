---
title: viewerToolTipOpening
page_title: viewerToolTipOpening event
description: "Callback function executed when a tooltip is being opened. The event handler receives the event object and a tooltip arguments object containing containing tooltip information.  viewerToolTipOpening"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/viewertooltipopening
published: True
reportingArea: AngularWrapper
---

# The `viewerToolTipOpening` event of the Angular Report Viewer

Callback function executed when a tooltip is being opened. The event handler receives the event object and a tooltip arguments object containing containing tooltip information.  viewerToolTipOpening

## Example

````html
<tr-viewer
  [viewerToolTipOpening]="viewerToolTipOpening">
</tr-viewer>
````

````typescript
viewerToolTipOpening(e: any, args: any) {
  console.log('Opening tooltip:', args);
}
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/methods/bind%}) method.



