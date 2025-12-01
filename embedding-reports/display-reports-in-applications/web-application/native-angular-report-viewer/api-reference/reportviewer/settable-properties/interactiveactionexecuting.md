---
title: interactiveActionExecuting
page_title: interactiveActionExecuting property
description: "Event emitted when an interactive action is being executed. Triggered for actions like drill-down, bookmarks, and hyperlinks.  interactiveActionExecuting"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/interactiveactionexecuting
published: True
reportingArea: NativeAngular
---

# interactiveActionExecuting

Event emitted when an interactive action is being executed. Triggered for actions like drill-down, bookmarks, and hyperlinks.  interactiveActionExecuting

## Type

`EventEmitter`

## Examples

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

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
