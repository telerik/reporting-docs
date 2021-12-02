---
title: sendEmailBegin(e, args)
page_title: sendEmailBegin(e, args) | for Telerik Reporting Documentation
description: sendEmailBegin(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailbegin(e,-args)
tags: sendemailbegin(e,,args)
published: True
position: 4
---

# sendEmailBegin(e, args)



## 

Occurs before the report is exported and the E-mail message is sent.

Parameters:


| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/) . e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<br/>*  *deviceInfo* - the device info that will be used for the export document.<br/>*  *handled* - prevent the default export report and send email operations. Default value: false.<br/>*  *format* - the document format of the sent report document|




	
````js
  // $(handler) is jQuery's shorthand for $(document).ready(handler)
  $(function () {
    $("#reportViewer1").telerik_ReportViewer({
      serviceUrl: "api/reports/",
      reportSource: {
          report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
      },
      sendEmailBegin: function(e) { console.log("This event handler will be called before exporting the report in " + arguments.format + " and sending the E-mail message"); }
  });
````



## Event Binding
