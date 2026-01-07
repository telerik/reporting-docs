---
title: sendEmailBegin
page_title: sendEmailBegin event
description: "Called before the report is exported and the E-mail message is sent. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `deviceInfo` (object), `handled` (boolean, set to true to prevent the default export and send email operations), and `format` (string, the document format of the sent report))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailbegin
published: True
reportingArea: HTML5
---

# The `sendEmailBegin` event of the HTML5 Report Viewer

Called before the report is exported and the E-mail message is sent. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `deviceInfo` (object), `handled` (boolean, set to true to prevent the default export and send email operations), and `format` (string, the document format of the sent report)).

## Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  sendEmailBegin: function(e, args) {
    // This event handler will be called before exporting the report and sending the E-mail message.
    // 'e.data.sender' is the report viewer instance.
    // 'args.format' is the export format.
    console.log("About to export and send report in format: " + args.format);
  }
});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.



