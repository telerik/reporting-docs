---
title: beforeLoadReport
page_title: beforeLoadReport event
description: "Event emitted before the rendering of a report begins. Provides an opportunity to perform actions before report loading starts.  beforeLoadReport"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/beforeloadreport
published: True
reportingArea: NativeAngular
---

# The `beforeLoadReport` event of the Native Angular Report Viewer

Event emitted before the rendering of a report begins. Provides an opportunity to perform actions before report loading starts.  beforeLoadReport

## Example

````html
<reporting-angular-viewer
 (beforeLoadReport)="beforeLoadReport()">
</reporting-angular-viewer>
````

````typescript
beforeLoadReport() {
 console.log("This event will be emitted before the rendering of a report begins.");
};
````



