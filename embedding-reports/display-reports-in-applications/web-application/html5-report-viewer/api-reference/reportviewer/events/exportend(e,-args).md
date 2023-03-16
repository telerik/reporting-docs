---
title: exportEnd(e, args)
page_title: The exportEnd(e, args) Event of the HTML5 Report Viewer explained
description: "Learn more about the exportEnd(e, args) Event of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportend(e,-args)
tags: exportend(e,,args)
published: True
position: 3
previous_url: /html5-report-viewer-reportviewer-events-exportend
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# The `exportEnd(e, args)` Event of the HTML5 Report Viewer

Occurs after exporting the report.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the  [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively [jQuery's event.data](https://api.jquery.com/event.data/).<br/>e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<ul><li>*url* - the url of the exported report as a resource.</li><li>*format* - the document format of the exported report.</li><li>*handled* - prevent the default export operation. Default value: *false*.</li><li>*windowOpenTarget* - change target attribute specifying where to open the browser window. Default value is *self*.</li></ul>|

````JavaScript
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
	$("#reportViewer1").telerik_ReportViewer({
		serviceUrl: "api/reports/",
		reportSource: {
			report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
		},
		exportEnd: function(e, args) {
			args.windowOpenTarget = "_blank";
			console.log("This event handler will be called after exporting the report.");
			console.log("The exported report can be found at " + args.url);
		}
	});
});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the bind method. For a complete list of binding options during initialization please check [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). For a complete list of all event names exposed through telerikReportViewer.Events please check [telerikReportViewer Namespace, Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%}).
