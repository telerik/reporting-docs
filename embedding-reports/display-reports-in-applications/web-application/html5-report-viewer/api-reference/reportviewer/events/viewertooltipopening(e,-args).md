---
title: viewerToolTipOpening(e, args)
page_title: The viewerToolTipOpening(e, args) Event of the HTML5 Report Viewer
description: "Learn more about the viewerToolTipOpening(e, args) Event of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/viewertooltipopening(e,-args)
tags: viewertooltipopening,args
published: True
reportingArea: HTML5
position: 15
previous_url: /html5-report-viewer-reportviewer-events-viewertooltipopening
---

<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 85%;
}
</style>

# The `viewerToolTipOpening(e, args)` Event of the HTML5 Report Viewer

The event occurs before a tooltip is opened, providing the ability to cancel its opening.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively [jQuery's event.data](https://api.jquery.com/event.data/).<br/>e.data.sender is the report viewer that raised the event.|
| __args__ |An object with the following properties:<ul><li>*element* - the DOM element that caused the tooltip opening.</li><li>*toolTip* - the current __toolTip__ instance. Consists of __title__ and __text__ fields.</li><li>*cancel* - a flag that determines if the further processing of the action should be canceled or not.</li></ul>|

````JavaScript
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
		}
	});
});
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
