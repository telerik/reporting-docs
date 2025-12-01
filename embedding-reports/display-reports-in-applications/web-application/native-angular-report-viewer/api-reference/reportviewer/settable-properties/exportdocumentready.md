---
title: exportDocumentReady
page_title: exportDocumentReady property
description: "Event emitted after the viewer finishes exporting the report. Triggered when an export operation completes successfully.  exportDocumentReady"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/exportdocumentready
published: True
reportingArea: NativeAngular
---

# exportDocumentReady

Event emitted after the viewer finishes exporting the report. Triggered when an export operation completes successfully.  exportDocumentReady

## Type

`EventEmitter`

## Examples

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

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
