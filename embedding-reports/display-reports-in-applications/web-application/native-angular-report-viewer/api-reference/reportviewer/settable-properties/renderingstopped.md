---
title: renderingStopped
page_title: renderingStopped property
description: "Event emitted when report rendering is stopped. Triggered when the user stops an ongoing rendering operation.  renderingStopped"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/renderingstopped
published: True
reportingArea: NativeAngular
---

# renderingStopped

Event emitted when report rendering is stopped. Triggered when the user stops an ongoing rendering operation.  renderingStopped

## Type

`EventEmitter`

## Examples

````html
<reporting-angular-viewer
 (renderingStopped)="renderingStopped()">
</reporting-angular-viewer>
````

````typescript
renderingStopped() {
 console.log("This event will be emitted when report rendering is cancelled.");
};
````

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
