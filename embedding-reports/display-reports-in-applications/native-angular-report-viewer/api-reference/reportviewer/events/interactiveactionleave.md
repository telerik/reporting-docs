---
title: interactiveActionLeave
page_title: interactiveActionLeave event
description: "Event emitted when the cursor leaves the interactive action area. Provides an object containing information about the interactive action. The event handler receives a PageActionEventArgs object containing information about the interactive action. The PageActionEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  interactiveActionLeave"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/interactiveactionleave
published: True
reportingArea: NativeAngular
---

# The `interactiveActionLeave` event of the Native Angular Report Viewer

Event emitted when the cursor leaves the interactive action area. Provides an object containing information about the interactive action. The event handler receives a PageActionEventArgs object containing information about the interactive action. The PageActionEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  interactiveActionLeave

## Example

    ````html
<reporting-angular-viewer
 (interactiveActionLeave)="interactiveActionLeave($event)">
</reporting-angular-viewer>
````


    ````typescript
interactiveActionLeave(interactiveActionArgs: PageActionEventArgs) {
 console.log("The interactive action arguments.", interactiveActionArgs);
 console.log("This event will be emitted when the cursor leaves the interactive action area.");
};
````


