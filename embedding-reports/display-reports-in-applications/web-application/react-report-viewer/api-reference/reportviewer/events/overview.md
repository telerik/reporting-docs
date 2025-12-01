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

# Events of the React Report Viewer

| Event | Description |
| ------ | ------ |
| error|Called when an error occurs. Receives two parameters: `e` (the event object) and `args` (a string containing the error message).|
| exportBegin|Called before exporting the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `format` (string), `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default export)).|
| exportEnd|Called after exporting the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `url` (string), `format` (string), `handled` (boolean), and `windowOpenTarget` (string)).|
| interactiveActionEnter|Called when entering an interactive action area. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ({@link InteractiveAction})).|
| interactiveActionExecuting|Called before an interactive action executes, allowing cancellation. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ({@link InteractiveAction}), and `cancel` (boolean, set to true to cancel the action)).|
| interactiveActionLeave|Called when leaving an interactive action area. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `action` ({@link InteractiveAction})).|
| pageReady|Called after a page of the report is ready. Receives two parameters: `e` (the event object) and `args` (an object with property: `pageContent` (string)).|
| printBegin|Called before printing the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `deviceInfo` (object), and `handled` (boolean)).|
| printEnd|Called after printing the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `url` (string), and `handled` (boolean)).|
| ready|A callback function that is called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations.|
| renderingBegin|Called before rendering the report (preview only, not for export or print). Receives two parameters: `e` (the event object) and `args` (an object with property: `deviceInfo` (object)).|
| renderingEnd|Called after rendering the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `bookmarkNodes` (array), `documentMapAvailable` (boolean), `documentMapNodes` (array), `documentReady` (boolean), and `pageCount` (number)).|
| sendEmailBegin|Called before the report is exported and the E-mail message is sent. Receives two parameters: `e` (the event object) and `args` (an object with properties: `deviceInfo` (object), `handled` (boolean), and `format` (string)).|
| sendEmailEnd|Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the event object) and `args` (an object with properties: `handled` (boolean), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string)).|
| updateUi|Called when the state of the viewer changes. Receives one parameter: `e` (the event object).|
| viewerToolTipOpening|Called before a tooltip is opened, allowing cancellation. Receives two parameters: `e` (the event object) and `args` (an object with properties: `element` (DOM element), `toolTip` (object with `title` and `text`), and `cancel` (boolean, set to true to cancel the tooltip)).|
