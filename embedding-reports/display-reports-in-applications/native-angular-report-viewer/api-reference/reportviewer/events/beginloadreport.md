---
title: beginLoadReport
page_title: beginLoadReport event
description: "Event emitted after the rendering of a report begins. Indicates that the report rendering process has started.  beginLoadReport"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/beginloadreport
published: True
reportingArea: NativeAngular
---

# The `beginLoadReport` event of the Native Angular Report Viewer

Event emitted after the rendering of a report begins. Indicates that the report rendering process has started.  beginLoadReport

## Example

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

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/overview%})
* [currentPageChanged]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/currentpagechanged%})
* [error]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/error%})

