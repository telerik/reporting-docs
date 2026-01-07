---
title: exportEnd
page_title: exportEnd event
description: "Called after exporting the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `url` (string), `format` (string), `handled` (boolean), and `windowOpenTarget` (string))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/exportend
published: True
reportingArea: React
---

# The `exportEnd` event of the React Report Viewer

Called after exporting the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `url` (string), `format` (string), `handled` (boolean), and `windowOpenTarget` (string)).

## Example

````JavaScript
// Export end handler
<TelerikReportViewer
  serviceUrl="api/reports/"
  reportSource={{ report: "Dashboard.trdp" }}
  exportEnd={(e, args) => {
    args.windowOpenTarget = "_blank";
    console.log("The exported report can be found at " + args.url);
  }}
/>
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.



