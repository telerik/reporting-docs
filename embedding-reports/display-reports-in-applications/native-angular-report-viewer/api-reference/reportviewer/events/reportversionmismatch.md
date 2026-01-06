---
title: reportVersionMismatch
page_title: reportVersionMismatch event
description: "Event emitted when there's a version mismatch between the viewer and REST service. Provides an error message indicating the version incompatibility. The event handler receives a 'string' argument containing the version of the Reporting REST service backend.  reportVersionMismatch"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/reportversionmismatch
published: True
reportingArea: NativeAngular
---

# The `reportVersionMismatch` event of the Native Angular Report Viewer

Event emitted when there's a version mismatch between the viewer and REST service. Provides an error message indicating the version incompatibility. The event handler receives a 'string' argument containing the version of the Reporting REST service backend.  reportVersionMismatch

## Example

    ````html
<reporting-angular-viewer
 (reportVersionMismatch)="reportVersionMismatch($event)">
</reporting-angular-viewer>
````


    ````typescript
reportVersionMismatch(restVersion: string) {
 console.log("REST Service version.", restVersion);
 console.log("This event will be emitted when there is mismatch between the version of the viewer and the reporting service.");
};
````


