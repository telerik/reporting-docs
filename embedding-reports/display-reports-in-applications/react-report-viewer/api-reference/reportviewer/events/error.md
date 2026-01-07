---
title: error
page_title: error event
description: "Called when an error occurs. Receives two parameters: `e` (the event object) and `args` (a string containing the error message)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/error
published: True
reportingArea: React
---

# The `error` event of the React Report Viewer

Called when an error occurs. Receives two parameters: `e` (the event object) and `args` (a string containing the error message).

## Example

````JavaScript
// Error handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  error={(e, args) => {
    console.log("The error message is: " + args);
  }}
/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.



