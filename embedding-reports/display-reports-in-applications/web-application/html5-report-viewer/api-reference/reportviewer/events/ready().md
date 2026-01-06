---
title: ready()
page_title: The ready() Event of the HTML5 Report Viewer explained
description: "Learn more about the ready() Event of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready()
tags: ready,viewer,html5
published: True
reportingArea: HTML5
position: 0
previous_url: /html5-report-viewer-reportviewer-events-ready, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready()
---

# The `ready()` Event of the HTML5 Report Viewer

A callback function that will be called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations on it. The function is executed in the context of the ReportViewer object that is available through the __this__ object.

````JavaScript
// $(handler) is jQuery's shorthand for $(document).ready(handler)
$(function () {
	$("#reportViewer1").telerik_ReportViewer({
		serviceUrl: "api/reports/",
		reportSource: {
			report: "Telerik.Reporting.Examples.CSharp.Invoice, CSharp.ReportLibrary"
		},
		ready: function() {
		}
	});
});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the bind method. For a complete list of binding options during initialization please check [Report Viewer Initialization]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/report-viewer-initialization%}). For a complete list of all event names exposed through telerikReportViewer.Events please check [telerikReportViewer Namespace, Events]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/telerikreportviewer-namespace/events%}).

## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
