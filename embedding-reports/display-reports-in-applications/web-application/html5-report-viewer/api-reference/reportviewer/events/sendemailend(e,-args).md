---
title: sendEmailEnd(e, args)
page_title: The sendEmailEnd(e, args) Event of the HTML5 Report Viewer explained
description: "Learn more about the sendEmailEnd(e, args) Event of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/sendemailend(e,-args)
tags: sendemailend,args
published: True
reporting_area: HTML5
position: 5
previous_url: /html5-report-viewer-reportviewer-events-sendemailend
---

<style>
table th:first-of-type {
	width: 25%;
}
table th:nth-of-type(2) {
	width: 75%;
}
</style>

# The `sendEmailEnd(e, args)` Event of the HTML5 Report Viewer

Occurs after the report is exported and before the E-mail message is sent.

Parameters:

| Parameter | Description |
| ------ | ------ |
| __e__ |This is the [jQuery.Event object](https://api.jquery.com/category/events/event-object/) and e.data is respectively [jQuery's event.data](https://api.jquery.com/event.data/).<br/>e.data.sender is the report viewer that raised the event.|
| __args__ |An object with properties:<ul><li>*handled* - prevent the default send email operation. Default value: false.</li><li>*from* - E-mail address used for the E-mail message FROM value.</li><li>*to* - E-mail address used for the E-mail message TO value.</li><li>*cc* - E-mail address used for the E-mail message Carbon Copy value.</li><li>*format* - the document format of the sent report.</li><li>*subject* - the subject of the sent E-mail message.</li><li>*body* - the content of the sent E-mail message.</li><li>*url* - the url of the sent report document as a resource.</li></ul>|

````JavaScript
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
	$("#reportViewer1").telerik_ReportViewer({
		serviceUrl: "api/reports/",
		reportSource: {
			report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
		},
		sendEmailEnd: function(e, args) {
			args.format = "XLS";
			console.log("This event handler will be called after exporting the report.");
			console.log("The exported report can be found at " + args.url);
		}
	});
});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the bind method. For a complete list of binding options during initialization please check [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). For a complete list of all event names exposed through telerikReportViewer.Events please check [telerikReportViewer Namespace, Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%}).

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
