---
title: printEnd
page_title: printEnd event
description: "Called after printing the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `url` (string, the printed report resource URL), and `handled` (boolean, set to true to prevent the default print operation))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/printend
published: True
reportingArea: HTML5
---

# The `printEnd` event of the HTML5 Report Viewer

Called after printing the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `url` (string, the printed report resource URL), and `handled` (boolean, set to true to prevent the default print operation)).

## Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  printEnd: function(e, args) {
    // This event handler will be called after printing the report.
    // 'e.data.sender' is the report viewer instance.
    // 'args.url' is the printed report resource URL.
    console.log("The printed report can be found at " + args.url);
  }
});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.



