---
title: printEnd(e, args)
page_title: printEnd(e, args) | for Telerik Reporting Documentation
description: printEnd(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/printend(e,-args)
tags: printend(e,,args)
published: True
position: 8
---

# printEnd(e, args)



Occurs after printing the report.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/) . e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<br/>*  *url* - the url of the printed report as a resource.<br/>*  *handled* - prevent the default print operation. Default value: false|

    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
    },
    printEnd: function(e, args) {
      console.log("This event handler will be called after printing the report.");
      console.log("The printed report can be found at " + args.url);
    }
});
````

## Event Binding

