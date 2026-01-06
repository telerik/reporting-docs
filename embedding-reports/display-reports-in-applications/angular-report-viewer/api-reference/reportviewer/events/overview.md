---
title: Overview
page_title: Events of the Angular Report Viewer
description: Events of the Angular Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/overview
tags: overview,events
published: True
reportingArea: AngularWrapper
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

    th {
        white-space: nowrap;
    }
</style>

# Events of the Angular Report Viewer

| Event | Description |
| ------ | ------ |
| [error]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/error%})|Callback function executed when an error occurs in the report viewer.<br>The event handler receives the event object and an arguments object containing error details.<br> error|
| [exportBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/exportbegin%})|Callback function executed prior to starting the report export command.<br>The event handler receives the event object and an arguments object containing export arguments.<br> exportBegin|
| [exportEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/exportend%})|Callback function executed when the exported document is ready for download, but prior to the actual downloading.<br>The event handler receives the event object and an arguments object containing export arguments.<br> exportEnd|
| [interactiveActionEnter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/interactiveactionenter%})|Callback function executed when the mouse cursor enters the area of an interactive action.<br>The event handler receives the event object and an arguments object containing interactive action arguments.<br> interactiveActionEnter|
| [interactiveActionExecuting]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting%})|Callback function executed before an interactive action is executed,<br>providing the ability to cancel the execution.<br>The event handler receives the event object and an arguments object containing interactive action arguments.<br> interactiveActionExecuting|
| [interactiveActionLeave]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/interactiveactionleave%})|Callback function executed when the mouse cursor leaves the area of an interactive action.<br>The event handler receives the event object and an arguments object containing interactive action arguments.<br> interactiveActionLeave|
| [pageReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/pageready%})|Callback function executed every time a page from the report is rendered and ready for display.<br>The event handler receives the event object and an arguments object containing page ready arguments.<br> pageReady|
| [printBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/printbegin%})|Callback function executed prior to starting the print report command.<br>The event handler receives the event object and an arguments object containing print arguments.<br> printBegin|
| [printEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/printend%})|Callback function executed when the print document (PDF) is ready for download, but prior to being sent to the printer.<br>The event handler receives the event object and an arguments object containing print arguments.<br> printEnd|
| [ready]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/ready%})|Callback function executed when the viewer content has been loaded and is ready.<br>The function is executed in the context of the ReportViewer object.<br> ready|
| [renderingBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/renderingbegin%})|Callback function executed when the rendering of the report begins.<br>The event handler receives the event object and an arguments object containing rendering arguments.<br>The arguments object has a deviceInfo property which is a dictionary containing information used for rendering.<br> renderingBegin|
| [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/renderingend%})|Callback function executed when the rendering of the report ends.<br>The event handler receives the event object and an arguments object containing rendering arguments.<br> renderingEnd|
| [sendEmailBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/sendemailbegin%})|Callback function executed before the report is exported and the email message is sent.<br>The event handler receives the event object and an arguments object containing send email arguments.<br> sendEmailBegin|
| [sendEmailEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/sendemailend%})|Callback function executed after the report is exported and before the email message is sent.<br>The event handler receives the event object and an arguments object containing send email arguments.<br> sendEmailEnd|
| [updateUi]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/updateui%})|Callback function executed every time the UI needs an update.<br>Can be used for changing the UI of the report viewer while interacting with reports.<br>The event handler receives the event object.<br> updateUi|
| [viewerToolTipOpening]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/angular-report-viewer/api-reference/reportviewer/events/viewertooltipopening%})|Callback function executed when a tooltip is being opened.<br>The event handler receives the event object and a tooltip arguments object containing containing tooltip information.<br> viewerToolTipOpening|


