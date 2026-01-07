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

<style>
    table {
        display: grid;
        grid-template-columns: min-content 1fr;
    }

    thead, tbody, tr {
        display: contents;
    }

    th,
    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# Events of the Native Angular Report Viewer

| Event | Description |
| ------ | ------ |
| [beforeLoadReport]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/beforeloadreport%})|Event emitted before the rendering of a report begins.<br>Provides an opportunity to perform actions before report loading starts.<br> beforeLoadReport|
| [beginLoadReport]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/beginloadreport%})|Event emitted after the rendering of a report begins.<br>Indicates that the report rendering process has started.<br> beginLoadReport|
| [currentPageChanged]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/currentpagechanged%})|Event emitted when the current page changes.<br>Provides information about the new current page and report document ID.<br>The event handler receives an object of type 'CurrentPageOptions' containing the new current page number and report document ID.<br> currentPageChanged|
| [error]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/error%})|Event emitted when an error occurs in the viewer.<br>Provides error message details for debugging and user notification.<br>The event handler receives a 'string' argument containing the error message.<br> error<br><br>```html<br><reporting-angular-viewer<br> (error)="error($event)"><br></reporting-angular-viewer><br>```|
| [exportDocumentReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/exportdocumentready%})|Event emitted after the viewer finishes exporting the report.<br>Triggered when an export operation completes successfully.<br> exportDocumentReady|
| [exportStarted]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/exportstarted%})|Event emitted when an export operation is triggered.<br>Fired at the start of any report export process.<br> exportStarted|
| [interactiveActionEnter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/interactiveactionenter%})|Event emitted when the cursor hovers over an interactive action.<br>Provides an object containing information about the interactive action.<br>The event handler receives a PageActionEventArgs object containing information about the interactive action.<br>The PageActionEventArgs type should be imported from '@progress/telerik-common-report-viewer'.<br> interactiveActionEnter|
| [interactiveActionExecuting]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting%})|Event emitted when an interactive action is being executed.<br>Triggered for actions like drill-down, bookmarks, and hyperlinks.<br> interactiveActionExecuting|
| [interactiveActionLeave]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/interactiveactionleave%})|Event emitted when the cursor leaves the interactive action area.<br>Provides an object containing information about the interactive action.<br>The event handler receives a PageActionEventArgs object containing information about the interactive action.<br>The PageActionEventArgs type should be imported from '@progress/telerik-common-report-viewer'.<br> interactiveActionLeave|
| [loadedReportChange]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/loadedreportchange%})|Event emitted when the loaded report changes.<br>Triggered during navigation between different reports.<br> loadedReportChange|
| [navigateToReport]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/navigatetoreport%})|Event emitted when navigating to a different report.<br>Triggered by interactive actions that load a new report, such as drill-through actions.<br>The event handler receives an object of type 'ReportSourceOptions' containing the new report source options.<br>The ReportSourceOptions type should be imported from '@progress/telerik-common-report-viewer'.<br> navigateToReport|
| [pageReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/pageready%})|Event emitted when a report page is ready.<br>Provides information about the rendered page, including page number and content details.<br>The event handler receives an object of type 'PageInfo' containing details about the rendered page.<br>The 'PageInfo' type should be imported from '@progress/telerik-common-report-viewer'.<br> pageReady|
| [parametersLoaded]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/parametersloaded%})|Event emitted when report parameters are loaded.<br>Provides an array of parameter information including their values and metadata.<br>The event handler receives an array of type 'ParameterInfo[]' containing parameter information objects.<br>The ParameterInfo type should be imported from '@progress/telerik-common-report-viewer'.<br> parametersLoaded|
| [printDocumentReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/printdocumentready%})|Event emitted after the viewer finishes printing the report.<br>Indicates that the print document is ready and the print operation is complete.<br> printDocumentReady|
| [printStarted]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/printstarted%})|Event emitted when printing starts.<br>Triggered at the beginning of a print operation.<br> printStarted|
| [renderingStopped]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/renderingstopped%})|Event emitted when report rendering is stopped.<br>Triggered when the user stops an ongoing rendering operation.<br> renderingStopped|
| [reportAutoRunOff]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/reportautorunoff%})|Event emitted when report auto-run is disabled.<br>Triggered when the report requires user input for parameters before rendering.<br> reportAutoRunOff|
| [reportLoadComplete]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/reportloadcomplete%})|Event emitted after the rendering of a report ends.<br>Provides complete document information including page count, document map availability, etc.<br>The event handler receives an object of type 'DocumentInfo' containing the document information object.<br>The DocumentInfo type should be imported from '@progress/telerik-common-report-viewer'.<br> reportLoadComplete|
| [reportLoadProgress]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/reportloadprogress%})|Event emitted after each successful Get Document Info request until report rendering is complete.<br>Provides progress information during the report loading process.<br>The event handler receives an object of type 'DocumentInfo' containing the document information object.<br>The DocumentInfo type should be imported from '@progress/telerik-common-report-viewer'.<br> reportLoadProgress|
| [reportVersionMismatch]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/reportversionmismatch%})|Event emitted when there's a version mismatch between the viewer and REST service.<br>Provides an error message indicating the version incompatibility.<br>The event handler receives a 'string' argument containing the version of the Reporting REST service backend.<br> reportVersionMismatch|
| [toolTipClosing]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/tooltipclosing%})|Event emitted when a tooltip is closed.<br>Provides an object containing information about the tooltip.<br>The event handler receives a TooltipEventArgs object containing information about the tooltip.<br>The TooltipEventArgs type should be imported from '@progress/telerik-common-report-viewer'.<br> toolTipClosing|
| [toolTipOpening]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/tooltipopening%})|Event emitted when a tooltip is opened.<br>Provides an object containing information about the tooltip.<br>The event handler receives a TooltipEventArgs object containing information about the tooltip.<br>The TooltipEventArgs type should be imported from '@progress/telerik-common-report-viewer'.<br> toolTipOpening|
| [updateUI]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/reportviewer/events/updateui%})|Event emitted when the state of the viewer changes.<br>This event is triggered during various viewer operations and state transitions.<br> updateUI|


