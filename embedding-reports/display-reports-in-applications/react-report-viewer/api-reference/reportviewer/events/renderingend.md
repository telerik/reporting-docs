---
title: renderingEnd
page_title: renderingEnd event
description: "Called after rendering the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `bookmarkNodes` (array), `documentMapAvailable` (boolean), `documentMapNodes` (array), `documentReady` (boolean), and `pageCount` (number))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/renderingend
published: True
reportingArea: React
---

# The `renderingEnd` event of the React Report Viewer

Called after rendering the report. Receives two parameters: `e` (the event object) and `args` (an object with properties: `bookmarkNodes` (array), `documentMapAvailable` (boolean), `documentMapNodes` (array), `documentReady` (boolean), and `pageCount` (number)).

## Example

    ````JavaScript
// Rendering end handler<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  renderingEnd={(e, args) => {    console.log("The rendered report is " + (args.documentReady ? "" : "not ") + "ready.");    console.log("The rendered report has " + args.pageCount + " pages.");  }}/>
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.

