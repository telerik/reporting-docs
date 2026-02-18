---
title: exportBegin(e, args)
page_title: The exportBegin(e, args) Event of the HTML5 Report Viewer explained
description: "Learn more about the exportBegin(e, args) Event of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportbegin(e,-args)
tags: exportbegin(e,,args)
published: True
reportingArea: HTML5
position: 2
previous_url:
- /html5-report-viewer-reportviewer-events-exportbegin
- /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/exportbegin(e,-args)
---
<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# The `exportBegin(e, args)` Event of the HTML5 Report Viewer

Occurs before exporting the report.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively [jQuery's event.data](https://api.jquery.com/event.data/). e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<ul><li>*format* - the document format of the exported report.</li><li>*deviceInfo* - the device info that will be used for the export operation.</li><li>*handled* - prevent the default render and export operation. Default value: *false*.</li></ul>|

````JavaScript
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
	$("#reportViewer1").telerik_ReportViewer({
		serviceUrl: "api/reports/",
		reportSource: {
			report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
		},
		exportBegin: function(e) { console.log("This event handler will be called before exporting the report in" + arguments.format); }
	});
});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the bind method. For a complete list of binding options during initialization please check [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). For a complete list of all event names exposed through telerikReportViewer.Events please check [telerikReportViewer Namespace, Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%}).

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
