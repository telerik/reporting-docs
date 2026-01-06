---
title: printStarted
page_title: printStarted event
description: "Event emitted when printing starts. Triggered at the beginning of a print operation.  printStarted"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/printstarted
published: True
reportingArea: NativeAngular
---

# The `printStarted` event of the Native Angular Report Viewer

Event emitted when printing starts. Triggered at the beginning of a print operation.  printStarted

## Example

````html
<reporting-angular-viewer
 (printStarted)="printStarted($event)">
</reporting-angular-viewer>
````

````typescript
printStarted(printStartedEventArgs: PrintStartedEventArgs) {
 console.log("This event will be emitted when the printing starts.", printStartedEventArgs);
};
````



