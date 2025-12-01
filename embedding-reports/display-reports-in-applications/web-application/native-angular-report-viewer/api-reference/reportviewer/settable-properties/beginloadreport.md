---
title: beginLoadReport
page_title: beginLoadReport property
description: "Event emitted after the rendering of a report begins. Indicates that the report rendering process has started.  beginLoadReport"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/beginloadreport
published: True
reportingArea: NativeAngular
---

# beginLoadReport

Event emitted after the rendering of a report begins. Indicates that the report rendering process has started.  beginLoadReport

## Type

`EventEmitter`

## Examples

````html
<reporting-angular-viewer
 (beginLoadReport)="beginLoadReport()">
</reporting-angular-viewer>
````

````typescript
beginLoadReport() {
 console.log("This event will be emitted after the rendering of a report begins.");
};
````

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
