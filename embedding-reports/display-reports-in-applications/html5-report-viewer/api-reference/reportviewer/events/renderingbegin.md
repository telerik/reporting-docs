---
title: renderingBegin
page_title: renderingBegin event
description: "Called before rendering the report (preview only, not for export or print). Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with property: `deviceInfo` (object), the device info used for rendering)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/renderingbegin
published: True
reportingArea: HTML5
---

# The `renderingBegin` event of the HTML5 Report Viewer

Called before rendering the report (preview only, not for export or print). Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with property: `deviceInfo` (object), the device info used for rendering).

## Example

    ````JavaScript
$("#reportViewer1").telerik_ReportViewer({  serviceUrl: "api/reports/",  reportSource: {    report: "Dashboard.trdp"  },  renderingBegin: function(e, args) {    // This event handler will be called before rendering the report (preview).    // 'e.data.sender' is the report viewer instance.    // 'args.deviceInfo' contains the render device info.    // The deviceInfo property can be used to pass a specific culture to the REST Service so it renders the report with it.    const culture = "yourCulture";    args.deviceInfo["CurrentCulture"] = culture;    args.deviceInfo["CurrentUICulture"] = culture;    console.log("About to render the report.");  }});
````


## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.

