---
title: renderingStopped
page_title: renderingStopped event
description: "Event emitted when report rendering is stopped. Triggered when the user stops an ongoing rendering operation.  renderingStopped"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/renderingstopped
published: True
reportingArea: NativeAngular
---

# The `renderingStopped` event of the Native Angular Report Viewer

Event emitted when report rendering is stopped. Triggered when the user stops an ongoing rendering operation.  renderingStopped

## Example

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



