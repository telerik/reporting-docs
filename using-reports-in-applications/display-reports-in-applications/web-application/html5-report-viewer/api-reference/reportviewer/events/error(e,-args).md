---
title: error(e, args)
page_title: error(e, args) | for Telerik Reporting Documentation
description: error(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/error(e,-args)
tags: error(e,,args)
published: True
position: 1
---

# error(e, args)

Parameters:


| Parameter | Description |
| ------ | ------ |
| __e__ |This is the [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively [jQuery's event.data](https://api.jquery.com/event.data/).<br/>e.data.sender is the report viewer that raised the event.|
| __args__ |A string containing the error message.|


    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
    },
    error: function(e, args) {
      console.log("This event handler will be called after a page of the report is ready.");
      console.log("The error message is: " + args);
    }
});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the bind method. For a complete list of binding options during initialization please check [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). For a complete list of all event names exposed through telerikReportViewer.Events please check [telerikReportViewer Namespace, Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%}).
