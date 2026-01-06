---
title: error
page_title: error event
description: "Called when an error occurs. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (a string containing the error message)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/error
published: True
reportingArea: HTML5
---

# The `error` event of the HTML5 Report Viewer

Called when an error occurs. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (a string containing the error message).

## Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: {    report: "Dashboard.trdp"  },  error: function(e, args) {    // This event handler will be called when an error occurs.    // 'e.data.sender' is the report viewer instance.    console.log("The error message is: " + args);  }});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.



