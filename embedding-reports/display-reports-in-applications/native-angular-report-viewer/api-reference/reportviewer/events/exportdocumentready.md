---
title: exportDocumentReady
page_title: exportDocumentReady event
description: "Event emitted after the viewer finishes exporting the report. Triggered when an export operation completes successfully.  exportDocumentReady"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/exportdocumentready
published: True
reportingArea: NativeAngular
---

# The `exportDocumentReady` event of the Native Angular Report Viewer

Event emitted after the viewer finishes exporting the report. Triggered when an export operation completes successfully.  exportDocumentReady

## Example

    ````html
<reporting-angular-viewer
 (exportDocumentReady)="exportDocumentReady($event)">
</reporting-angular-viewer>
````


    ````typescript
exportDocumentReady(exportDocumentReadyEventArgs: ExportDocumentReadyEventArgs) {
 console.log("This event will be emitted after the viewer finishes exporting the report.", exportDocumentReadyEventArgs);
};
````


