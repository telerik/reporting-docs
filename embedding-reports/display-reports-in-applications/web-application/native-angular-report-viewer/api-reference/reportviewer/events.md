---
title: Events
page_title: Events of the Native Angular Report Viewer
description: Complete list of events available in the Native Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events
tags: events
published: True
reportingArea: NativeAngular
position: 4
---

# Events of the Native Angular Report Viewer

## beforeLoadReport

Event emitted before the rendering of a report begins. Provides an opportunity to perform actions before report loading starts.  beforeLoadReport

### Example

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


## beginLoadReport

Event emitted after the rendering of a report begins. Indicates that the report rendering process has started.  beginLoadReport

### Example

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


## currentPageChanged

Event emitted when the current page changes. Provides information about the new current page and report document ID. The event handler receives an object of type 'CurrentPageOptions' containing the new current page number and report document ID.  currentPageChanged

### Example

````html
<reporting-angular-viewer
 (currentPageChanged)="currentPageChanged($event)">
</reporting-angular-viewer>
````

````typescript
currentPageChanged(currentPageChangedEventArgs: CurrentPageChangedEventArgs) {
 console.log("The page number and document id.", currentPageChangedEventArgs);
 console.log("This event will be emitted when the viewer changes its currently displayed page.");
};
````


## error

Event emitted when an error occurs in the viewer. Provides error message details for debugging and user notification. The event handler receives a 'string' argument containing the error message.  error

```html <reporting-angular-viewer  (error)="error($event)"> </reporting-angular-viewer> ```

### Example

````typescript
error(message: string) {
 console.log("The error message.", message);
 console.log("This event will be emitted when viewer encounters an error.");
};
````


## exportDocumentReady

Event emitted after the viewer finishes exporting the report. Triggered when an export operation completes successfully.  exportDocumentReady

### Example

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


## exportStarted

Event emitted when an export operation is triggered. Fired at the start of any report export process.  exportStarted

### Example

````html
<reporting-angular-viewer
 (exportStarted)="exportStarted($event)">
</reporting-angular-viewer>
````

````typescript
exportStarted(exportStartedEventArgs: ExportStartedEventArgs) {
 console.log("This event will be emitted when an export operation is triggered.", exportStartedEventArgs);
};
````


## interactiveActionEnter

Event emitted when the cursor hovers over an interactive action. Provides an object containing information about the interactive action. The event handler receives a PageActionEventArgs object containing information about the interactive action. The PageActionEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  interactiveActionEnter

### Example

````html
<reporting-angular-viewer
 (interactiveActionEnter)="interactiveActionEnter($event)">
</reporting-angular-viewer>
````

````typescript
interactiveActionEnter(interactiveActionArgs: PageActionEventArgs) {
 console.log("The interactive action arguments.", interactiveActionArgs);
 console.log("This event will be emitted when the cursor hovers over an interactive action.");
};
````


## interactiveActionExecuting

Event emitted when an interactive action is being executed. Triggered for actions like drill-down, bookmarks, and hyperlinks.  interactiveActionExecuting

### Example

````html
<reporting-angular-viewer
 (interactiveActionExecuting)="interactiveActionExecuting($event)">
</reporting-angular-viewer>
````

````typescript
interactiveActionExecuting(pageActionEventArgs: PageActionEventArgs) {
 console.log("This event will be emitted before an interactive action is executed.");
};
````


## interactiveActionLeave

Event emitted when the cursor leaves the interactive action area. Provides an object containing information about the interactive action. The event handler receives a PageActionEventArgs object containing information about the interactive action. The PageActionEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  interactiveActionLeave

### Example

````html
<reporting-angular-viewer
 (interactiveActionLeave)="interactiveActionLeave($event)">
</reporting-angular-viewer>
````

````typescript
interactiveActionLeave(interactiveActionArgs: PageActionEventArgs) {
 console.log("The interactive action arguments.", interactiveActionArgs);
 console.log("This event will be emitted when the cursor leaves the interactive action area.");
};
````


## loadedReportChange

Event emitted when the loaded report changes. Triggered during navigation between different reports.  loadedReportChange

### Example

````html
<reporting-angular-viewer
 (loadedReportChange)="loadedReportChange()">
</reporting-angular-viewer>
````

````typescript
loadedReportChange() {
 console.log("This event will be emitted when the loaded report is changed.");
};
````


## navigateToReport

Event emitted when navigating to a different report. Triggered by interactive actions that load a new report, such as drill-through actions. The event handler receives an object of type 'ReportSourceOptions' containing the new report source options. The ReportSourceOptions type should be imported from '@progress/telerik-common-report-viewer'.  navigateToReport

### Example

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


## pageReady

Event emitted when a report page is ready. Provides information about the rendered page, including page number and content details. The event handler receives an object of type 'PageInfo' containing details about the rendered page. The 'PageInfo' type should be imported from '@progress/telerik-common-report-viewer'.  pageReady

### Example

````html
<reporting-angular-viewer
 (pageReady)="pageReady($event)">
</reporting-angular-viewer>
````

````typescript
pageReady(pageInfo: PageInfo) {
 console.log("The current page information such as the page number, the page content, etc.", pageInfo);
 console.log("This event will be emitted when the viewer content has been loaded from the template and is ready to display reports or perform any other operations on it.");
};
````


