---
title: exportEnd(e, args)
page_title: exportEnd(e, args) | for Telerik Reporting Documentation
description: exportEnd(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportend(e,-args)
tags: exportend(e,,args)
published: True
position: 3
---

# exportEnd(e, args)



Occurs after exporting the report.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/) . e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<br/>*  *url* - the url of the exported report as a resource.<br/>*  *format* - the document format of the exported report.<br/>*  *handled* - prevent the default export operation. Default value: false.<br/>*  *windowOpenTarget* - change target attribute specifying where to open the browser window. Default value is _self|

    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
    },
    exportEnd: function(e, args) {
      args.windowOpenTarget = "_blank";
      console.log("This event handler will be called after exporting the report.");
      console.log("The exported report can be found at " + args.url);
    }
});
````

## Event Binding

