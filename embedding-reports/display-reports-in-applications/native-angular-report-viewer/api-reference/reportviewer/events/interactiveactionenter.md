---
title: interactiveActionEnter
page_title: interactiveActionEnter event
description: "Event emitted when the cursor hovers over an interactive action. Provides an object containing information about the interactive action. The event handler receives a PageActionEventArgs object containing information about the interactive action. The PageActionEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  interactiveActionEnter"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/interactiveactionenter
published: True
reportingArea: NativeAngular
---

# The `interactiveActionEnter` event of the Native Angular Report Viewer

Event emitted when the cursor hovers over an interactive action. Provides an object containing information about the interactive action. The event handler receives a PageActionEventArgs object containing information about the interactive action. The PageActionEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  interactiveActionEnter

## Example

````html
<reporting-angular-viewer
 (interactiveActionEnter)="interactiveActionEnter($event)">
</reporting-angular-viewer>
````

````typescript
interactiveActionEnter(interactiveActionArgs: PageActionEventArgs) {
 console.log("The interactive action arguments.", interactiveActionArgs);
 console.log("This event will be emitted when the cursor hovers over an interactive action.");
};
````



