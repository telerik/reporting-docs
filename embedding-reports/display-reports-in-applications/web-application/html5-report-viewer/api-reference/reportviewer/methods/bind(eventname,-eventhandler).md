---
title: bind(eventName, eventHandler)
page_title: bind(eventName, eventHandler) 
description: bind(eventName, eventHandler)
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind(eventname,-eventhandler)
tags: bind(eventname,,eventhandler)
published: True
position: 4
previous_url: /html5-report-viewer-reportviewer-methods-bind-en-eh
---

# bind(eventName, eventHandler)

Binds event handlers to the specified event. 

    
````js
function onPageReady(e) {
  console.log('page ready!');
}
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.bind(telerikReportViewer.Events.PAGE_READY, onPageReady);
````

