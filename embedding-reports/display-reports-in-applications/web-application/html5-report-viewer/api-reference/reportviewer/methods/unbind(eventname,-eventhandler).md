---
title: unbind(eventName, eventHandler)
page_title: The unbind(eventName, eventHandler) method of the HTML5 Report Viewer
description: "Learn more about the unbind(eventName, eventHandler) method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind(eventname,-eventhandler)
tags: unbind(eventname,,eventhandler)
published: True
reportingArea: HTML5
position: 17
previous_url: /html5-report-viewer-reportviewer-methods-unbind-en-eh, /embedding-reports/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind(eventname%2c-eventhandler)
---

# The `unbind(eventName, eventHandler)` method of the HTML5 Report Viewer

Unbinds event handlers from the specified event.

````JavaScript
function onPageReady(e) {
	console.log('page ready!');
}

var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.bind(telerikReportViewer.Events.PAGE_READY, onPageReady);

// later
reportViewer.unbind(telerikReportViewer.Events.PAGE_READY, onPageReady);
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})
