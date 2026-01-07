---
title: viewerToolTipOpening
page_title: viewerToolTipOpening event
description: "Called before a tooltip is opened, allowing cancellation. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `element` (DOM element), `toolTip` (object with `title` and `text`), and `cancel` (boolean, set to true to cancel the tooltip)."
slug: telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/events/viewertooltipopening
published: True
reportingArea: HTML5
---

# The `viewerToolTipOpening` event of the HTML5 Report Viewer

Called before a tooltip is opened, allowing cancellation. Receives two parameters: `e` (the jQuery.Event object; `e.data.sender` is the report viewer instance) and `args` (an object with properties: `element` (DOM element), `toolTip` (object with `title` and `text`), and `cancel` (boolean, set to true to cancel the tooltip).

## Example

````JavaScript
$("#reportViewer1").telerik_ReportViewer({
  serviceUrl: "api/reports/",
  reportSource: {
    report: "Dashboard.trdp"
  },
  viewerToolTipOpening: function(e, args) {
    // This event handler will be called before a tooltip is opened.
    // 'e.data.sender' is the report viewer instance.
    // 'args.toolTip.title' is the tooltip title.
    // 'args.cancel' can be set to true to cancel the tooltip.
    // Example: disable tooltip if title contains '2004'
    args.cancel = (/2004/i.test(args.toolTip.title));
  }
});
````

## Event Binding

The report viewer currently exposes two ways for binding event handlers to events. You may attach event handlers when you instantiate the report viewer, or after that, using the [bind]({%slug telerikreporting/using-reports-in-applications/display-reports-in-applications/web-application/html5-report-viewer/api-reference/reportviewer/methods/bind%}) method.



