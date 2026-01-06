---
title: Overview
page_title: Events of the React Report Viewer
description: Events of the React Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/overview
tags: overview,events
published: True
reportingArea: React
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

    td:not(:last-child) {
        white-space: nowrap;
    }
</style>

# Events of the React Report Viewer

| Event | Description |
| ------ | ------ |
| [error]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/error%})|Called when an error occurs. Receives two parameters: `e` (the event object) and `args` (a string containing the error message).|
| [exportBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/exportbegin%})|Called before exporting the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `format` (string), `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default export)).|
| [exportEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/exportend%})|Called after exporting the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `url` (string), `format` (string), `handled` (boolean), and `windowOpenTarget` (string)).|
| [interactiveActionEnter]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/interactiveactionenter%})|Called when entering an interactive action area. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ({@link InteractiveAction})).|
| [interactiveActionExecuting]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting%})|Called before an interactive action executes, allowing cancellation. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ({@link InteractiveAction}), and `cancel` (boolean, set to true to cancel the action)).|
| [interactiveActionLeave]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/interactiveactionleave%})|Called when leaving an interactive action area. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ({@link InteractiveAction})).|
| [pageReady]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/pageready%})|Called after a page of the report is ready. Receives two parameters: `e` (the event object) and `args` (an object with property: `pageContent` (string)).|
| [printBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/printbegin%})|Called before printing the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `deviceInfo` (object), and `handled` (boolean)).|
| [printEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/printend%})|Called after printing the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `url` (string), and `handled` (boolean)).|
| [ready]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/ready%})|A callback function that is called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations.|
| [renderingBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/renderingbegin%})|Called before rendering the report (preview only, not for export or print). Receives two parameters: `e` (the event object) and `args` (an object with property: `deviceInfo` (object)).|
| [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/renderingend%})|Called after rendering the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `bookmarkNodes` (array), `documentMapAvailable` (boolean), `documentMapNodes` (array), `documentReady` (boolean), and `pageCount` (number)).|
| [sendEmailBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/sendemailbegin%})|Called before the report is exported and the E-mail message is sent. Receives two parameters: `e` (the event object) and `args` (an object with properties: `deviceInfo` (object), `handled` (boolean), and `format` (string)).|
| [sendEmailEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/sendemailend%})|Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the event object) and `args` (an object with properties: `handled` (boolean), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string)).|
| [updateUi]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/updateui%})|Called when the state of the viewer changes. Receives one parameter: `e` (the event object).|
| [viewerToolTipOpening]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/viewertooltipopening%})|Called before a tooltip is opened, allowing cancellation. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `toolTip` (object with `title` and `text`), and `cancel` (boolean, set to true to cancel the tooltip)).|


