---
title: renderingEnd(e, args)
page_title: renderingEnd(e, args) | for Telerik Reporting Documentation
description: renderingEnd(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)
tags: renderingend(e,,args)
published: True
position: 10
---

# renderingEnd(e, args)



## 

Occurs after rendering the report.

Parameters:


| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/) . e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<br/>*  *bookmarkNodes* - an array of bookmark node object. Each bookmark node has an id, items, page and text.<br/>*  *documentMapAvailable* - true if the current report has document map. Otherwise false.<br/>*  *documentMapNodes* - nodes used in the document map.<br/>*  *documentReady* - the status of the rendered report.<br/>*  *pageCount* - the page count of the rendered report|




	
````js
  // $(handler) is jQuery's shorthand for $(document).ready(handler)
  $(function () {
    $("#reportViewer1").telerik_ReportViewer({
      serviceUrl: "api/reports/",
      reportSource: {
          report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
      },
      renderingEnd: function(e, args) { 
        console.log("This event handler will be called after rendering the report."); 
        console.log("The rendered report is " + (args.documentReady ? "" : "not") + " ready."); 
        console.log("The rendered report has " + args.pageCount + " pages.");
        console.log("The rendered report " + (args.documentMapAvailable ? "has" : "does not have") + " document map.");
        console.log("The rendered report has " + args.bookmarkNodes.length + " nodes");
      }
  });
````



## Event Binding
