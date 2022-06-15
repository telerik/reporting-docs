---
title: unbind(eventName)
page_title: unbind(eventName) 
description: unbind(eventName)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind(eventname)
tags: unbind(eventname)
published: True
position: 16
---

# unbind(eventName)

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

