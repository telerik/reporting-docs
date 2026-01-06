---
title: exportStarted
page_title: exportStarted event
description: "Event emitted when an export operation is triggered. Fired at the start of any report export process.  exportStarted"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/exportstarted
published: True
reportingArea: NativeAngular
---

# The `exportStarted` event of the Native Angular Report Viewer

Event emitted when an export operation is triggered. Fired at the start of any report export process.  exportStarted

## Example

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


