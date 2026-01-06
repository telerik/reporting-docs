---
title: sendEmailEnd
page_title: sendEmailEnd event
description: "Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `handled` (boolean, set to true to prevent the default send email operation), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string, the exported report resource URL))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailend
published: True
reportingArea: HTML5
---

# The `sendEmailEnd` event of the HTML5 Report Viewer

Called after the report is exported and before the E-mail message is sent. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `handled` (boolean, set to true to prevent the default send email operation), `from` (string), `to` (string), `cc` (string), `format` (string), `subject` (string), `body` (string), and `url` (string, the exported report resource URL)).

## Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: {    report: "Dashboard.trdp"  },  sendEmailEnd: function(e, args) {    // This event handler will be called after exporting the report and before sending the E-mail message.    // 'e.data.sender' is the report viewer instance.    // 'args.url' is the exported report resource URL.    args.format = "XLS";    console.log("The exported report can be found at " + args.url);  }});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.

