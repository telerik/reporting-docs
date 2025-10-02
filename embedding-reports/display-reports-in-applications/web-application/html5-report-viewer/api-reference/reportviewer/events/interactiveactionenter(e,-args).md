---
title: interactiveActionEnter(e, args)
page_title: The interactiveActionEnter(e, args) Event of the HTML5 Report Viewer
description: "Learn more about the interactiveActionEnter(e, args) Event of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/interactiveactionenter(e,-args)
tags: interactiveactionenter(e,,args)
published: True
reporting_area: HTML5
position: 13
previous_url: /html5-report-viewer-reportviewer-events-interactiveactionenter
---

<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 85%;
}
</style>

# The `interactiveActionEnter(e, args)` Event of the HTML5 Report Viewer

Occurs when the mouse cursor enters the area of an interactive action.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively [jQuery's event.data](https://api.jquery.com/event.data/).<br/>e.data.sender is the report viewer that raised the event.|
| __args__ |An object with the following properties:<ul><li>*element* - the DOM element that triggered the action.</li><li>*action* - the current __action__ instance.</li></ul>|

````JavaScript
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
});
````

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
* [ReportViewer events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%})
* [Interactive actions]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/interactive-actions%})
