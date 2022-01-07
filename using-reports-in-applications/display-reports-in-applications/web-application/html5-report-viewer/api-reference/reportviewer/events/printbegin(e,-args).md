---
title: printBegin(e, args)
page_title: printBegin(e, args) | for Telerik Reporting Documentation
description: printBegin(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/printbegin(e,-args)
tags: printbegin(e,,args)
published: True
position: 7
---

# printBegin(e, args)



## 

Occurs before printing the report.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/) . e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<br/>*  *deviceInfo* - the device info that will be used for the print operation.<br/>*  *handled* - prevent the default render and print operation. Default value: false|

    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
    },
    printBegin: function(e) { console.log("This event handler will be called before printing the report."); }
});
````

## Event Binding
