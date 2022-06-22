---
title: unbind(eventName, eventHandler)
page_title: unbind(eventName, eventHandler) 
description: unbind(eventName, eventHandler)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind(eventname,-eventhandler)
tags: unbind(eventname,,eventhandler)
published: True
position: 17
---

# unbind(eventName, eventHandler)

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

