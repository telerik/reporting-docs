---
title: bind(eventName, eventHandler)
page_title: The bind(eventName, eventHandler) method of the HTML5 Report Viewer
description: "Learn more about the bind(eventName, eventHandler) method of the Telerik Reporting HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind(eventname,-eventhandler)
tags: bind(eventname,,eventhandler)
published: True
position: 4
previous_url: /html5-report-viewer-reportviewer-methods-bind-en-eh
---

# The `bind(eventName, eventHandler)` method of the HTML5 Report Viewer

Binds event handlers to the specified event.

````JavaScript
function onPageReady(e) {
  console.log('page ready!');
}
var reportViewer = $("#reportViewer1").data("telerik_ReportViewer");
reportViewer.bind(telerikReportViewer.Events.PAGE_READY, onPageReady);
````

