---
title: exportStarted
page_title: exportStarted property
description: "Event emitted when an export operation is triggered. Fired at the start of any report export process.  exportStarted"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/exportstarted
published: True
reportingArea: NativeAngular
---

# exportStarted

Event emitted when an export operation is triggered. Fired at the start of any report export process.  exportStarted

## Type

`EventEmitter`

## Examples

````html
<reporting-angular-viewer
 (exportStarted)="exportStarted($event)">
</reporting-angular-viewer>
````

````typescript
exportStarted(exportStartedEventArgs: ExportStartedEventArgs) {
 console.log("This event will be emitted when an export operation is triggered.", exportStartedEventArgs);
};
````

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
