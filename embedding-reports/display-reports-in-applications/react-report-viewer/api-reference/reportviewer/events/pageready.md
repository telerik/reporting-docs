---
title: pageReady
page_title: pageReady event
description: "Called after a page of the report is ready. Receives two parameters: `e` (the event object) and `args` (an object with property: `pageContent` (string))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/events/pageready
published: True
reportingArea: React
---

# The `pageReady` event of the React Report Viewer

Called after a page of the report is ready. Receives two parameters: `e` (the event object) and `args` (an object with property: `pageContent` (string)).

## Example

    ````JavaScript
// Page ready handler<TelerikReportViewer  serviceUrl="api/reports/"  reportSource={{ report: "Dashboard.trdp" }}  pageReady={(e, args) => {    console.log("The content of the page is: " + args.pageContent);  }}/>
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/react-report-viewer/api-reference/reportviewer/methods/bind%}) method.

