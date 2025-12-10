---
title: unbind(eventName)
page_title: The unbind(eventName) method of the HTML5 Report Viewer explained
description: "Learn more about the unbind(eventName) method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind(eventname)
tags: unbind(eventname)
published: True
reportingArea: HTML5
position: 16
previous_url: /html5-report-viewer-reportviewer-methods-unbind-en
---

# The `unbind(eventName)` method of the HTML5 Report Viewer

Unbinds event handlers from the specified event.

````JavaScript
function onPageReady(e) {
	console.log('page ready!');
}
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.bind(telerikReportViewer.Events.PAGE_READY, onPageReady);
reportViewer.bind(telerikReportViewer.Events.PAGE_READY, function (e) {
	console.log('page ready from anonymous function');
});

// later
reportViewer.unbind(telerikReportViewer.Events.PAGE_READY); // this will unbind ALL event handlers, including the anonymous.
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
