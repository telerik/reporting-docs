---
title: updateUI
page_title: updateUI property
description: "Event emitted when the state of the viewer changes. This event is triggered during various viewer operations and state transitions.  updateUI"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/updateui
published: True
reportingArea: NativeAngular
---

# updateUI

Event emitted when the state of the viewer changes. This event is triggered during various viewer operations and state transitions.  updateUI

## Type

`EventEmitter`

## Examples

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

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
