---
title: updateUI
page_title: updateUI event
description: "Event emitted when the state of the viewer changes. This event is triggered during various viewer operations and state transitions.  updateUI"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/updateui
published: True
reportingArea: NativeAngular
---

# The `updateUI` event of the Native Angular Report Viewer

Event emitted when the state of the viewer changes. This event is triggered during various viewer operations and state transitions.  updateUI

## Example

````html
<reporting-angular-viewer
 (updateUI)="updateUI()">
</reporting-angular-viewer>
````

````typescript
updateUI() {
 console.log("This event handler will be called when the state of the viewer changes.");
};
````



