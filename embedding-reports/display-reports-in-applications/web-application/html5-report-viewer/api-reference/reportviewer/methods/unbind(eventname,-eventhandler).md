---
title: unbind(eventName, [eventHandler])
page_title: The unbind(eventName, [eventHandler]) method of the HTML5 Report Viewer explained
description: "Learn more about the unbind(eventName, [eventHandler]) method of the HTML5 Report Viewer and how to use it to customize the viewer's behavior."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/unbind(eventname,-eventhandler)
tags: unbind
published: True
reportingArea: HTML5
position: 3
---

# The `unbind(eventName, [eventHandler])` method of the HTML5 Report Viewer

Unbinds an event handler from a viewer event.

Returns: the current *void* object.

````JavaScript
// Unbind all handlers from the 'error' eventvar viewer = $("#reportViewer1").data("telerik_ReportViewer");viewer.unbind(telerikReportViewer.Events.ERROR);
````


## See Also

* [HTML5 Report Viewer]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/overview%})

