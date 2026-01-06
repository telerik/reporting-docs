---
title: printEnd
page_title: printEnd event
description: "Called after printing the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `url` (string), and `handled` (boolean))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/printend
published: True
reportingArea: React
---

# The `printEnd` event of the React Report Viewer

Called after printing the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `url` (string), and `handled` (boolean)).

## Example

````JavaScript
// Print end handler<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  printEnd={(e, args) => {    console.log("The printed report can be found at " + args.url);  }}/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.

