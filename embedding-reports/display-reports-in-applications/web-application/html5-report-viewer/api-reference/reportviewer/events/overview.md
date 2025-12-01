---
title: Overview
page_title: Events of the HTML5 Report Viewer
description: Events of the HTML5 Report Viewer
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/overview
tags: overview,events
published: True
reportingArea: HTML5
position: 0
---

# Events of the HTML5 Report Viewer

| Event | Description |
| ------ | ------ |
| error|Called when an error occurs. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (a string containing the error message).|
| exportBegin|Called before exporting the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `format` (string), `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default export)).|
| exportEnd|Called after exporting the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `url` (string, the exported report resource URL), `format` (string), `handled` (boolean, set to true to prevent the default export operation), and `windowOpenTarget` (string, target attribute for opening the exported document, default is "self")).|
| interactiveActionEnter|Called when entering an interactive action area.   Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)   and `args` (an object with properties: `element` (DOM element), `action` ({@link InteractiveAction})).|
| interactiveActionExecuting|Called before an interactive action executes, allowing cancellation.   Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)   and `args` (an object with properties: `element` (DOM element), `action` ({@link InteractiveAction}), and `cancel` (boolean, set to true to cancel the action)).|
| interactiveActionLeave|Called when leaving an interactive action area.   Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)   and `args` (an object with properties: `element` (DOM element), `action` ({@link InteractiveAction})).|
| pageReady|Called after a page of the report is ready. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with property: `pageContent` (string), the content of the rendered report page as a resource).|
| printBegin|Called before printing the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default render and print operation)).|
| printEnd|Called after printing the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `url` (string, the printed report resource URL), and `handled` (boolean, set to true to prevent the default print operation)).|
| ready|A callback function that is called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations. The function is executed in the context of the ReportViewer object (i.e., inside the callback, `this` refers to the ReportViewer instance).|
| renderingBegin|Called before rendering the report (preview only, not for export or print). Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with property: `deviceInfo` (object), the device info used for rendering).|
| renderingEnd|Called after rendering the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `bookmarkNodes` (array), `documentMapAvailable` (boolean), `documentMapNodes` (array), `documentReady` (boolean), and `pageCount` (number)).|
| sendEmailBegin|Called before the report is exported and the E-mail message is sent. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `deviceInfo` (object), `handled` (boolean, set to true to prevent the default export and send email operations), and `format` (string, the document format of the sent report)).|
| sendEmailEnd|Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `handled` (boolean, set to true to prevent the default send email operation), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string, the exported report resource URL)).|
| updateUi|Called when the state of the viewer changes. Receives one parameter: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance).|
| viewerToolTipOpening|Called before a tooltip is opened, allowing cancellation. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `element` (DOM element), `toolTip` (object with `title` and `text`), and `cancel` (boolean, set to true to cancel the tooltip).|
