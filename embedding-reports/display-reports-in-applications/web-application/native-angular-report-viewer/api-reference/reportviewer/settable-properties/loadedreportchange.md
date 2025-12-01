---
title: loadedReportChange
page_title: loadedReportChange property
description: "Event emitted when the loaded report changes. Triggered during navigation between different reports.  loadedReportChange"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/loadedreportchange
published: True
reportingArea: NativeAngular
---

# loadedReportChange

Event emitted when the loaded report changes. Triggered during navigation between different reports.  loadedReportChange

## Type

`EventEmitter`

## Examples

````html
<reporting-angular-viewer
 (loadedReportChange)="loadedReportChange()">
</reporting-angular-viewer>
````

````typescript
loadedReportChange() {
 console.log("This event will be emitted when the loaded report is changed.");
};
````

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
