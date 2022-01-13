---
title: exportBegin(e, args)
page_title: exportBegin(e, args) | for Telerik Reporting Documentation
description: exportBegin(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportbegin(e,-args)
tags: exportbegin(e,,args)
published: True
position: 2
---

# exportBegin(e, args)



Occurs before exporting the report.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/). e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<br/>* *format* - the document format of the exported report.<br/>* *deviceInfo* - the device info that will be used for the export operation.<br/>* *handled* - prevent the default render and export operation. Default value: false.|

    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
    },
    exportBegin: function(e) { console.log("This event handler will be called before exporting the report in" + arguments.format); }
});
````

## Event Binding

