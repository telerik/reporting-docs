---
title: updateUi
page_title: updateUi event
description: "Called when the state of the viewer changes. Receives one parameter: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/updateui
published: True
reportingArea: HTML5
---

# The `updateUi` event of the HTML5 Report Viewer

Called when the state of the viewer changes. Receives one parameter: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance).

## Example

    ````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: {    report: "Dashboard.trdp"  },  updateUi: function(e) {    // This event handler will be called when the state of the viewer changes.    // 'e.data.sender' is the report viewer instance.    console.log("Viewer UI state changed.");  }});
 /**
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.

