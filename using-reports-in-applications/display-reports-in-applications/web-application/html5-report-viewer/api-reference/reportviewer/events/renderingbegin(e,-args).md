---
title: renderingBegin(e, args)
page_title: renderingBegin(e, args) | for Telerik Reporting Documentation
description: renderingBegin(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingbegin(e,-args)
tags: renderingbegin(e,,args)
published: True
position: 9
---

# renderingBegin(e, args)



## 

Occurs before rendering the report.

Parameters:


| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/) . e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<br/>*  *deviceInfo* - the device info that will be used for the render operation|




	
````js
  // $(handler) is jQuery's shorthand for $(document).ready(handler)
  $(function () {
    $("#reportViewer1").telerik_ReportViewer({
      serviceUrl: "api/reports/",
      reportSource: {
          report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
      },
      renderingBegin: function(e) { console.log("This event handler will be called before rendering the report."); }
  });
````



## Event Binding
