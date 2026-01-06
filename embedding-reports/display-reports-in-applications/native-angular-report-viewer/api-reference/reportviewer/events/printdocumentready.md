---
title: printDocumentReady
page_title: printDocumentReady event
description: "Event emitted after the viewer finishes printing the report. Indicates that the print document is ready and the print operation is complete.  printDocumentReady"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/printdocumentready
published: True
reportingArea: NativeAngular
---

# The `printDocumentReady` event of the Native Angular Report Viewer

Event emitted after the viewer finishes printing the report. Indicates that the print document is ready and the print operation is complete.  printDocumentReady

## Example

````html
<reporting-angular-viewer
 (printDocumentReady)="printDocumentReady($event)">
</reporting-angular-viewer>
````

````typescript
printDocumentReady(printDocumentReadyEventArgs: PrintDocumentReadyEventArgs) {
 console.log("This event will be emitted after the viewer finishes printing the report.", printDocumentReadyEventArgs);
};
````

