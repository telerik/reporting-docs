---
title: loadedReportChange
page_title: loadedReportChange event
description: "Event emitted when the loaded report changes. Triggered during navigation between different reports.  loadedReportChange"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/loadedreportchange
published: True
reportingArea: NativeAngular
---

# The `loadedReportChange` event of the Native Angular Report Viewer

Event emitted when the loaded report changes. Triggered during navigation between different reports.  loadedReportChange

## Example

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


