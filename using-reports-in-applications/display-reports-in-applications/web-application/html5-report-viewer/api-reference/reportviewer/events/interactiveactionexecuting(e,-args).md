---
title: interactiveActionExecuting(e, args)
page_title: interactiveActionExecuting(e, args) | for Telerik Reporting Documentation
description: interactiveActionExecuting(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionexecuting(e,-args)
tags: interactiveactionexecuting(e,,args)
published: True
position: 12
---

# interactiveActionExecuting(e, args)



## 

Occurs before an interactive action is executed, providing the ability to cancel the execution.

Parameters:


| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively  [jQuery's event.data](https://api.jquery.com/event.data/) . e.data.sender is the report viewer that raised the event.|
| __args__ |An object with the following properties:<br/>*  *element* - the DOM element that triggered the action.<br/>*  *action* - the current __action__ instance.<br/>*  *cancel* - a flag that determines if the further processing of the action should be canceled or not|




	
````js
  // $(handler) is jQuery's shorthand for $(document).ready(handler)
  $(function () {
    $("#reportViewer1").telerik_ReportViewer({
      serviceUrl: "api/reports/",
      reportSource: {
          report: "Telerik.Reporting.Examples.CSharp.ProductSales, CSharp.ReportLibrary"
      },
      interactiveActionExecuting: function(e, args) {         
          if (args.action.Type === 'navigateToReport') {
              args.cancel = !confirm("You are about to navigate to report "+args.action.Value.Report + ".\r\n\nContinue?");
          }
      }
  });
````



# See Also


 * [ReportViewer events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%})

 * [Interactive actions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/interactive-actions%})
