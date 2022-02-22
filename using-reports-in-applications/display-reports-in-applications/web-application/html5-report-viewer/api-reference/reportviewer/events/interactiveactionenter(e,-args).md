---
title: interactiveActionEnter(e, args)
page_title: interactiveActionEnter(e, args) 
description: interactiveActionEnter(e, args)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionenter(e,-args)
tags: interactiveactionenter(e,,args)
published: True
position: 13
---
<style>
table th:first-of-type {
    width: 15%;
}
table th:nth-of-type(2) {
    width: 85%;
}
</style>

# interactiveActionEnter(e, args)

Occurs when the mouse cursor enters the area of an interactive action.

Parameters:


| Parameter | Description |
| ------ | ------ |
| __e__ |This is the [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively [jQuery's event.data](https://api.jquery.com/event.data/).<br/>e.data.sender is the report viewer that raised the event.|
| __args__ |An object with the following properties:<ul><li>*element* - the DOM element that triggered the action.</li><li>*action* - the current __action__ instance.</li></ul>|

    
````js
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
  $("#reportViewer1").telerik_ReportViewer({
    serviceUrl: "api/reports/",
    reportSource: {
        report: "Telerik.Reporting.Examples.CSharp.ProductSales, CSharp.ReportLibrary"
    },
    interactiveActionEnter: function(e, args) {
        $(args.element).css('font-weight', 'bolder');
    }
});
````


# See Also

* [ReportViewer events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%})

* [Interactive actions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/interactive-actions%})
