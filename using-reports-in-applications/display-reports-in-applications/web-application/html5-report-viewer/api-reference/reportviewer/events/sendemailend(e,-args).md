---
title: sendEmailEnd(e, args)
page_title: sendEmailEnd(e, args) | for Telerik Reporting Documentation
description: sendEmailEnd(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailend(e,-args)
tags: sendemailend(e,,args)
published: True
position: 5
---

# sendEmailEnd(e, args)



Occurs after the report is exported and before the E-mail message is sent.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/) . e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<br/>*  *handled* - prevent the default send email operation. Default value: false.<br/>*  *from* - E-mail address used for the E-mail message FROM value.<br/>*  *to* - E-mail address used for the E-mail message TO value.<br/>*  *cc* - E-mail address used for the E-mail message Carbon Copy value.<br/>*  *format* - the document format of the sent report.<br/>*  *subject* - the subject of the sent E-mail message.<br/>*  *body* - the content of the sent E-mail message.<br/>*  *url* - the url of the sent report document as a resource|

    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
    },
    sendEmailEnd: function(e, args) {
      args.format = "XLS";
      console.log("This event handler will be called after exporting the report.");
      console.log("The exported report can be found at " + args.url);
    }
});
````

## Event Binding