## parametersLoaded

Event emitted when report parameters are loaded. Provides an array of parameter information including their values and metadata. The event handler receives an array of type 'ParameterInfo[]' containing parameter information objects. The ParameterInfo type should be imported from '@progress/telerik-common-report-viewer'.  parametersLoaded

### Example

````html
<reporting-angular-viewer
 (parametersLoaded)="parametersLoaded($event)">
</reporting-angular-viewer>
````

````typescript
parametersLoaded(parameterInfos: ParameterInfo[]) {
 console.log("An array of the parameter values is sent via the parameterInfos object.", parameterInfos);
 console.log("This event will be emitted after the Get Report Parameters request is made.");
};
````


## printDocumentReady

Event emitted after the viewer finishes printing the report. Indicates that the print document is ready and the print operation is complete.  printDocumentReady

### Example

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


## printStarted

Event emitted when printing starts. Triggered at the beginning of a print operation.  printStarted

### Example

````html
<reporting-angular-viewer
 (printStarted)="printStarted($event)">
</reporting-angular-viewer>
````

````typescript
printStarted(printStartedEventArgs: PrintStartedEventArgs) {
 console.log("This event will be emitted when the printing starts.", printStartedEventArgs);
};
````


## renderingStopped

Event emitted when report rendering is stopped. Triggered when the user stops an ongoing rendering operation.  renderingStopped

### Example

````html
<reporting-angular-viewer
 (renderingStopped)="renderingStopped()">
</reporting-angular-viewer>
````

````typescript
renderingStopped() {
 console.log("This event will be emitted when report rendering is cancelled.");
};
````


## reportAutoRunOff

Event emitted when report auto-run is disabled. Triggered when the report requires user input for parameters before rendering.  reportAutoRunOff

### Example

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


## reportLoadComplete

Event emitted after the rendering of a report ends. Provides complete document information including page count, document map availability, etc. The event handler receives an object of type 'DocumentInfo' containing the document information object. The DocumentInfo type should be imported from '@progress/telerik-common-report-viewer'.  reportLoadComplete

### Example

````html
<reporting-angular-viewer
 (reportLoadComplete)="reportLoadComplete($event)">
</reporting-angular-viewer>
````

````typescript
reportLoadComplete(documentInfo: DocumentInfo) {
 console.log("The document information such as the page count, whether it has a document map, etc. will be sent via the documentInfo object.", documentInfo);
 console.log("This event will be emitted after the rendering of a report ends.");
};
````


## reportLoadProgress

Event emitted after each successful Get Document Info request until report rendering is complete. Provides progress information during the report loading process. The event handler receives an object of type 'DocumentInfo' containing the document information object. The DocumentInfo type should be imported from '@progress/telerik-common-report-viewer'.  reportLoadProgress

### Example

````html
<reporting-angular-viewer
 (reportLoadProgress)="reportLoadProgress($event)">
</reporting-angular-viewer>
````

````typescript
reportLoadProgress(documentInfo: DocumentInfo) {
 console.log("The documentInfo parameter will contain the current information for the report rendering progress.", documentInfo);
 console.log("This event will be emitted after each successful Get Document Info request until the report rendering is complete.");
};
````


## reportVersionMismatch

Event emitted when there's a version mismatch between the viewer and REST service. Provides an error message indicating the version incompatibility. The event handler receives a 'string' argument containing the version of the Reporting REST service backend.  reportVersionMismatch

### Example

````html
<reporting-angular-viewer
 (reportVersionMismatch)="reportVersionMismatch($event)">
</reporting-angular-viewer>
````

````typescript
reportVersionMismatch(restVersion: string) {
 console.log("REST Service version.", restVersion);
 console.log("This event will be emitted when there is mismatch between the version of the viewer and the reporting service.");
};
````


## toolTipClosing

Event emitted when a tooltip is closed. Provides an object containing information about the tooltip. The event handler receives a TooltipEventArgs object containing information about the tooltip. The TooltipEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  toolTipClosing

### Example

````html
<reporting-angular-viewer
 (toolTipClosing)="toolTipClosing($event)">
</reporting-angular-viewer>
````

````typescript
toolTipClosing(tooltipEventArgs: TooltipEventArgs) {
 console.log("The tooltip arguments.", tooltipEventArgs);
 console.log("This event will be emitted when a tooltip is closed.");
};
````


## toolTipOpening

Event emitted when a tooltip is opened. Provides an object containing information about the tooltip. The event handler receives a TooltipEventArgs object containing information about the tooltip. The TooltipEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  toolTipOpening

### Example

````html
<reporting-angular-viewer
 (toolTipOpening)="toolTipOpening($event)">
</reporting-angular-viewer>
````

````typescript
toolTipOpening(tooltipEventArgs: TooltipEventArgs) {
 console.log("The tooltip arguments.", tooltipEventArgs);
 console.log("This event will be emitted when a tooltip is opened.");
};
````


## updateUI

Event emitted when the state of the viewer changes. This event is triggered during various viewer operations and state transitions.  updateUI

### Example

````html
<reporting-angular-viewer
 (updateUI)="updateUI()">
</reporting-angular-viewer>
````

````typescript
updateUI() {
 console.log("This event handler will be called when the state of the viewer changes.");
};
````

