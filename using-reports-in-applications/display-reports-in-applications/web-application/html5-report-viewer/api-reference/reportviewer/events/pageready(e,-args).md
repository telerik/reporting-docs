---
title: pageReady(e, args)
page_title: pageReady(e, args) | for Telerik Reporting Documentation
description: pageReady(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/pageready(e,-args)
tags: pageready(e,,args)
published: True
position: 6
---

# pageReady(e, args)



Occurs after a page of the report is ready.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/). e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<br/>* *pageContent* - the page content of the rendered report as a resource.|

    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
    },
    pageReady: function(e, args) {
      console.log("This event handler will be called after a page of the report is ready.");
      console.log("The content of the page is: " + args.pageContent);
    }
});
````

## Event Binding

