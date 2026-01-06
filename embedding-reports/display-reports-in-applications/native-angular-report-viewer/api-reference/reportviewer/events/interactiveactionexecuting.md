---
title: interactiveActionExecuting
page_title: interactiveActionExecuting event
description: "Event emitted when an interactive action is being executed. Triggered for actions like drill-down, bookmarks, and hyperlinks.  interactiveActionExecuting"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting
published: True
reportingArea: NativeAngular
---

# The `interactiveActionExecuting` event of the Native Angular Report Viewer

Event emitted when an interactive action is being executed. Triggered for actions like drill-down, bookmarks, and hyperlinks.  interactiveActionExecuting

## Example

````html
<reporting-angular-viewer
 (interactiveActionExecuting)="interactiveActionExecuting($event)">
</reporting-angular-viewer>
````

````typescript
interactiveActionExecuting(pageActionEventArgs: PageActionEventArgs) {
 console.log("This event will be emitted before an interactive action is executed.");
};
````



