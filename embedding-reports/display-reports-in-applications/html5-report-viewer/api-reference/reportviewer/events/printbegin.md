---
title: printBegin
page_title: printBegin event
description: "Called before printing the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default render and print operation))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/printbegin
published: True
reportingArea: HTML5
---

# The `printBegin` event of the HTML5 Report Viewer

Called before printing the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default render and print operation)).

## Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: {    report: "Dashboard.trdp"  },  printBegin: function(e, args) {    // This event handler will be called before printing the report.    // 'e.data.sender' is the report viewer instance.    // 'args.deviceInfo' contains the print device info.    console.log("About to print the report.");  }});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.

