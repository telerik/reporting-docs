---
title: ready
page_title: ready event
description: "A callback function that is called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations. The function is executed in the context of the ReportViewer object (i.e., inside the callback, `this` refers to the ReportViewer instance)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/ready
published: True
reportingArea: HTML5
---

# The `ready` event of the HTML5 Report Viewer

A callback function that is called when the viewer content has been loaded from the template and is ready to display reports or perform any other operations. The function is executed in the context of the ReportViewer object (i.e., inside the callback, `this` refers to the ReportViewer instance).

## Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  ready: function() {
    // 'this' refers to the ReportViewer instance
  }
});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.

## See Also

* [Events Overview]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/overview%})
* [renderingBegin]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingbegin%})
* [renderingEnd]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingend%})

