---
title: bind
page_title: The bind method of the HTML5 Report Viewer explained
description: "Learn more about the bind method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind
tags: bind
published: True
reportingArea: HTML5
position: 14
---

# The `bind` method of the HTML5 Report Viewer

Binds event handlers to the specified event.

## Example

````JavaScript
// Bind to the 'pageReady' eventvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.bind(telerikReportViewer.Events.PAGE_READY, function(e, args) {  console.log("Page is ready!", args);});
````

````JavaScript
// Bind to the 'error' eventvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.bind(telerikReportViewer.Events.ERROR, function(e, args) {  alert("An error occurred: " + args);});
````


