---
title: exportBegin
page_title: exportBegin event
description: "Called before exporting the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `format` (string), `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default export))."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportbegin
published: True
reportingArea: HTML5
---

# The `exportBegin` event of the HTML5 Report Viewer

Called before exporting the report. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `format` (string), `deviceInfo` (object), and `handled` (boolean, set to true to prevent the default export)).

## Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: {    report: "Dashboard.trdp"  },  exportBegin: function(e, args) {    // This event handler will be called before exporting the report.    // 'e.data.sender' is the report viewer instance.    // 'args.format' is the export format.    console.log("Exporting report in format: " + args.format);  }});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.

