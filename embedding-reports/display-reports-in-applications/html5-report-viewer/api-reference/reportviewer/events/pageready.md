---
title: pageReady
page_title: pageReady event
description: "Called after a page of the report is ready. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with property: `pageContent` (string), the content of the rendered report page as a resource)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/pageready
published: True
reportingArea: HTML5
---

# The `pageReady` event of the HTML5 Report Viewer

Called after a page of the report is ready. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with property: `pageContent` (string), the content of the rendered report page as a resource).

## Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: {    report: "Dashboard.trdp"  },  pageReady: function(e, args) {    // This event handler will be called after a page of the report is ready.    // 'e.data.sender' is the report viewer instance.    // 'args.pageContent' is the content of the rendered page.    console.log("The content of the page is: " + args.pageContent);  }});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.



