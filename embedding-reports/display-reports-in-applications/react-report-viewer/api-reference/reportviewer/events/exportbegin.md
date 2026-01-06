---
title: exportBegin
page_title: exportBegin event
description: "Called before exporting the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `format` (string), `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default export))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/exportbegin
published: True
reportingArea: React
---

# The `exportBegin` event of the React Report Viewer

Called before exporting the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `format` (string), `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default export)).

## Example

    ````JavaScript
// Export begin handler<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  exportBegin={(e, args) => {    console.log("Exporting report in format: " + args.format);  }}/>
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.

