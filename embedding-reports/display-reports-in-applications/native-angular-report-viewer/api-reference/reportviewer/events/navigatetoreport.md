---
title: navigateToReport
page_title: navigateToReport event
description: "Event emitted when navigating to a different report. Triggered by interactive actions that load a new report, such as drill-through actions. The event handler receives an object of type 'ReportSourceOptions' containing the new report source options. The ReportSourceOptions type should be imported from '@progress/telerik-common-report-viewer'.  navigateToReport"
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/navigatetoreport
published: True
reportingArea: NativeAngular
---

# The `navigateToReport` event of the Native Angular Report Viewer

Event emitted when navigating to a different report. Triggered by interactive actions that load a new report, such as drill-through actions. The event handler receives an object of type 'ReportSourceOptions' containing the new report source options. The ReportSourceOptions type should be imported from '@progress/telerik-common-report-viewer'.  navigateToReport

## Example

````html
<reporting-angular-viewer
 (navigateToReport)="navigateToReport($event)">
</reporting-angular-viewer>
````

````typescript
navigateToReport(reportSourceOptions: ReportSourceOptions) {
 console.log("The report source object of the newly loaded report.", reportSourceOptions);
 console.log("This event will be emitted when the viewer navigates to a new report through the Drillthrough/Navigate To Report action.");
};
````

