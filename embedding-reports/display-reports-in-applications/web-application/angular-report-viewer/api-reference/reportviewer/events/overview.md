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

# Events of the Angular Report Viewer

| Event | Description |
| ------ | ------ |
| error|Callback function executed when an error occurs in the report viewer. The event handler receives the event object and an arguments object containing error details.  error|
| exportBegin|Callback function executed prior to starting the report export command. The event handler receives the event object and an arguments object containing export arguments.  exportBegin|
| exportEnd|Callback function executed when the exported document is ready for download, but prior to the actual downloading. The event handler receives the event object and an arguments object containing export arguments.  exportEnd|
| interactiveActionEnter|Callback function executed when the mouse cursor enters the area of an interactive action. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionEnter|
| interactiveActionExecuting|Callback function executed before an interactive action is executed, providing the ability to cancel the execution. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionExecuting|
| interactiveActionLeave|Callback function executed when the mouse cursor leaves the area of an interactive action. The event handler receives the event object and an arguments object containing interactive action arguments.  interactiveActionLeave|
| pageReady|Callback function executed every time a page from the report is rendered and ready for display. The event handler receives the event object and an arguments object containing page ready arguments.  pageReady|
| printBegin|Callback function executed prior to starting the print report command. The event handler receives the event object and an arguments object containing print arguments.  printBegin|
| printEnd|Callback function executed when the print document (PDF) is ready for download, but prior to being sent to the printer. The event handler receives the event object and an arguments object containing print arguments.  printEnd|
| ready|Callback function executed when the viewer content has been loaded and is ready. The function is executed in the context of the ReportViewer object.  ready|
| renderingBegin|Callback function executed when the rendering of the report begins. The event handler receives the event object and an arguments object containing rendering arguments. The arguments object has a deviceInfo property which is a dictionary containing information used for rendering.  renderingBegin|
| renderingEnd|Callback function executed when the rendering of the report ends. The event handler receives the event object and an arguments object containing rendering arguments.  renderingEnd|
| sendEmailBegin|Callback function executed before the report is exported and the email message is sent. The event handler receives the event object and an arguments object containing send email arguments.  sendEmailBegin|
| sendEmailEnd|Callback function executed after the report is exported and before the email message is sent. The event handler receives the event object and an arguments object containing send email arguments.  sendEmailEnd|
| updateUi|Callback function executed every time the UI needs an update. Can be used for changing the UI of the report viewer while interacting with reports. The event handler receives the event object.  updateUi|
| viewerToolTipOpening|Callback function executed when a tooltip is being opened. The event handler receives the event object and a tooltip arguments object containing containing tooltip information.  viewerToolTipOpening|
