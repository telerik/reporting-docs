---
title: printBegin
page_title: printBegin event
description: "Called before printing the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `deviceInfo` (object), and `handled` (boolean))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/printbegin
published: True
reportingArea: React
---

# The `printBegin` event of the React Report Viewer

Called before printing the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `deviceInfo` (object), and `handled` (boolean)).

## Example

````JavaScript
// Print begin handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  printBegin={(e, args) => {
    console.log("About to print the report.");
  }}
/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.



