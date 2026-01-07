---
title: renderingEnd(e, args)
page_title: The renderingEnd(e, args) Event of the HTML5 Report Viewer explained
description: "Learn more about the renderingEnd(e, args) Event of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)
tags: renderingend,args
published: True
reportingArea: HTML5
position: 10
previous_url:
- /html5-report-viewer-reportviewer-events-renderingend
- /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend(e,-args)
---

<style>
table th:first-of-type {
	width: 15%;
}
table th:nth-of-type(2) {
	width: 85%;
}
</style>

# The `renderingEnd(e, args)` Event of the HTML5 Report Viewer

Occurs after rendering the report.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively [jQuery's event.data](https://api.jquery.com/event.data/).<br/>e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<ul><li>*bookmarkNodes* - an array of bookmark node object. Each bookmark node has an id, items, page and text.</li><li>*documentMapAvailable* - true if the current report has document map. Otherwise false.</li><li>*documentMapNodes* - nodes used in the document map.</li><li>*documentReady* - the status of the rendered report.</li><li>*pageCount* - the page count of the rendered report.</li></ul>|

````JavaScript
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

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the bind method. For a complete list of binding options during initialization please check [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). For a complete list of all event names exposed through telerikReportViewer.Events please check [telerikReportViewer Namespace, Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%}).

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
