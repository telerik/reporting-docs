---
title: printDocumentReady
page_title: printDocumentReady property
description: "Event emitted after the viewer finishes printing the report. Indicates that the print document is ready and the print operation is complete.  printDocumentReady"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/printdocumentready
published: True
reportingArea: NativeAngular
---

# printDocumentReady

Event emitted after the viewer finishes printing the report. Indicates that the print document is ready and the print operation is complete.  printDocumentReady

## Type

`EventEmitter`

## Examples

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

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
