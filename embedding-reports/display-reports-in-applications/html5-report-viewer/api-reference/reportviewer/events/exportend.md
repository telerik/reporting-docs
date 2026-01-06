---
title: exportEnd
page_title: exportEnd event
description: "Called after exporting the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `url` (string, the exported report resource URL), `format` (string), `handled` (boolean, set to true to prevent the default export operation), and `windowOpenTarget` (string, target attribute for opening the exported document, default is \"self\"))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportend
published: True
reportingArea: HTML5
---

# The `exportEnd` event of the HTML5 Report Viewer

Called after exporting the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `url` (string, the exported report resource URL), `format` (string), `handled` (boolean, set to true to prevent the default export operation), and `windowOpenTarget` (string, target attribute for opening the exported document, default is "self")).

## Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: {    report: "Dashboard.trdp"  },  exportEnd: function(e, args) {    // This event handler will be called after exporting the report.    // 'e.data.sender' is the report viewer instance.    // 'args.url' is the exported report resource URL.    args.windowOpenTarget = "_blank";    console.log("The exported report can be found at " + args.url);  }});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.



