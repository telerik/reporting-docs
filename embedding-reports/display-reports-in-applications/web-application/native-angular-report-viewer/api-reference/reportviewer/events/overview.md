---
title: Overview
page_title: Events of the Native Angular Report Viewer
description: Events of the Native Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/overview
tags: overview,events
published: True
reportingArea: NativeAngular
position: 0
---

# Events of the Native Angular Report Viewer

| Event | Description |
| ------ | ------ |
| beforeLoadReport|Event emitted before the rendering of a report begins. Provides an opportunity to perform actions before report loading starts.  beforeLoadReport|
| beginLoadReport|Event emitted after the rendering of a report begins. Indicates that the report rendering process has started.  beginLoadReport|
| currentPageChanged|Event emitted when the current page changes. Provides information about the new current page and report document ID. The event handler receives an object of type 'CurrentPageOptions' containing the new current page number and report document ID.  currentPageChanged|
| error|Event emitted when an error occurs in the viewer. Provides error message details for debugging and user notification. The event handler receives a 'string' argument containing the error message.  error  ```html <reporting-angular-viewer  (error)="error($event)"> </reporting-angular-viewer> ```|
| exportDocumentReady|Event emitted after the viewer finishes exporting the report. Triggered when an export operation completes successfully.  exportDocumentReady|
| exportStarted|Event emitted when an export operation is triggered. Fired at the start of any report export process.  exportStarted|
| interactiveActionEnter|Event emitted when the cursor hovers over an interactive action. Provides an object containing information about the interactive action. The event handler receives a PageActionEventArgs object containing information about the interactive action. The PageActionEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  interactiveActionEnter|
| interactiveActionExecuting|Event emitted when an interactive action is being executed. Triggered for actions like drill-down, bookmarks, and hyperlinks.  interactiveActionExecuting|
| interactiveActionLeave|Event emitted when the cursor leaves the interactive action area. Provides an object containing information about the interactive action. The event handler receives a PageActionEventArgs object containing information about the interactive action. The PageActionEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  interactiveActionLeave|
| loadedReportChange|Event emitted when the loaded report changes. Triggered during navigation between different reports.  loadedReportChange|
| navigateToReport|Event emitted when navigating to a different report. Triggered by interactive actions that load a new report, such as drill-through actions. The event handler receives an object of type 'ReportSourceOptions' containing the new report source options. The ReportSourceOptions type should be imported from '@progress/telerik-common-report-viewer'.  navigateToReport|
| pageReady|Event emitted when a report page is ready. Provides information about the rendered page, including page number and content details. The event handler receives an object of type 'PageInfo' containing details about the rendered page. The 'PageInfo' type should be imported from '@progress/telerik-common-report-viewer'.  pageReady|
| parametersLoaded|Event emitted when report parameters are loaded. Provides an array of parameter information including their values and metadata. The event handler receives an array of type 'ParameterInfo[]' containing parameter information objects. The ParameterInfo type should be imported from '@progress/telerik-common-report-viewer'.  parametersLoaded|
| printDocumentReady|Event emitted after the viewer finishes printing the report. Indicates that the print document is ready and the print operation is complete.  printDocumentReady|
| printStarted|Event emitted when printing starts. Triggered at the beginning of a print operation.  printStarted|
| renderingStopped|Event emitted when report rendering is stopped. Triggered when the user stops an ongoing rendering operation.  renderingStopped|
| reportAutoRunOff|Event emitted when report auto-run is disabled. Triggered when the report requires user input for parameters before rendering.  reportAutoRunOff|
| reportLoadComplete|Event emitted after the rendering of a report ends. Provides complete document information including page count, document map availability, etc. The event handler receives an object of type 'DocumentInfo' containing the document information object. The DocumentInfo type should be imported from '@progress/telerik-common-report-viewer'.  reportLoadComplete|
| reportLoadProgress|Event emitted after each successful Get Document Info request until report rendering is complete. Provides progress information during the report loading process. The event handler receives an object of type 'DocumentInfo' containing the document information object. The DocumentInfo type should be imported from '@progress/telerik-common-report-viewer'.  reportLoadProgress|
| reportVersionMismatch|Event emitted when there's a version mismatch between the viewer and REST service. Provides an error message indicating the version incompatibility. The event handler receives a 'string' argument containing the version of the Reporting REST service backend.  reportVersionMismatch|
| toolTipClosing|Event emitted when a tooltip is closed. Provides an object containing information about the tooltip. The event handler receives a TooltipEventArgs object containing information about the tooltip. The TooltipEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  toolTipClosing|
| toolTipOpening|Event emitted when a tooltip is opened. Provides an object containing information about the tooltip. The event handler receives a TooltipEventArgs object containing information about the tooltip. The TooltipEventArgs type should be imported from '@progress/telerik-common-report-viewer'.  toolTipOpening|
| updateUI|Event emitted when the state of the viewer changes. This event is triggered during various viewer operations and state transitions.  updateUI|
