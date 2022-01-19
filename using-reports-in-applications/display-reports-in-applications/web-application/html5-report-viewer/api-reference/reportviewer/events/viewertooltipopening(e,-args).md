---
title: viewerToolTipOpening(e, args)
page_title: viewerToolTipOpening(e, args) | for Telerik Reporting Documentation
description: viewerToolTipOpening(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/viewertooltipopening(e,-args)
tags: viewertooltipopening(e,,args)
published: True
position: 15
---

# viewerToolTipOpening(e, args)

The event occurs before a tooltip is opened, providing the ability to cancel its opening.

Parameters:


| Parameter | Description |
| ------ | ------ |
| __e__ |This is the [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively [jQuery's event.data](https://api.jquery.com/event.data/).<br/>e.data.sender is the report viewer that raised the event.|
| __args__ |An object with the following properties:<ul><li>*element* - the DOM element that caused the tooltip opening.</li><li>*toolTip* - the current __toolTip__ instance. Consists of __title__ and __text__ fields.</li><li>*cancel* - a flag that determines if the further processing of the action should be canceled or not.</li></ul>|


    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.ProductSales, CSharp.ReportLibrary"
    },
    viewerToolTipOpening: function(e, args)
    {
        //disable a tooltip that contains '2004' in its title
        args.cancel = (/2004/i.test(args.toolTip.title));
    },
});
````

