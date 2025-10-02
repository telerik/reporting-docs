---
title: Event Binding
page_title: Event Binding in HTML5 ReportViewer Explained
description: "Learn how to bind to and unbind from Client Events in the HTML5 Report Viewer in Telerik Reporting."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/event-binding
tags: event,binding
published: True
reporting_area: HTML5
position: 9
previous_url: /html5-report-viewer-event-binding
---

# Event Binding in the HTML5 Report Viewer

The HTML5 Report Viewer exposes the events listed in [Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%}). 

## Bind to a Report Viewer widget event

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the bind method. 

````JavaScript
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
	$("#reportViewer1").telerik_ReportViewer({
		serviceUrl: "api/reports/",
		reportSource: {
			report: "Report Catalog.trdp"
		},
		pageReady: function(e) { console.log("this event handler was attached in the constructor"); }
	});

	var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
	reportViewer.bind(telerikReportViewer.Events.PAGE_READY, function(e) {
		console.log("this event handler was attached using the bind method");
	});
});
````

For a complete list of event handler options please check [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}) and for a complete list of all event names exposed through telerikReportViewer.Events please check [Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%}).

The report viewer passes one argument to the event handler, the `Event` object. This is the [Event](https://api.jquery.com/category/events/event-object/) object implemented by the [jQuery](https://jquery.com/) library. The sender of the event is passed through [jQuery's event.data](https://api.jquery.com/event.data/) - `e.data.sender` and for all events, this is the report viewer.

## Unbind from a Report Viewer widget event

To unbind from a given event you must keep a reference to the event handler function and call the unbind method with this reference as an argument.

````JavaScript
function onPageReady(e) {
	console.log("page ready");
}
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
	$("#reportViewer1").telerik_ReportViewer({
		serviceUrl: "api/reports/",
		reportSource: {
			report: "Report Catalog.trdp"
		},
		pageReady: onPageReady
	});

	var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
	reportViewer.unbind(telerikReportViewer.Events.PAGE_READY, onPageReady);
});
````

To __unbind all event handlers__ from the event, call the unbind method with only one argument, the event name.

> You can unbind *anonymous* event handlers by calling the unbind method with one argument.


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
