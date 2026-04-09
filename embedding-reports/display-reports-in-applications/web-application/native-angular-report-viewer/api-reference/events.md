---
title: Events
page_title: Native Angular Report Viewer Events
description: "Learn about what are the events exposed by the Native Angular Report Viewer and how to use them in your application."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/native-angular-report-viewer/api-reference/events
tags: events,angular,report,viewer
published: True
reportingArea: NativeAngular
position: 2
---

<style>
table th:first-of-type {
	width: 30%;
}
table th:nth-of-type(2) {
	width: 70%;
}
</style>

# Events Overview

In this article, we will go over each of the currently available events, showcasing how to attach an event listener to each one as well as what information will be sent through the event.

## Events List

### updateUI

The `updateUI` event will be emitted when the state of the viewer changes.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerUpdateUIEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_updateUI.ts region=NativeAngularViewerEvents_updateUI}}

### printStarted

The `printStarted` event will be emitted when the printing starts.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerPrintStartedEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_printStarted.ts region=NativeAngularViewerEvents_printStarted}}

### printDocumentReady

The `printDocumentReady` event will be emitted after the viewer finishes printing the report.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerPrintDocumentReadyEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_printDocumentReady.ts region=NativeAngularViewerEvents_printDocumentReady}}

### exportStarted

The `exportStarted` event will be emitted when an export operation is triggered.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerExportStartedEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_exportStarted.ts region=NativeAngularViewerEvents_exportStarted}}

### exportDocumentReady

The `exportDocumentReady` event will be emitted after the viewer finishes exporting the report.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerExportDocumentReadyEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_exportDocumentReady.ts region=NativeAngularViewerEvents_exportDocumentReady}}

### beforeLoadReport

The `beforeLoadReport` event will be emitted before the rendering of a report begins.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerBeforeLoadReportEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_beforeLoadReport.ts region=NativeAngularViewerEvents_beforeLoadReport}}

### beginLoadReport

The `beginLoadReport` event will be emitted after the rendering of a report begins.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerBeginLoadReportEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_beginLoadReport.ts region=NativeAngularViewerEvents_beginLoadReport}}

### reportLoadProgress

The `reportLoadProgress` event will be emitted after each successful [`Get Document Info`](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/documents-api/get-document-info) request until the report rendering is complete.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerReportLoadProgressEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_reportLoadProgress.ts region=NativeAngularViewerEvents_reportLoadProgress}}

### reportLoadComplete

The `reportLoadComplete` event will be emitted after the rendering of a report ends.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerReportLoadCompleteEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_reportLoadComplete.ts region=NativeAngularViewerEvents_reportLoadComplete}}

### renderingStopped

The `renderingStopped` event will be emitted when report rendering is cancelled.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerRenderingStoppedEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_renderingStopped.ts region=NativeAngularViewerEvents_renderingStopped}}

### error

The `error` event will be emitted when viewer encounters an error.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerErrorEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_error.ts region=NativeAngularViewerEvents_error}}

### loadedReportChange

The `loadedReportChange` event will be emitted when the previewed report is __changed__ or __refreshed__.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerLoadedReportChangeEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_loadedReportChange.ts region=NativeAngularViewerEvents_loadedReportChange}}

### pageReady

The `pageReady` event will be emitted when the viewer content has been loaded from the template and is ready to display reports or perform any other operations on it.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerPageReadyEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_pageReady.ts region=NativeAngularViewerEvents_pageReady}}

### navigateToReport

The `navigateToReport` event will be emitted when the viewer navigates to a new report through the [`Drillthrough/Navigate To Report Action`](slug:telerikreporting/designing-reports/adding-interactivity-to-reports/actions/drillthrough-report-action).

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerNavigateToReportEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_navigateToReport.ts region=NativeAngularViewerEvents_navigateToReport}}

### currentPageChanged

The `currentPageChanged` event will be emitted when the viewer changes its currently displayed page.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerCurrentPageChangedEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_currentPageChanged.ts region=NativeAngularViewerEvents_currentPageChanged}}

### interactiveActionEnter

The `interactiveActionEnter` event will be emitted when the cursor hovers over an interactive action.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerInteractiveActionEnterEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_interactiveActionEnter.ts region=NativeAngularViewerEvents_interactiveActionEnter}}

### interactiveActionExecuting

The `interactiveActionExecuting` event will be emitted before an interactive action is executed.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerInteractiveActionExecutingEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_interactiveActionExecuting.ts region=NativeAngularViewerEvents_interactiveActionExecuting}}

### interactiveActionLeave

The `interactiveActionLeave` event will be emitted when the cursor leaves the interactive action area.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerInteractiveActionLeaveEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_interactiveActionLeave.ts region=NativeAngularViewerEvents_interactiveActionLeave}}

### toolTipOpening

The `toolTipOpening` event will be emitted when a tooltip is opened.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerToolTipOpeningEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_toolTipOpening.ts region=NativeAngularViewerEvents_toolTipOpening}}

### toolTipClosing

The `toolTipClosing` event will be emitted when a tooltip is closed.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerToolTipClosingEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_toolTipClosing.ts region=NativeAngularViewerEvents_toolTipClosing}}

### reportVersionMismatch

The `reportVersionMismatch` event will be emitted when there is a mismatch between the version of the viewer and the reporting service.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerReportVersionMismatchEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_reportVersionMismatch.ts region=NativeAngularViewerEvents_reportVersionMismatch}}

### parametersLoaded

The `parametersLoaded` event will be emitted after the [`Get Report Parameters `](slug:telerikreporting/using-reports-in-applications/host-the-report-engine-remotely/telerik-reporting-rest-services/rest-api-reference/report-parameters-api/get-report-parameters) is made.

{{source=CodeSnippets\Blazor\Docs\ReportViewers\NativeAngularViewerEvents.html region=NativeAngularViewerParametersLoadedEvent}}
{{source=CodeSnippets\Blazor\Docs\TypeScript\NativeAngularViewerEvents_parametersLoaded.ts region=NativeAngularViewerEvents_parametersLoaded}}
