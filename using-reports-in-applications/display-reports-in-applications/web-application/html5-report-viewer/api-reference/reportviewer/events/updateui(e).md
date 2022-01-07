---
title: updateUi(e)
page_title: updateUi(e) | for Telerik Reporting Documentation
description: updateUi(e)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/updateui(e)
tags: updateui(e)
published: True
position: 11
---

# updateUi(e)



## 

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/) . e.data.sender is the report viewer that raised the event|

    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
    },
    updateUi: function(e) { console.log("This event handler will be called when the state of the viewer changes."); }
});
````

## Event Binding
