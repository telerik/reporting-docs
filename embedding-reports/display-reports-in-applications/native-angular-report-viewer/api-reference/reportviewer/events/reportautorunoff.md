---
title: reportAutoRunOff
page_title: reportAutoRunOff event
description: "Event emitted when report auto-run is disabled. Triggered when the report requires user input for parameters before rendering.  reportAutoRunOff"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/reportautorunoff
published: True
reportingArea: NativeAngular
---

# The `reportAutoRunOff` event of the Native Angular Report Viewer

Event emitted when report auto-run is disabled. Triggered when the report requires user input for parameters before rendering.  reportAutoRunOff

## Example

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


