---
title: reportAutoRunOff
page_title: reportAutoRunOff property
description: "Event emitted when report auto-run is disabled. Triggered when the report requires user input for parameters before rendering.  reportAutoRunOff"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/settable-properties/reportautorunoff
published: True
reportingArea: NativeAngular
---

# reportAutoRunOff

Event emitted when report auto-run is disabled. Triggered when the report requires user input for parameters before rendering.  reportAutoRunOff

## Type

`EventEmitter`

## Examples

````html
<reporting-angular-viewer
 (reportAutoRunOff)="reportAutoRunOff()">
</reporting-angular-viewer>
````

````typescript
reportAutoRunOff() {
 console.log("This event can be emitted once the report parameters are loaded.");
 console.log("This event is emitted if and only if the report's AutoRun setting is set to false.");
};
````

## See Also

* [Native Angular Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/overview%})
