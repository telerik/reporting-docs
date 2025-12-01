---
title: bind(eventName, eventHandler)
page_title: The bind(eventName, eventHandler) method of the HTML5 Report Viewer explained
description: "Learn more about the bind(eventName, eventHandler) method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind(eventname,-eventhandler)
tags: bind
published: True
reportingArea: HTML5
position: 2
---

# The `bind(eventName, eventHandler)` method of the HTML5 Report Viewer

Binds event handlers to the specified event.

Returns: the current *void* object.

````JavaScript
// Bind to the 'pageReady' eventvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.bind(telerikReportViewer.Events.PAGE_READY, function(e, args) {  console.log("Page is ready!", args);});
````

````JavaScript
// Bind to the 'error' eventvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.bind(telerikReportViewer.Events.ERROR, function(e, args) {  alert("An error occurred: " + args);});
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})

