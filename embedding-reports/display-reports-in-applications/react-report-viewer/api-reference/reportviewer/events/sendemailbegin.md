---
title: sendEmailBegin
page_title: sendEmailBegin event
description: "Called before the report is exported and the E-mail message is sent. Receives two parameters: `e` (the event object) and `args` (an object with properties: `deviceInfo` (object), `handled` (boolean), and `format` (string))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/sendemailbegin
published: True
reportingArea: React
---

# The `sendEmailBegin` event of the React Report Viewer

Called before the report is exported and the E-mail message is sent. Receives two parameters: `e` (the event object) and `args` (an object with properties: `deviceInfo` (object), `handled` (boolean), and `format` (string)).

## Example

````JavaScript
// Send email begin handler<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  sendEmailBegin={(e, args) => {    console.log("About to export and send report in format: " + args.format);  }}/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.



