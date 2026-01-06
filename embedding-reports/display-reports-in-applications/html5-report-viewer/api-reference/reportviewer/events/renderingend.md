---
title: renderingEnd
page_title: renderingEnd event
description: "Called after rendering the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `bookmarkNodes` (array), `documentMapAvailable` (boolean), `documentMapNodes` (array), `documentReady` (boolean), and `pageCount` (number))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend
published: True
reportingArea: HTML5
---

# The `renderingEnd` event of the HTML5 Report Viewer

Called after rendering the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `bookmarkNodes` (array), `documentMapAvailable` (boolean), `documentMapNodes` (array), `documentReady` (boolean), and `pageCount` (number)).

## Example

    ````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: {    report: "Dashboard.trdp"  },  renderingEnd: function(e, args) {    // This event handler will be called after rendering the report.    // 'e.data.sender' is the report viewer instance.    // 'args.documentReady' is true if the report is ready.    // 'args.pageCount' is the number of pages.    // 'args.documentMapAvailable' is true if document map is available.    // 'args.bookmarkNodes' is an array of bookmark nodes.    console.log("The rendered report is " + (args.documentReady ? "" : "not ") + "ready.");    console.log("The rendered report has " + args.pageCount + " pages.");    console.log("The rendered report " + (args.documentMapAvailable ? "has" : "does not have") + " document map.");    console.log("The rendered report has " + args.bookmarkNodes.length + " nodes");  }});
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.

