---
title: printStarted
page_title: printStarted property
description: "Event emitted when printing starts. Triggered at the beginning of a print operation.  printStarted"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/printstarted
published: True
reportingArea: NativeAngular
---

# printStarted

Event emitted when printing starts. Triggered at the beginning of a print operation.  printStarted

## Type

`EventEmitter`

## Examples

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

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
